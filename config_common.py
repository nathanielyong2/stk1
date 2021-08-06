# Logging levels are debug, info, warning, error, critical
logger_config = {"enable_logging": True,
                 "log_level": "info",
                 "save_to_log_file": True,
                 "log_filename": "/work/logs/log_stk.{app_name}.{yyyymmdd}.txt",
                 "print_to_terminal": True}
eoddata_config={"dir_downloads": "/users/andrew/downloads",
                "dir_eoddata": "/work/eoddata"}