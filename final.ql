/**
 * @name Cross-site scripting vulnerable plugin
 * @kind path-problem
 * @id js/xss-unsafe-plugin
 */
import javascript
import DataFlow::PathGraph

class Config extends TaintTracking::Configuration {
  Config() { this = "Config" }
  override predicate isSource(DataFlow::Node source) {
    // from step 9
    exists(DataFlow::FunctionNode plugin, DataFlow::ParameterNode options |
        jquery().getAPropertyRead("fn").getAPropertySource() = plugin and
        options = plugin.getLastParameter() and
        options.getALocalSource() = source
    
    )
  }

  override predicate isSink(DataFlow::Node sink) {
    // from step 5
    exists(CallExpr dollarCall |
        dollarCall.getCalleeName() = "$" and
        sink.asExpr() = dollarCall.getArgument(0)
    )
  }
}

from Config config, DataFlow::PathNode source, DataFlow::PathNode sink
where config.hasFlowPath(source, sink)
select sink, source, sink, "Potential XSS vulnerability in plugin."

