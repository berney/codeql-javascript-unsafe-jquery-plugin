import javascript

from DataFlow::SourceNode source
where jquery().getAPropertyRead("fn").getAPropertySource() = source
select source
