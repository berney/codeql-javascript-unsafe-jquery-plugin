import javascript

//from DataFlow::SourceNode source
//where jquery().getAPropertyRead("fn").getAPropertyWrite() = source
//select source

select jquery().getAPropertyRead("fn").getAPropertyWrite()