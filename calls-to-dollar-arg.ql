import javascript

from CallExpr dollarCall, CallExpr dollarArg
where dollarCall.getCalleeName() = "$" and dollarArg = dollarCall.getChildExpr(0)
select dollarCall, dollarArg
