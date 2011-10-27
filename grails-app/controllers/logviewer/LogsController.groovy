package logviewer

class LogsController {
    def index = {
        Date lastFiveDays = new Date() - 5
        List errLevels = ["ERROR", "FATAL"]
        def errors = Logs.createCriteria().list{
            'in'("level", errLevels)
            gt("timestamp", lastFiveDays)
            maxResults(50)
        }
        [errors: errors]
    }

    def tail = {
        def level = "DEBUG"
        def recentMsgs = Logs.findAllByLevel(level,[max:50, sort:"timestamp", order:"desc"])
        [levels:["DEBUG", "WARN", "INFO", "ERROR", "FATAL"], level:level, msgs: recentMsgs]
    }

    def ajaxUpdateTail = {
        def level = params.level
        log.debug("Getting new tail data")
        def recentMsgs = Logs.findAllByLevel(level, [max:50, sort:"timestamp", order:"desc"])
        render(template:"tailData", model:[msgs:recentMsgs])

    }

    def search = {
        def _level = "DEBUG"
        def q = ""

        [levels:["DEBUG", "WARN", "INFO", "ERROR", "FATAL"],level:_level, query:q]
    }

    def ajaxSearchLogs = {
        def startDate
        def endDate
        def _level = params.level
        def q = params.query

        try{
            startDate = new Date(params.startDate)
        }
        catch(Exception e)
        {
            startDate = new Date() - 4
        }
        try{
            endDate = new Date(params.endDate)
        }
        catch(Exception e)
        {
            endDate = new Date()
        }

        endDate = endDate + 1

        def searchResults = Logs.createCriteria().list{
            between("timestamp", startDate, endDate)
            eq("level", _level)
            if(q)
                ilike("message", '%' + q+'%')
            maxResults(100)
        }


        render(template:"searchResults", model:[results:searchResults])
    }
}
