package logviewer
import logviewer.LogsService;


class LogsController {
	def logsService
	
    static levels = ["ALL","DEBUG", "WARN", "INFO", "ERROR", "FATAL"]
	static apps = ["App", "Cdn"]
	
	def index = {
		redirect(action:cdnErrors)
	}

    def cdnErrors = {
        Date lastFiveDays = new Date() - 5
        List errLevels = ["ERROR", "FATAL"]
        def cdnErrors = CdnLog.createCriteria().list{
            'in'("level", errLevels)
            gt("timestamp", lastFiveDays)
            maxResults(50)
        }

		def cdnChartData = logsService.getChartData(cdnErrors)
		
        [cdnErrors: cdnErrors.sort{it.timestamp},cdnChartData:cdnChartData]
    }
	
	def appErrors = {
		Date lastFiveDays = new Date() - 5
    	List errLevels = ["ERROR", "FATAL"]
    
		def appErrors = AppLog.createCriteria().list{
        	'in'("level", errLevels)
        	gt("timestamp", lastFiveDays)
        	maxResults(50)
    	}
		def appChartData = logsService.getChartData(appErrors)
	
    [appErrors:appErrors.sort{it.timestamp},appChartData:appChartData]
	}
	
    def tail = {
        def level = "DEBUG"
		def app = "cdn"
		def recentMsgs = logsService.getTailData(level, app)
		[levels:levels, apps:apps, level:level, app:app, msgs: recentMsgs]
    }

    def ajaxUpdateTail = {
        def level = params.level
		def recentMsgs = logsService.getTailData(params.level, params.app)				
		render(template:"tailData", model:[msgs:recentMsgs])

    }

    def search = {
        def _level = "DEBUG"
        def q = ""

        [apps:apps, levels:levels,level:_level, query:q]
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
		def searchResults = []
		if(params.app.toLowerCase() == 'cdn')
		{
			searchResults = CdnLog.createCriteria().list{
	            between("timestamp", startDate, endDate)
	            if(_level != "ALL")
					eq("level", _level)
	            if(q)
	                ilike("message", '%' + q+'%')
	            order("timestamp", "desc")
	            maxResults(100)
	        }
		}
		else{
        	searchResults = AppLog.createCriteria().list{
            between("timestamp", startDate, endDate)
			if(_level != "ALL")
				eq("level", _level)
            if(q)
                ilike("message", '%' + q+'%')
            order("timestamp", "desc")
            maxResults(100)
        	}
		}
		searchResults = searchResults.sort{it.timestamp}
        render(template:"searchResults", model:[results:searchResults])
    }
}
