library googleapis_beta.appengine.v1beta4.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis_beta/appengine/v1beta4.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request.finalize()
          .transform(convert.UTF8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.JSON.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(
    core.int status, core.Map headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

core.int buildCounterApiConfigHandler = 0;
buildApiConfigHandler() {
  var o = new api.ApiConfigHandler();
  buildCounterApiConfigHandler++;
  if (buildCounterApiConfigHandler < 3) {
    o.authFailAction = "foo";
    o.login = "foo";
    o.script = "foo";
    o.securityLevel = "foo";
    o.url = "foo";
  }
  buildCounterApiConfigHandler--;
  return o;
}

checkApiConfigHandler(api.ApiConfigHandler o) {
  buildCounterApiConfigHandler++;
  if (buildCounterApiConfigHandler < 3) {
    unittest.expect(o.authFailAction, unittest.equals('foo'));
    unittest.expect(o.login, unittest.equals('foo'));
    unittest.expect(o.script, unittest.equals('foo'));
    unittest.expect(o.securityLevel, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterApiConfigHandler--;
}

core.int buildCounterApiEndpointHandler = 0;
buildApiEndpointHandler() {
  var o = new api.ApiEndpointHandler();
  buildCounterApiEndpointHandler++;
  if (buildCounterApiEndpointHandler < 3) {
    o.scriptPath = "foo";
  }
  buildCounterApiEndpointHandler--;
  return o;
}

checkApiEndpointHandler(api.ApiEndpointHandler o) {
  buildCounterApiEndpointHandler++;
  if (buildCounterApiEndpointHandler < 3) {
    unittest.expect(o.scriptPath, unittest.equals('foo'));
  }
  buildCounterApiEndpointHandler--;
}

buildUnnamed2257() {
  var o = new core.List<api.UrlDispatchRule>();
  o.add(buildUrlDispatchRule());
  o.add(buildUrlDispatchRule());
  return o;
}

checkUnnamed2257(core.List<api.UrlDispatchRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUrlDispatchRule(o[0]);
  checkUrlDispatchRule(o[1]);
}

core.int buildCounterApplication = 0;
buildApplication() {
  var o = new api.Application();
  buildCounterApplication++;
  if (buildCounterApplication < 3) {
    o.codeBucket = "foo";
    o.dispatchRules = buildUnnamed2257();
    o.id = "foo";
    o.location = "foo";
    o.name = "foo";
  }
  buildCounterApplication--;
  return o;
}

checkApplication(api.Application o) {
  buildCounterApplication++;
  if (buildCounterApplication < 3) {
    unittest.expect(o.codeBucket, unittest.equals('foo'));
    checkUnnamed2257(o.dispatchRules);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.location, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterApplication--;
}

core.int buildCounterAutomaticScaling = 0;
buildAutomaticScaling() {
  var o = new api.AutomaticScaling();
  buildCounterAutomaticScaling++;
  if (buildCounterAutomaticScaling < 3) {
    o.coolDownPeriod = "foo";
    o.cpuUtilization = buildCpuUtilization();
    o.maxConcurrentRequests = 42;
    o.maxIdleInstances = 42;
    o.maxPendingLatency = "foo";
    o.maxTotalInstances = 42;
    o.minIdleInstances = 42;
    o.minPendingLatency = "foo";
    o.minTotalInstances = 42;
  }
  buildCounterAutomaticScaling--;
  return o;
}

checkAutomaticScaling(api.AutomaticScaling o) {
  buildCounterAutomaticScaling++;
  if (buildCounterAutomaticScaling < 3) {
    unittest.expect(o.coolDownPeriod, unittest.equals('foo'));
    checkCpuUtilization(o.cpuUtilization);
    unittest.expect(o.maxConcurrentRequests, unittest.equals(42));
    unittest.expect(o.maxIdleInstances, unittest.equals(42));
    unittest.expect(o.maxPendingLatency, unittest.equals('foo'));
    unittest.expect(o.maxTotalInstances, unittest.equals(42));
    unittest.expect(o.minIdleInstances, unittest.equals(42));
    unittest.expect(o.minPendingLatency, unittest.equals('foo'));
    unittest.expect(o.minTotalInstances, unittest.equals(42));
  }
  buildCounterAutomaticScaling--;
}

core.int buildCounterBasicScaling = 0;
buildBasicScaling() {
  var o = new api.BasicScaling();
  buildCounterBasicScaling++;
  if (buildCounterBasicScaling < 3) {
    o.idleTimeout = "foo";
    o.maxInstances = 42;
  }
  buildCounterBasicScaling--;
  return o;
}

checkBasicScaling(api.BasicScaling o) {
  buildCounterBasicScaling++;
  if (buildCounterBasicScaling < 3) {
    unittest.expect(o.idleTimeout, unittest.equals('foo'));
    unittest.expect(o.maxInstances, unittest.equals(42));
  }
  buildCounterBasicScaling--;
}

core.int buildCounterContainerInfo = 0;
buildContainerInfo() {
  var o = new api.ContainerInfo();
  buildCounterContainerInfo++;
  if (buildCounterContainerInfo < 3) {
    o.image = "foo";
    o.sha256 = "foo";
  }
  buildCounterContainerInfo--;
  return o;
}

checkContainerInfo(api.ContainerInfo o) {
  buildCounterContainerInfo++;
  if (buildCounterContainerInfo < 3) {
    unittest.expect(o.image, unittest.equals('foo'));
    unittest.expect(o.sha256, unittest.equals('foo'));
  }
  buildCounterContainerInfo--;
}

core.int buildCounterCpuUtilization = 0;
buildCpuUtilization() {
  var o = new api.CpuUtilization();
  buildCounterCpuUtilization++;
  if (buildCounterCpuUtilization < 3) {
    o.aggregationWindowLength = "foo";
    o.targetUtilization = 42.0;
  }
  buildCounterCpuUtilization--;
  return o;
}

checkCpuUtilization(api.CpuUtilization o) {
  buildCounterCpuUtilization++;
  if (buildCounterCpuUtilization < 3) {
    unittest.expect(o.aggregationWindowLength, unittest.equals('foo'));
    unittest.expect(o.targetUtilization, unittest.equals(42.0));
  }
  buildCounterCpuUtilization--;
}

buildUnnamed2258() {
  var o = new core.Map<core.String, api.FileInfo>();
  o["x"] = buildFileInfo();
  o["y"] = buildFileInfo();
  return o;
}

checkUnnamed2258(core.Map<core.String, api.FileInfo> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFileInfo(o["x"]);
  checkFileInfo(o["y"]);
}

buildUnnamed2259() {
  var o = new core.List<api.SourceReference>();
  o.add(buildSourceReference());
  o.add(buildSourceReference());
  return o;
}

checkUnnamed2259(core.List<api.SourceReference> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSourceReference(o[0]);
  checkSourceReference(o[1]);
}

core.int buildCounterDeployment = 0;
buildDeployment() {
  var o = new api.Deployment();
  buildCounterDeployment++;
  if (buildCounterDeployment < 3) {
    o.container = buildContainerInfo();
    o.files = buildUnnamed2258();
    o.sourceReferences = buildUnnamed2259();
  }
  buildCounterDeployment--;
  return o;
}

checkDeployment(api.Deployment o) {
  buildCounterDeployment++;
  if (buildCounterDeployment < 3) {
    checkContainerInfo(o.container);
    checkUnnamed2258(o.files);
    checkUnnamed2259(o.sourceReferences);
  }
  buildCounterDeployment--;
}

core.int buildCounterErrorHandler = 0;
buildErrorHandler() {
  var o = new api.ErrorHandler();
  buildCounterErrorHandler++;
  if (buildCounterErrorHandler < 3) {
    o.errorCode = "foo";
    o.mimeType = "foo";
    o.staticFile = "foo";
  }
  buildCounterErrorHandler--;
  return o;
}

checkErrorHandler(api.ErrorHandler o) {
  buildCounterErrorHandler++;
  if (buildCounterErrorHandler < 3) {
    unittest.expect(o.errorCode, unittest.equals('foo'));
    unittest.expect(o.mimeType, unittest.equals('foo'));
    unittest.expect(o.staticFile, unittest.equals('foo'));
  }
  buildCounterErrorHandler--;
}

buildUnnamed2260() {
  var o = new core.List<api.Option>();
  o.add(buildOption());
  o.add(buildOption());
  return o;
}

checkUnnamed2260(core.List<api.Option> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOption(o[0]);
  checkOption(o[1]);
}

core.int buildCounterField = 0;
buildField() {
  var o = new api.Field();
  buildCounterField++;
  if (buildCounterField < 3) {
    o.cardinality = "foo";
    o.jsonName = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.number = 42;
    o.oneofIndex = 42;
    o.options = buildUnnamed2260();
    o.packed = true;
    o.typeUrl = "foo";
  }
  buildCounterField--;
  return o;
}

checkField(api.Field o) {
  buildCounterField++;
  if (buildCounterField < 3) {
    unittest.expect(o.cardinality, unittest.equals('foo'));
    unittest.expect(o.jsonName, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.number, unittest.equals(42));
    unittest.expect(o.oneofIndex, unittest.equals(42));
    checkUnnamed2260(o.options);
    unittest.expect(o.packed, unittest.isTrue);
    unittest.expect(o.typeUrl, unittest.equals('foo'));
  }
  buildCounterField--;
}

core.int buildCounterFileInfo = 0;
buildFileInfo() {
  var o = new api.FileInfo();
  buildCounterFileInfo++;
  if (buildCounterFileInfo < 3) {
    o.mimeType = "foo";
    o.sha1Sum = "foo";
    o.sourceUrl = "foo";
  }
  buildCounterFileInfo--;
  return o;
}

checkFileInfo(api.FileInfo o) {
  buildCounterFileInfo++;
  if (buildCounterFileInfo < 3) {
    unittest.expect(o.mimeType, unittest.equals('foo'));
    unittest.expect(o.sha1Sum, unittest.equals('foo'));
    unittest.expect(o.sourceUrl, unittest.equals('foo'));
  }
  buildCounterFileInfo--;
}

core.int buildCounterHealthCheck = 0;
buildHealthCheck() {
  var o = new api.HealthCheck();
  buildCounterHealthCheck++;
  if (buildCounterHealthCheck < 3) {
    o.checkInterval = "foo";
    o.disableHealthCheck = true;
    o.healthyThreshold = 42;
    o.host = "foo";
    o.restartThreshold = 42;
    o.timeout = "foo";
    o.unhealthyThreshold = 42;
  }
  buildCounterHealthCheck--;
  return o;
}

checkHealthCheck(api.HealthCheck o) {
  buildCounterHealthCheck++;
  if (buildCounterHealthCheck < 3) {
    unittest.expect(o.checkInterval, unittest.equals('foo'));
    unittest.expect(o.disableHealthCheck, unittest.isTrue);
    unittest.expect(o.healthyThreshold, unittest.equals(42));
    unittest.expect(o.host, unittest.equals('foo'));
    unittest.expect(o.restartThreshold, unittest.equals(42));
    unittest.expect(o.timeout, unittest.equals('foo'));
    unittest.expect(o.unhealthyThreshold, unittest.equals(42));
  }
  buildCounterHealthCheck--;
}

core.int buildCounterLibrary = 0;
buildLibrary() {
  var o = new api.Library();
  buildCounterLibrary++;
  if (buildCounterLibrary < 3) {
    o.name = "foo";
    o.version = "foo";
  }
  buildCounterLibrary--;
  return o;
}

checkLibrary(api.Library o) {
  buildCounterLibrary++;
  if (buildCounterLibrary < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.version, unittest.equals('foo'));
  }
  buildCounterLibrary--;
}

buildUnnamed2261() {
  var o = new core.List<api.Module>();
  o.add(buildModule());
  o.add(buildModule());
  return o;
}

checkUnnamed2261(core.List<api.Module> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkModule(o[0]);
  checkModule(o[1]);
}

core.int buildCounterListModulesResponse = 0;
buildListModulesResponse() {
  var o = new api.ListModulesResponse();
  buildCounterListModulesResponse++;
  if (buildCounterListModulesResponse < 3) {
    o.modules = buildUnnamed2261();
    o.nextPageToken = "foo";
  }
  buildCounterListModulesResponse--;
  return o;
}

checkListModulesResponse(api.ListModulesResponse o) {
  buildCounterListModulesResponse++;
  if (buildCounterListModulesResponse < 3) {
    checkUnnamed2261(o.modules);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListModulesResponse--;
}

buildUnnamed2262() {
  var o = new core.List<api.Operation>();
  o.add(buildOperation());
  o.add(buildOperation());
  return o;
}

checkUnnamed2262(core.List<api.Operation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperation(o[0]);
  checkOperation(o[1]);
}

core.int buildCounterListOperationsResponse = 0;
buildListOperationsResponse() {
  var o = new api.ListOperationsResponse();
  buildCounterListOperationsResponse++;
  if (buildCounterListOperationsResponse < 3) {
    o.nextPageToken = "foo";
    o.operations = buildUnnamed2262();
  }
  buildCounterListOperationsResponse--;
  return o;
}

checkListOperationsResponse(api.ListOperationsResponse o) {
  buildCounterListOperationsResponse++;
  if (buildCounterListOperationsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed2262(o.operations);
  }
  buildCounterListOperationsResponse--;
}

buildUnnamed2263() {
  var o = new core.List<api.Version>();
  o.add(buildVersion());
  o.add(buildVersion());
  return o;
}

checkUnnamed2263(core.List<api.Version> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVersion(o[0]);
  checkVersion(o[1]);
}

core.int buildCounterListVersionsResponse = 0;
buildListVersionsResponse() {
  var o = new api.ListVersionsResponse();
  buildCounterListVersionsResponse++;
  if (buildCounterListVersionsResponse < 3) {
    o.nextPageToken = "foo";
    o.versions = buildUnnamed2263();
  }
  buildCounterListVersionsResponse--;
  return o;
}

checkListVersionsResponse(api.ListVersionsResponse o) {
  buildCounterListVersionsResponse++;
  if (buildCounterListVersionsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed2263(o.versions);
  }
  buildCounterListVersionsResponse--;
}

core.int buildCounterManualScaling = 0;
buildManualScaling() {
  var o = new api.ManualScaling();
  buildCounterManualScaling++;
  if (buildCounterManualScaling < 3) {
    o.instances = 42;
  }
  buildCounterManualScaling--;
  return o;
}

checkManualScaling(api.ManualScaling o) {
  buildCounterManualScaling++;
  if (buildCounterManualScaling < 3) {
    unittest.expect(o.instances, unittest.equals(42));
  }
  buildCounterManualScaling--;
}

core.int buildCounterModule = 0;
buildModule() {
  var o = new api.Module();
  buildCounterModule++;
  if (buildCounterModule < 3) {
    o.id = "foo";
    o.name = "foo";
    o.split = buildTrafficSplit();
  }
  buildCounterModule--;
  return o;
}

checkModule(api.Module o) {
  buildCounterModule++;
  if (buildCounterModule < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkTrafficSplit(o.split);
  }
  buildCounterModule--;
}

buildUnnamed2264() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2264(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterNetwork = 0;
buildNetwork() {
  var o = new api.Network();
  buildCounterNetwork++;
  if (buildCounterNetwork < 3) {
    o.forwardedPorts = buildUnnamed2264();
    o.instanceTag = "foo";
    o.name = "foo";
  }
  buildCounterNetwork--;
  return o;
}

checkNetwork(api.Network o) {
  buildCounterNetwork++;
  if (buildCounterNetwork < 3) {
    checkUnnamed2264(o.forwardedPorts);
    unittest.expect(o.instanceTag, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterNetwork--;
}

buildUnnamed2265() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed2265(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted1 = (o["x"]) as core.Map; unittest.expect(casted1, unittest.hasLength(3)); unittest.expect(casted1["list"], unittest.equals([1, 2, 3])); unittest.expect(casted1["bool"], unittest.equals(true)); unittest.expect(casted1["string"], unittest.equals('foo')); 
  var casted2 = (o["y"]) as core.Map; unittest.expect(casted2, unittest.hasLength(3)); unittest.expect(casted2["list"], unittest.equals([1, 2, 3])); unittest.expect(casted2["bool"], unittest.equals(true)); unittest.expect(casted2["string"], unittest.equals('foo')); 
}

buildUnnamed2266() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed2266(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted3 = (o["x"]) as core.Map; unittest.expect(casted3, unittest.hasLength(3)); unittest.expect(casted3["list"], unittest.equals([1, 2, 3])); unittest.expect(casted3["bool"], unittest.equals(true)); unittest.expect(casted3["string"], unittest.equals('foo')); 
  var casted4 = (o["y"]) as core.Map; unittest.expect(casted4, unittest.hasLength(3)); unittest.expect(casted4["list"], unittest.equals([1, 2, 3])); unittest.expect(casted4["bool"], unittest.equals(true)); unittest.expect(casted4["string"], unittest.equals('foo')); 
}

core.int buildCounterOperation = 0;
buildOperation() {
  var o = new api.Operation();
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    o.done = true;
    o.error = buildStatus();
    o.metadata = buildUnnamed2265();
    o.name = "foo";
    o.response = buildUnnamed2266();
  }
  buildCounterOperation--;
  return o;
}

checkOperation(api.Operation o) {
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    unittest.expect(o.done, unittest.isTrue);
    checkStatus(o.error);
    checkUnnamed2265(o.metadata);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2266(o.response);
  }
  buildCounterOperation--;
}

core.int buildCounterOperationMetadata = 0;
buildOperationMetadata() {
  var o = new api.OperationMetadata();
  buildCounterOperationMetadata++;
  if (buildCounterOperationMetadata < 3) {
    o.endTime = "foo";
    o.insertTime = "foo";
    o.operationType = "foo";
    o.user = "foo";
  }
  buildCounterOperationMetadata--;
  return o;
}

checkOperationMetadata(api.OperationMetadata o) {
  buildCounterOperationMetadata++;
  if (buildCounterOperationMetadata < 3) {
    unittest.expect(o.endTime, unittest.equals('foo'));
    unittest.expect(o.insertTime, unittest.equals('foo'));
    unittest.expect(o.operationType, unittest.equals('foo'));
    unittest.expect(o.user, unittest.equals('foo'));
  }
  buildCounterOperationMetadata--;
}

buildUnnamed2267() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed2267(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted5 = (o["x"]) as core.Map; unittest.expect(casted5, unittest.hasLength(3)); unittest.expect(casted5["list"], unittest.equals([1, 2, 3])); unittest.expect(casted5["bool"], unittest.equals(true)); unittest.expect(casted5["string"], unittest.equals('foo')); 
  var casted6 = (o["y"]) as core.Map; unittest.expect(casted6, unittest.hasLength(3)); unittest.expect(casted6["list"], unittest.equals([1, 2, 3])); unittest.expect(casted6["bool"], unittest.equals(true)); unittest.expect(casted6["string"], unittest.equals('foo')); 
}

core.int buildCounterOption = 0;
buildOption() {
  var o = new api.Option();
  buildCounterOption++;
  if (buildCounterOption < 3) {
    o.name = "foo";
    o.value = buildUnnamed2267();
  }
  buildCounterOption--;
  return o;
}

checkOption(api.Option o) {
  buildCounterOption++;
  if (buildCounterOption < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2267(o.value);
  }
  buildCounterOption--;
}

core.int buildCounterResources = 0;
buildResources() {
  var o = new api.Resources();
  buildCounterResources++;
  if (buildCounterResources < 3) {
    o.cpu = 42.0;
    o.diskGb = 42.0;
    o.memoryGb = 42.0;
  }
  buildCounterResources--;
  return o;
}

checkResources(api.Resources o) {
  buildCounterResources++;
  if (buildCounterResources < 3) {
    unittest.expect(o.cpu, unittest.equals(42.0));
    unittest.expect(o.diskGb, unittest.equals(42.0));
    unittest.expect(o.memoryGb, unittest.equals(42.0));
  }
  buildCounterResources--;
}

core.int buildCounterScriptHandler = 0;
buildScriptHandler() {
  var o = new api.ScriptHandler();
  buildCounterScriptHandler++;
  if (buildCounterScriptHandler < 3) {
    o.scriptPath = "foo";
  }
  buildCounterScriptHandler--;
  return o;
}

checkScriptHandler(api.ScriptHandler o) {
  buildCounterScriptHandler++;
  if (buildCounterScriptHandler < 3) {
    unittest.expect(o.scriptPath, unittest.equals('foo'));
  }
  buildCounterScriptHandler--;
}

core.int buildCounterSourceContext = 0;
buildSourceContext() {
  var o = new api.SourceContext();
  buildCounterSourceContext++;
  if (buildCounterSourceContext < 3) {
    o.fileName = "foo";
  }
  buildCounterSourceContext--;
  return o;
}

checkSourceContext(api.SourceContext o) {
  buildCounterSourceContext++;
  if (buildCounterSourceContext < 3) {
    unittest.expect(o.fileName, unittest.equals('foo'));
  }
  buildCounterSourceContext--;
}

core.int buildCounterSourceReference = 0;
buildSourceReference() {
  var o = new api.SourceReference();
  buildCounterSourceReference++;
  if (buildCounterSourceReference < 3) {
    o.repository = "foo";
    o.revisionId = "foo";
  }
  buildCounterSourceReference--;
  return o;
}

checkSourceReference(api.SourceReference o) {
  buildCounterSourceReference++;
  if (buildCounterSourceReference < 3) {
    unittest.expect(o.repository, unittest.equals('foo'));
    unittest.expect(o.revisionId, unittest.equals('foo'));
  }
  buildCounterSourceReference--;
}

buildUnnamed2268() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed2268(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterStaticDirectoryHandler = 0;
buildStaticDirectoryHandler() {
  var o = new api.StaticDirectoryHandler();
  buildCounterStaticDirectoryHandler++;
  if (buildCounterStaticDirectoryHandler < 3) {
    o.applicationReadable = true;
    o.directory = "foo";
    o.expiration = "foo";
    o.httpHeaders = buildUnnamed2268();
    o.mimeType = "foo";
    o.requireMatchingFile = true;
  }
  buildCounterStaticDirectoryHandler--;
  return o;
}

checkStaticDirectoryHandler(api.StaticDirectoryHandler o) {
  buildCounterStaticDirectoryHandler++;
  if (buildCounterStaticDirectoryHandler < 3) {
    unittest.expect(o.applicationReadable, unittest.isTrue);
    unittest.expect(o.directory, unittest.equals('foo'));
    unittest.expect(o.expiration, unittest.equals('foo'));
    checkUnnamed2268(o.httpHeaders);
    unittest.expect(o.mimeType, unittest.equals('foo'));
    unittest.expect(o.requireMatchingFile, unittest.isTrue);
  }
  buildCounterStaticDirectoryHandler--;
}

buildUnnamed2269() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed2269(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterStaticFilesHandler = 0;
buildStaticFilesHandler() {
  var o = new api.StaticFilesHandler();
  buildCounterStaticFilesHandler++;
  if (buildCounterStaticFilesHandler < 3) {
    o.applicationReadable = true;
    o.expiration = "foo";
    o.httpHeaders = buildUnnamed2269();
    o.mimeType = "foo";
    o.path = "foo";
    o.requireMatchingFile = true;
    o.uploadPathRegex = "foo";
  }
  buildCounterStaticFilesHandler--;
  return o;
}

checkStaticFilesHandler(api.StaticFilesHandler o) {
  buildCounterStaticFilesHandler++;
  if (buildCounterStaticFilesHandler < 3) {
    unittest.expect(o.applicationReadable, unittest.isTrue);
    unittest.expect(o.expiration, unittest.equals('foo'));
    checkUnnamed2269(o.httpHeaders);
    unittest.expect(o.mimeType, unittest.equals('foo'));
    unittest.expect(o.path, unittest.equals('foo'));
    unittest.expect(o.requireMatchingFile, unittest.isTrue);
    unittest.expect(o.uploadPathRegex, unittest.equals('foo'));
  }
  buildCounterStaticFilesHandler--;
}

buildUnnamed2270() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed2270(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted7 = (o["x"]) as core.Map; unittest.expect(casted7, unittest.hasLength(3)); unittest.expect(casted7["list"], unittest.equals([1, 2, 3])); unittest.expect(casted7["bool"], unittest.equals(true)); unittest.expect(casted7["string"], unittest.equals('foo')); 
  var casted8 = (o["y"]) as core.Map; unittest.expect(casted8, unittest.hasLength(3)); unittest.expect(casted8["list"], unittest.equals([1, 2, 3])); unittest.expect(casted8["bool"], unittest.equals(true)); unittest.expect(casted8["string"], unittest.equals('foo')); 
}

buildUnnamed2271() {
  var o = new core.List<core.Map<core.String, core.Object>>();
  o.add(buildUnnamed2270());
  o.add(buildUnnamed2270());
  return o;
}

checkUnnamed2271(core.List<core.Map<core.String, core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed2270(o[0]);
  checkUnnamed2270(o[1]);
}

core.int buildCounterStatus = 0;
buildStatus() {
  var o = new api.Status();
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    o.code = 42;
    o.details = buildUnnamed2271();
    o.message = "foo";
  }
  buildCounterStatus--;
  return o;
}

checkStatus(api.Status o) {
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    unittest.expect(o.code, unittest.equals(42));
    checkUnnamed2271(o.details);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterStatus--;
}

buildUnnamed2272() {
  var o = new core.Map<core.String, core.double>();
  o["x"] = 42.0;
  o["y"] = 42.0;
  return o;
}

checkUnnamed2272(core.Map<core.String, core.double> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals(42.0));
  unittest.expect(o["y"], unittest.equals(42.0));
}

core.int buildCounterTrafficSplit = 0;
buildTrafficSplit() {
  var o = new api.TrafficSplit();
  buildCounterTrafficSplit++;
  if (buildCounterTrafficSplit < 3) {
    o.allocations = buildUnnamed2272();
    o.shardBy = "foo";
  }
  buildCounterTrafficSplit--;
  return o;
}

checkTrafficSplit(api.TrafficSplit o) {
  buildCounterTrafficSplit++;
  if (buildCounterTrafficSplit < 3) {
    checkUnnamed2272(o.allocations);
    unittest.expect(o.shardBy, unittest.equals('foo'));
  }
  buildCounterTrafficSplit--;
}

buildUnnamed2273() {
  var o = new core.List<api.Field>();
  o.add(buildField());
  o.add(buildField());
  return o;
}

checkUnnamed2273(core.List<api.Field> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkField(o[0]);
  checkField(o[1]);
}

buildUnnamed2274() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2274(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2275() {
  var o = new core.List<api.Option>();
  o.add(buildOption());
  o.add(buildOption());
  return o;
}

checkUnnamed2275(core.List<api.Option> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOption(o[0]);
  checkOption(o[1]);
}

core.int buildCounterType = 0;
buildType() {
  var o = new api.Type();
  buildCounterType++;
  if (buildCounterType < 3) {
    o.fields = buildUnnamed2273();
    o.name = "foo";
    o.oneofs = buildUnnamed2274();
    o.options = buildUnnamed2275();
    o.sourceContext = buildSourceContext();
    o.syntax = "foo";
  }
  buildCounterType--;
  return o;
}

checkType(api.Type o) {
  buildCounterType++;
  if (buildCounterType < 3) {
    checkUnnamed2273(o.fields);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2274(o.oneofs);
    checkUnnamed2275(o.options);
    checkSourceContext(o.sourceContext);
    unittest.expect(o.syntax, unittest.equals('foo'));
  }
  buildCounterType--;
}

core.int buildCounterUrlDispatchRule = 0;
buildUrlDispatchRule() {
  var o = new api.UrlDispatchRule();
  buildCounterUrlDispatchRule++;
  if (buildCounterUrlDispatchRule < 3) {
    o.domain = "foo";
    o.module = "foo";
    o.path = "foo";
  }
  buildCounterUrlDispatchRule--;
  return o;
}

checkUrlDispatchRule(api.UrlDispatchRule o) {
  buildCounterUrlDispatchRule++;
  if (buildCounterUrlDispatchRule < 3) {
    unittest.expect(o.domain, unittest.equals('foo'));
    unittest.expect(o.module, unittest.equals('foo'));
    unittest.expect(o.path, unittest.equals('foo'));
  }
  buildCounterUrlDispatchRule--;
}

core.int buildCounterUrlMap = 0;
buildUrlMap() {
  var o = new api.UrlMap();
  buildCounterUrlMap++;
  if (buildCounterUrlMap < 3) {
    o.apiEndpoint = buildApiEndpointHandler();
    o.authFailAction = "foo";
    o.login = "foo";
    o.redirectHttpResponseCode = "foo";
    o.script = buildScriptHandler();
    o.securityLevel = "foo";
    o.staticDirectory = buildStaticDirectoryHandler();
    o.staticFiles = buildStaticFilesHandler();
    o.urlRegex = "foo";
  }
  buildCounterUrlMap--;
  return o;
}

checkUrlMap(api.UrlMap o) {
  buildCounterUrlMap++;
  if (buildCounterUrlMap < 3) {
    checkApiEndpointHandler(o.apiEndpoint);
    unittest.expect(o.authFailAction, unittest.equals('foo'));
    unittest.expect(o.login, unittest.equals('foo'));
    unittest.expect(o.redirectHttpResponseCode, unittest.equals('foo'));
    checkScriptHandler(o.script);
    unittest.expect(o.securityLevel, unittest.equals('foo'));
    checkStaticDirectoryHandler(o.staticDirectory);
    checkStaticFilesHandler(o.staticFiles);
    unittest.expect(o.urlRegex, unittest.equals('foo'));
  }
  buildCounterUrlMap--;
}

buildUnnamed2276() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed2276(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

buildUnnamed2277() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed2277(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

buildUnnamed2278() {
  var o = new core.List<api.ErrorHandler>();
  o.add(buildErrorHandler());
  o.add(buildErrorHandler());
  return o;
}

checkUnnamed2278(core.List<api.ErrorHandler> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkErrorHandler(o[0]);
  checkErrorHandler(o[1]);
}

buildUnnamed2279() {
  var o = new core.List<api.UrlMap>();
  o.add(buildUrlMap());
  o.add(buildUrlMap());
  return o;
}

checkUnnamed2279(core.List<api.UrlMap> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUrlMap(o[0]);
  checkUrlMap(o[1]);
}

buildUnnamed2280() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2280(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2281() {
  var o = new core.List<api.Library>();
  o.add(buildLibrary());
  o.add(buildLibrary());
  return o;
}

checkUnnamed2281(core.List<api.Library> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLibrary(o[0]);
  checkLibrary(o[1]);
}

core.int buildCounterVersion = 0;
buildVersion() {
  var o = new api.Version();
  buildCounterVersion++;
  if (buildCounterVersion < 3) {
    o.apiConfig = buildApiConfigHandler();
    o.automaticScaling = buildAutomaticScaling();
    o.basicScaling = buildBasicScaling();
    o.betaSettings = buildUnnamed2276();
    o.defaultExpiration = "foo";
    o.deployment = buildDeployment();
    o.envVariables = buildUnnamed2277();
    o.errorHandlers = buildUnnamed2278();
    o.handlers = buildUnnamed2279();
    o.healthCheck = buildHealthCheck();
    o.id = "foo";
    o.inboundServices = buildUnnamed2280();
    o.instanceClass = "foo";
    o.libraries = buildUnnamed2281();
    o.manualScaling = buildManualScaling();
    o.name = "foo";
    o.network = buildNetwork();
    o.nobuildFilesRegex = "foo";
    o.resources = buildResources();
    o.runtime = "foo";
    o.threadsafe = true;
    o.vm = true;
  }
  buildCounterVersion--;
  return o;
}

checkVersion(api.Version o) {
  buildCounterVersion++;
  if (buildCounterVersion < 3) {
    checkApiConfigHandler(o.apiConfig);
    checkAutomaticScaling(o.automaticScaling);
    checkBasicScaling(o.basicScaling);
    checkUnnamed2276(o.betaSettings);
    unittest.expect(o.defaultExpiration, unittest.equals('foo'));
    checkDeployment(o.deployment);
    checkUnnamed2277(o.envVariables);
    checkUnnamed2278(o.errorHandlers);
    checkUnnamed2279(o.handlers);
    checkHealthCheck(o.healthCheck);
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2280(o.inboundServices);
    unittest.expect(o.instanceClass, unittest.equals('foo'));
    checkUnnamed2281(o.libraries);
    checkManualScaling(o.manualScaling);
    unittest.expect(o.name, unittest.equals('foo'));
    checkNetwork(o.network);
    unittest.expect(o.nobuildFilesRegex, unittest.equals('foo'));
    checkResources(o.resources);
    unittest.expect(o.runtime, unittest.equals('foo'));
    unittest.expect(o.threadsafe, unittest.isTrue);
    unittest.expect(o.vm, unittest.isTrue);
  }
  buildCounterVersion--;
}


main() {
  unittest.group("obj-schema-ApiConfigHandler", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiConfigHandler();
      var od = new api.ApiConfigHandler.fromJson(o.toJson());
      checkApiConfigHandler(od);
    });
  });


  unittest.group("obj-schema-ApiEndpointHandler", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiEndpointHandler();
      var od = new api.ApiEndpointHandler.fromJson(o.toJson());
      checkApiEndpointHandler(od);
    });
  });


  unittest.group("obj-schema-Application", () {
    unittest.test("to-json--from-json", () {
      var o = buildApplication();
      var od = new api.Application.fromJson(o.toJson());
      checkApplication(od);
    });
  });


  unittest.group("obj-schema-AutomaticScaling", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutomaticScaling();
      var od = new api.AutomaticScaling.fromJson(o.toJson());
      checkAutomaticScaling(od);
    });
  });


  unittest.group("obj-schema-BasicScaling", () {
    unittest.test("to-json--from-json", () {
      var o = buildBasicScaling();
      var od = new api.BasicScaling.fromJson(o.toJson());
      checkBasicScaling(od);
    });
  });


  unittest.group("obj-schema-ContainerInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildContainerInfo();
      var od = new api.ContainerInfo.fromJson(o.toJson());
      checkContainerInfo(od);
    });
  });


  unittest.group("obj-schema-CpuUtilization", () {
    unittest.test("to-json--from-json", () {
      var o = buildCpuUtilization();
      var od = new api.CpuUtilization.fromJson(o.toJson());
      checkCpuUtilization(od);
    });
  });


  unittest.group("obj-schema-Deployment", () {
    unittest.test("to-json--from-json", () {
      var o = buildDeployment();
      var od = new api.Deployment.fromJson(o.toJson());
      checkDeployment(od);
    });
  });


  unittest.group("obj-schema-ErrorHandler", () {
    unittest.test("to-json--from-json", () {
      var o = buildErrorHandler();
      var od = new api.ErrorHandler.fromJson(o.toJson());
      checkErrorHandler(od);
    });
  });


  unittest.group("obj-schema-Field", () {
    unittest.test("to-json--from-json", () {
      var o = buildField();
      var od = new api.Field.fromJson(o.toJson());
      checkField(od);
    });
  });


  unittest.group("obj-schema-FileInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildFileInfo();
      var od = new api.FileInfo.fromJson(o.toJson());
      checkFileInfo(od);
    });
  });


  unittest.group("obj-schema-HealthCheck", () {
    unittest.test("to-json--from-json", () {
      var o = buildHealthCheck();
      var od = new api.HealthCheck.fromJson(o.toJson());
      checkHealthCheck(od);
    });
  });


  unittest.group("obj-schema-Library", () {
    unittest.test("to-json--from-json", () {
      var o = buildLibrary();
      var od = new api.Library.fromJson(o.toJson());
      checkLibrary(od);
    });
  });


  unittest.group("obj-schema-ListModulesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListModulesResponse();
      var od = new api.ListModulesResponse.fromJson(o.toJson());
      checkListModulesResponse(od);
    });
  });


  unittest.group("obj-schema-ListOperationsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListOperationsResponse();
      var od = new api.ListOperationsResponse.fromJson(o.toJson());
      checkListOperationsResponse(od);
    });
  });


  unittest.group("obj-schema-ListVersionsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListVersionsResponse();
      var od = new api.ListVersionsResponse.fromJson(o.toJson());
      checkListVersionsResponse(od);
    });
  });


  unittest.group("obj-schema-ManualScaling", () {
    unittest.test("to-json--from-json", () {
      var o = buildManualScaling();
      var od = new api.ManualScaling.fromJson(o.toJson());
      checkManualScaling(od);
    });
  });


  unittest.group("obj-schema-Module", () {
    unittest.test("to-json--from-json", () {
      var o = buildModule();
      var od = new api.Module.fromJson(o.toJson());
      checkModule(od);
    });
  });


  unittest.group("obj-schema-Network", () {
    unittest.test("to-json--from-json", () {
      var o = buildNetwork();
      var od = new api.Network.fromJson(o.toJson());
      checkNetwork(od);
    });
  });


  unittest.group("obj-schema-Operation", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperation();
      var od = new api.Operation.fromJson(o.toJson());
      checkOperation(od);
    });
  });


  unittest.group("obj-schema-OperationMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationMetadata();
      var od = new api.OperationMetadata.fromJson(o.toJson());
      checkOperationMetadata(od);
    });
  });


  unittest.group("obj-schema-Option", () {
    unittest.test("to-json--from-json", () {
      var o = buildOption();
      var od = new api.Option.fromJson(o.toJson());
      checkOption(od);
    });
  });


  unittest.group("obj-schema-Resources", () {
    unittest.test("to-json--from-json", () {
      var o = buildResources();
      var od = new api.Resources.fromJson(o.toJson());
      checkResources(od);
    });
  });


  unittest.group("obj-schema-ScriptHandler", () {
    unittest.test("to-json--from-json", () {
      var o = buildScriptHandler();
      var od = new api.ScriptHandler.fromJson(o.toJson());
      checkScriptHandler(od);
    });
  });


  unittest.group("obj-schema-SourceContext", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceContext();
      var od = new api.SourceContext.fromJson(o.toJson());
      checkSourceContext(od);
    });
  });


  unittest.group("obj-schema-SourceReference", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceReference();
      var od = new api.SourceReference.fromJson(o.toJson());
      checkSourceReference(od);
    });
  });


  unittest.group("obj-schema-StaticDirectoryHandler", () {
    unittest.test("to-json--from-json", () {
      var o = buildStaticDirectoryHandler();
      var od = new api.StaticDirectoryHandler.fromJson(o.toJson());
      checkStaticDirectoryHandler(od);
    });
  });


  unittest.group("obj-schema-StaticFilesHandler", () {
    unittest.test("to-json--from-json", () {
      var o = buildStaticFilesHandler();
      var od = new api.StaticFilesHandler.fromJson(o.toJson());
      checkStaticFilesHandler(od);
    });
  });


  unittest.group("obj-schema-Status", () {
    unittest.test("to-json--from-json", () {
      var o = buildStatus();
      var od = new api.Status.fromJson(o.toJson());
      checkStatus(od);
    });
  });


  unittest.group("obj-schema-TrafficSplit", () {
    unittest.test("to-json--from-json", () {
      var o = buildTrafficSplit();
      var od = new api.TrafficSplit.fromJson(o.toJson());
      checkTrafficSplit(od);
    });
  });


  unittest.group("obj-schema-Type", () {
    unittest.test("to-json--from-json", () {
      var o = buildType();
      var od = new api.Type.fromJson(o.toJson());
      checkType(od);
    });
  });


  unittest.group("obj-schema-UrlDispatchRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlDispatchRule();
      var od = new api.UrlDispatchRule.fromJson(o.toJson());
      checkUrlDispatchRule(od);
    });
  });


  unittest.group("obj-schema-UrlMap", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlMap();
      var od = new api.UrlMap.fromJson(o.toJson());
      checkUrlMap(od);
    });
  });


  unittest.group("obj-schema-Version", () {
    unittest.test("to-json--from-json", () {
      var o = buildVersion();
      var od = new api.Version.fromJson(o.toJson());
      checkVersion(od);
    });
  });


  unittest.group("resource-AppsResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AppsResourceApi res = new api.AppengineApi(mock).apps;
      var arg_appsId = "foo";
      var arg_ensureResourcesExist = true;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("v1beta4/apps/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_appsId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["ensureResourcesExist"].first, unittest.equals("$arg_ensureResourcesExist"));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApplication());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_appsId, ensureResourcesExist: arg_ensureResourcesExist).then(unittest.expectAsync(((api.Application response) {
        checkApplication(response);
      })));
    });

  });


  unittest.group("resource-AppsModulesResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AppsModulesResourceApi res = new api.AppengineApi(mock).apps.modules;
      var arg_appsId = "foo";
      var arg_modulesId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("v1beta4/apps/"));
        pathOffset += 13;
        index = path.indexOf("/modules/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_appsId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/modules/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_modulesId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_appsId, arg_modulesId).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AppsModulesResourceApi res = new api.AppengineApi(mock).apps.modules;
      var arg_appsId = "foo";
      var arg_modulesId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("v1beta4/apps/"));
        pathOffset += 13;
        index = path.indexOf("/modules/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_appsId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/modules/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_modulesId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildModule());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_appsId, arg_modulesId).then(unittest.expectAsync(((api.Module response) {
        checkModule(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AppsModulesResourceApi res = new api.AppengineApi(mock).apps.modules;
      var arg_appsId = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("v1beta4/apps/"));
        pathOffset += 13;
        index = path.indexOf("/modules", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_appsId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/modules"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListModulesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_appsId, pageSize: arg_pageSize, pageToken: arg_pageToken).then(unittest.expectAsync(((api.ListModulesResponse response) {
        checkListModulesResponse(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.AppsModulesResourceApi res = new api.AppengineApi(mock).apps.modules;
      var arg_request = buildModule();
      var arg_appsId = "foo";
      var arg_modulesId = "foo";
      var arg_mask = "foo";
      var arg_migrateTraffic = true;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Module.fromJson(json);
        checkModule(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("v1beta4/apps/"));
        pathOffset += 13;
        index = path.indexOf("/modules/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_appsId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/modules/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_modulesId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["mask"].first, unittest.equals(arg_mask));
        unittest.expect(queryMap["migrateTraffic"].first, unittest.equals("$arg_migrateTraffic"));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_appsId, arg_modulesId, mask: arg_mask, migrateTraffic: arg_migrateTraffic).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-AppsModulesVersionsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AppsModulesVersionsResourceApi res = new api.AppengineApi(mock).apps.modules.versions;
      var arg_request = buildVersion();
      var arg_appsId = "foo";
      var arg_modulesId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Version.fromJson(json);
        checkVersion(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("v1beta4/apps/"));
        pathOffset += 13;
        index = path.indexOf("/modules/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_appsId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/modules/"));
        pathOffset += 9;
        index = path.indexOf("/versions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_modulesId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/versions"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_appsId, arg_modulesId).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AppsModulesVersionsResourceApi res = new api.AppengineApi(mock).apps.modules.versions;
      var arg_appsId = "foo";
      var arg_modulesId = "foo";
      var arg_versionsId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("v1beta4/apps/"));
        pathOffset += 13;
        index = path.indexOf("/modules/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_appsId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/modules/"));
        pathOffset += 9;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_modulesId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/versions/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_versionsId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_appsId, arg_modulesId, arg_versionsId).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AppsModulesVersionsResourceApi res = new api.AppengineApi(mock).apps.modules.versions;
      var arg_appsId = "foo";
      var arg_modulesId = "foo";
      var arg_versionsId = "foo";
      var arg_view = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("v1beta4/apps/"));
        pathOffset += 13;
        index = path.indexOf("/modules/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_appsId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/modules/"));
        pathOffset += 9;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_modulesId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/versions/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_versionsId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["view"].first, unittest.equals(arg_view));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildVersion());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_appsId, arg_modulesId, arg_versionsId, view: arg_view).then(unittest.expectAsync(((api.Version response) {
        checkVersion(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AppsModulesVersionsResourceApi res = new api.AppengineApi(mock).apps.modules.versions;
      var arg_appsId = "foo";
      var arg_modulesId = "foo";
      var arg_view = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("v1beta4/apps/"));
        pathOffset += 13;
        index = path.indexOf("/modules/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_appsId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/modules/"));
        pathOffset += 9;
        index = path.indexOf("/versions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_modulesId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/versions"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["view"].first, unittest.equals(arg_view));
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListVersionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_appsId, arg_modulesId, view: arg_view, pageSize: arg_pageSize, pageToken: arg_pageToken).then(unittest.expectAsync(((api.ListVersionsResponse response) {
        checkListVersionsResponse(response);
      })));
    });

  });


  unittest.group("resource-AppsOperationsResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AppsOperationsResourceApi res = new api.AppengineApi(mock).apps.operations;
      var arg_appsId = "foo";
      var arg_operationsId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("v1beta4/apps/"));
        pathOffset += 13;
        index = path.indexOf("/operations/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_appsId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/operations/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_operationsId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_appsId, arg_operationsId).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AppsOperationsResourceApi res = new api.AppengineApi(mock).apps.operations;
      var arg_appsId = "foo";
      var arg_filter = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("v1beta4/apps/"));
        pathOffset += 13;
        index = path.indexOf("/operations", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_appsId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/operations"));
        pathOffset += 11;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListOperationsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_appsId, filter: arg_filter, pageSize: arg_pageSize, pageToken: arg_pageToken).then(unittest.expectAsync(((api.ListOperationsResponse response) {
        checkListOperationsResponse(response);
      })));
    });

  });


}
