package logviewer
import logviewer.LogsService;


class LogsController {
	def logsService
	
    static levels = ["DEBUG", "WARN", "INFO", "ERROR", "FATAL"]
    def index = {
        Date lastFiveDays = new Date() - 5
        List errLevels = ["ERROR", "FATAL"]
        def errors = Logs.createCriteria().list{
            'in'("level", errLevels)
            gt("timestamp", lastFiveDays)
            maxResults(50)
        }
		def chartData = logsService.getChartData(errors)
        [errors: errors.sort{it.timestamp}, chartData:chartData]
    }
	
	
	
    def tail = {
        def level = "DEBUG"
        def recentMsgs = Logs.findAllByLevel(level,[max:50, sort:"timestamp", order:"desc"])
        recentMsgs.sort{it.timestamp}
		[levels:levels, level:level, msgs: recentMsgs]
    }

    def ajaxUpdateTail = {
        def level = params.level
        log.debug("Getting new tail data")
        def recentMsgs = Logs.findAllByLevel(level, [max:50, sort:"timestamp", order:"desc"])
        recentMsgs.sort{it.timestamp}
		render(template:"tailData", model:[msgs:recentMsgs])

    }

    def search = {
        def _level = "DEBUG"
        def q = ""

        [levels:levels,level:_level, query:q]
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
            order("timestamp", "desc")
            maxResults(100)
        }

		searchResults = searchResults.sort{it.timestamp}
        render(template:"searchResults", model:[results:searchResults])
    }
}
