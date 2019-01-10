    var assert = require('assert');
    var request = require('request');

    // UNIT test begin
    describe("points collection microservices", function() {
      it("it should GET points by the given id", function() {
       request({
       url: 'https://pointscollection-gse00010885.apaas.em3.oraclecloud.com/loyalty/v1/points/30001',
       method: 'GET',
       json: {}
        }, function(error, response, body) {
           assert.equal(response.statusCode, 200, '200 success call');
        });
      });

      it("it should POST points by the given id", function() {
       request({
       url: 'https://pointscollection-gse00010885.apaas.em3.oraclecloud.com/loyalty/v1/points/30001',
       method: 'POST',
       json: {}
        }, function(error, response, body) {
           assert.equal(response.statusCode, 200, '200 success call');
        });
      });

      it("it should GET coupon by the given id", function() {
       request({
       url: 'https://pointscollection-gse00010885.apaas.em3.oraclecloud.com/loyalty/v1/coupon/30001',
       method: 'GET',
       json: {}
        }, function(error, response, body) {
           assert.equal(response.statusCode, 200, '200 success call');
        });
      });

      it("it should consume coupon by the given id", function() {
       request({
       url: 'https://pointscollection-gse00010885.apaas.em3.oraclecloud.com/loyalty/v1/coupon/30001',
       method: 'POST',
       json: {}
        }, function(error, response, body) {
           assert.equal(response.statusCode, 200, '200 success call');
        });
      });

      it("it should GET reward activation status", function() {
        request({
            url: 'https://pointscollection-gse00010885.apaas.em3.oraclecloud.com/loyalty/v1/activatereward',
            method: 'GET',
            json: {}
        }, function(error, response, body) {
            assert.equal(response.statusCode, 200, '200 success call');
        });
      });

      it("should return 404", function() {
       request('https://pointscollection-gse00010885.apaas.em3.oraclecloud.com/random', function (error, response, body) {
       assert.equal(response.statusCode, 404, '404 error for random url');
        });
      })

    });
