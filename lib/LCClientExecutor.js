module.exports = function (object, options, callback) {
  options.client.query({
        "departureStop": object.departureStop,
        "arrivalStop": object.arrivalStop,
        "departureTime": object.departureTime,
        "wheelchair_accessible": object.wha,
        "min_transfer_time": 60 }
      , function (resultStream, source, connectionsStream) {
    var result = {
      T : object.T,
      wha : object.wha,
      connectionsMST : 0,
      connectionsProcessed : 0,
      httpRequests: 0,
      httpTotalBytes: 0
    };
    var resultFound = false;
    resultStream.on('result', function (path) {
       resultFound = true;;
       result.journeyTime = (path[path.length-1].arrivalTime - path[0].departureTime)/60000;
       callback(result);
    });
    options.client._http.on("request", function () {
      result.httpRequests++;
    });
    options.client._http.on("downloaded", function (data) {
      result.httpTotalBytes += data.totalBytes;
    });
    connectionsStream.on('data', function (data) {
      result.connectionsProcessed++;
      //No trip in Belgium should last longer than 4 hours: stop condition
      if ((data.departureTime - object.departureTime) > 2*60*60*1000) {
        source.close();
      }
    });
    resultStream.on('data', function (data) {
      result.connectionsMST++;
    });
    resultStream.on('error', function (e) {
       result.error = e;
    });
    resultStream.on('end', function () {
        if (!resultFound) {
         result.error = 'No result found for T' + object.T;
          callback();
       }
    });
  });
};
