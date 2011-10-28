package logviewer

import org.bson.types.ObjectId

class Logs {
    ObjectId id
    Date timestamp
    String level
    String message
    String method
    String lineNumber
    String loggedClass
	String host
	
     static mapping = {
        loggedClass field:"class"
        collection "Logs"
        database "VitomyLogDrain"
    }

    def getClassName(){
        loggedClass.split(":")[1].split(",")[0].replaceAll("\"", "")
    }

	def getHostIP(){
		def ip = host.split(":")[3]
		ip = ip.replaceAll("\"", "")
		ip = ip.replaceAll("}","")
		ip
	}

}
