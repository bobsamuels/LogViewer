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

     static mapping = {
        loggedClass field:"class"
        collection "Logs"
        database "VitomyLogDrain"
    }

    def getClassName(){
        loggedClass.split(":")[1].split(",")[0].replaceAll("\"", "")
    }

}
