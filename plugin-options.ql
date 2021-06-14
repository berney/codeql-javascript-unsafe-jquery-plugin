import javascript

from DataFlow::FunctionNode plugin
where jquery().getAPropertyRead("fn").getAPropertySource() = plugin
select plugin, plugin.getLastParameter()
