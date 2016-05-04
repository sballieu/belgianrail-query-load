var Transform = require('stream').Transform,
    LCClient = require('../clients/normal/lib/lc-client.js'),
    lcExecute = require('./LCClientExecutor'),
    queryServerExecute = require('./QueryServerExecutor'),
    util = require('util'),
    fs = require('fs'),
    usage = require('usage');

util.inherits(ExecuteQueryMixTransform, Transform);

function ExecuteQueryMixTransform (options) {
  Transform.call(this, {objectMode : true});
  this.T0 = new Date();
  this.options = {
    client : new LCClient(
        {enableCache: options.enableCache,
          "wheelchair_trips": "http://linkedconnections.me:3001/trips",
          "wheelchair_stops": "http://linkedconnections.me:3000/stops",
          "transfer_times": "http://linkedconnections.me:3002/transfers",
          entrypoints:[options.url]}
    ),
    url: options.url
  };
  if (options.type === "query-server") {
    this.executeQuery = queryServerExecute;
  } else {
    this.executeQuery = lcExecute;
  }
  this.summary = {
    config : options.name,
    startedAt: new Date(),
    totalNumberOfQueriesExecuted: 0,
  };
  //output CSV header
  console.log('"T","wha","connections scanned","connections MST","journey time","query execution time","Bytes transferred","number of requests","bytes per connection","ms per connection","%CPU"');
}

/** 
 * When this stream closes, output a summary of the statistics we were able to gather to a logfile
 */
ExecuteQueryMixTransform.prototype._flush = function (done) {
  var self = this;
  fs.appendFile("benchmark.log", JSON.stringify(self.summary) + '\n', function(err) {
    done(err);
  });
};

ExecuteQueryMixTransform.prototype._transform = function (object, encoding, done) {
  //skip invalid entries
  if (typeof object.T === "undefined" || !object.departureTime || object.departureTime == 'null') {
    done();
  } else {
    this.summary.totalNumberOfQueriesExecuted++;
    //Currently a hack to make sure the identifiers correspond
    object.departureStop = object.departureStop.replace('http://irail.be/stations/NMBS/00','');
    object.arrivalStop = object.arrivalStop.replace('http://irail.be/stations/NMBS/00','');
    object.wheelchair_accessible = object.wha;
    object.min_transfer_time = 60;
    var dTms = new Date() - this.T0;
    var waitingTime = (object.T * 1000 - dTms);
    var self = this;
    
    var printResult = function (result) {
      var pid = process.pid;
      usage.lookup(pid, function(error, r) {
        console.log(result.T + ',' + result.wha + ',' + result.connectionsProcessed + ',' + result.connectionsMST + ',' + result.journeyTime + ',' + result.queryDuration + ',' + result.httpTotalBytes + ',' + result.httpRequests + ',' +result.httpTotalBytes/result.connectionsProcessed + ',' + result.queryDuration/result.connectionsProcessed + ',' + r.cpu);
      });
    };

    var execute = function () {
      var time0 = new Date();
      self.executeQuery(object, self.options, function (result, error) {
        if (result && result.journeyTime) {
          result.queryDuration = new Date() - time0;
          printResult(result);
        }
      });
      done();
    };
    if (waitingTime > 0) {
      setTimeout(execute, waitingTime);
    } else {
      execute();
    }
  }
}

module.exports = ExecuteQueryMixTransform;
