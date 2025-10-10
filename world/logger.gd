extends Node

enum LogType {DEFAULT, WARNING, ERROR}

func log(who: Object, text: String, type: LogType = LogType.DEFAULT):
	match type:
		LogType.DEFAULT: 
			print("[{0}]: {1}".format({0: who, 1: text}))
		LogType.WARNING:
			print("WARNING!\n[{0}]: {1}".format({0: who, 1: text}))
		LogType.ERROR:
			printerr("[{0}]: {1}".format({0: who, 1: text}))
