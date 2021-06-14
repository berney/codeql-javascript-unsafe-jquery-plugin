import javascript

/* Step-8
from 
where 
select plugin, plugin.getLastParameter()
*/

predicate isSource(DataFlow::Node source) {
    exists(DataFlow::FunctionNode plugin, DataFlow::ParameterNode options |
        jquery().getAPropertyRead("fn").getAPropertySource() = plugin and
        options = plugin.getLastParameter() and
        options.getALocalSource() = source
    )
}

from DataFlow::Node node
where isSource(node)
select node
