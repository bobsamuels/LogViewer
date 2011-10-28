package logviewer
import org.bson.types.ObjectId

class CdnLog {

ObjectId id
Date timestamp
String level
String message
String method
String lineNumber
String loggedClass
String loggerName
String host

 static mapping = {
    loggedClass field:"class"
    collection "CdnLogs"
    database "VitomyLogDrain"
}

def getClassName(){
    //loggedClass.split(":")[1].split(",")[0].replaceAll("\"", "")
	def classname = loggerName.split(":")[1]
	classname = classname.substring(0, classname.indexOf(",")).replaceAll("\"", "")
}

def getHostIP(){
	def ip = host.split(":")[3]
	ip = ip.replaceAll("\"", "")
	ip = ip.replaceAll("}","")
	ip
}

}
