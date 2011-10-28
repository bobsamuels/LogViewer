package logviewer

class LogsService {
	static transactional = false
	
    def getChartData(def errorCollection){
		def sdf = new java.text.SimpleDateFormat("MM/dd/yyyy")
		
		def errStats = []
		def fatalStats = []
		def errCell = []
		def fatalCell = []
		Date lastFiveDays = new Date() - 5
		
		def errorsByDay = errorCollection.groupBy{
			sdf.format(it.timestamp)
		}
	
		def errCnt = 0
		def fatalCnt = 0
		((lastFiveDays-1)..(new Date()+1)).each{day->
			errCnt = 0
			fatalCnt = 0
		
			if(errorsByDay[sdf.format(day)])
			{
				errCnt = errorsByDay[sdf.format(day)].findAll{it.level == "ERROR"}.size()
				fatalCnt = errorsByDay[sdf.format(day)].findAll{it.level == "FATAL"}.size()
				}

				errCell = [day, errCnt]
				fatalCell = [day, fatalCnt]
				errStats.add(errCell)
				fatalStats.add(fatalCell)
			}
		def errCols = [['date', 'Day'], ['number', 'Error Count']]
		def fatalCols = [['date', 'Day'], ['number', 'Fatal Count']]
		['errStats':errStats, 'fatalStats':fatalStats, 'errCols':errCols, 'fatalCols':fatalCols]
	}
}
