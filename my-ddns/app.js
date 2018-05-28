var UpdaterClient = require("ddns-updater");
var config = require('./config.json');
var updater = new UpdaterClient(config);
updater.on('ip:resolve:success', function (service, ip) {
  console.log('External IP resolved via ' + service + ' : ' + ip);
});
updater.on('ip:resolve:error', function (service, err) {
  console.log('Failed to resolve external IP: ');
  console.log(err);
});
updater.on('ip:change', function (newIP, oldIP) {
  console.log("IP changed from " + oldIP + " to " + newIP);
});
updater.on('update:success', function (domain) {
  console.log("updated: " + JSON.stringify(domain));
});
updater.on('update:error', function (err, domain) {
  console.log('Failed to update IP via ' + domain.service + ':');
  console.log(err);
});
updater.start();

