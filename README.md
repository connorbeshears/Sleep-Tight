# Sleep-Tight
Sleep Tracking app to obtain a persons sleeping habits and make predictions on how to better their sleep schedule 
How to use the app:

	- The start button will start the time
	- The stop button will stop the time, and segue into the response screen 
		- Known bug, immediately pressing stop without pressing start will still take you to the response screen
	- The response screen will have 5 feeling buttons, select how you feel after you wake up, this will record all sleep data in core data
	
	- Pressing on the graph button on the TabView will take you to the sleep records
	- Currently there are 3 developer buttons built in for testing purposes
		- Pressing print data will print all data from core data to the console
		- Pressing pop test will generate 7 days of data, randomized with sleep length and feeling, from the dates 4/11/18 - 4/17/18
		- Pressing delete all will remove all of the data in core data.


Completion Status:
	- Tracking start/end of sleep - complete
	- Storing sleep data on phone - complete
	- Graphing sleep data - complete
	- Predictions on how much sleep you need - uncompleted, graph will show correlation
	- Sleep Tight Apple Watch companion - incomplete 
