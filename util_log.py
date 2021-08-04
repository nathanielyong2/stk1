import datetime
import config_common
import logging
import sys
import os

def to_str(s):
    return '<NoneType>' if s is None else str(s)

def log(p_log_type:str, *args):
    v_log_msg=''
    for i, v_arg in enumerate(args):
        v_log_msg=v_log_msg+to_str(v_arg)
    logger(p_log_type, v_log_msg)

def logger(p_log_type: str, p_msg):
    try:
        v_app_name=os.environ['STK_APP_NAME']
        assert v_app_name is not None

        v_config_enable_logging=config_common.logger_config["enable_logging"]
        v_config_log_level = config_common.logger_config["log_level"]

        v_config_log_filename = config_common.logger_config["log_filename"]
        v_curr_date=datetime.datetime.now().strftime("%Y%m%d")
        v_config_log_filename=v_config_log_filename.replace("{yyyymmdd}", v_curr_date)
        v_config_log_filename=v_config_log_filename.replace("{app_name}", v_app_name)
        v_config_save_to_log_file = config_common.logger_config["save_to_log_file"]
        v_config_print_to_terminal = config_common.logger_config["print_to_terminal"]

        assert p_log_type in ("debug", "info", "warning", "error", "critical")
        assert v_config_log_level in ("debug", "info", "warning", "error", "critical")


        log_dict = {"debug": logging.DEBUG,
                    "info": logging.INFO,
                    "warning": logging.WARNING,
                    "error": logging.ERROR,
                    "critical": logging.CRITICAL}

        if v_config_enable_logging:

            file_handler = logging.FileHandler(filename=v_config_log_filename)
            stdout_handler = logging.StreamHandler(sys.stdout)
            if v_config_print_to_terminal and v_config_save_to_log_file:
                # save to log file and print to stdout
                handlers = [file_handler, stdout_handler]
            elif v_config_print_to_terminal:
                # only print to stdout
                handlers = [stdout_handler]
            else:
                # only save to the log file
                handlers = [file_handler]
            logging.basicConfig(format=' %(asctime)s - %(levelname)s - %(message)s',
                                handlers=handlers
                                )

            # use dict above to map the config log level to the Python logging level
            logging.getLogger().setLevel(log_dict[v_config_log_level])

            if p_log_type=="debug":
                logging.debug(p_msg)
            if p_log_type=="info":
                logging.info(p_msg)
            if p_log_type=="warning":
                logging.warning(p_msg)
            if p_log_type=="error":
                logging.error(p_msg)
            if p_log_type=="critical":
                logging.critical(p_msg)
    except:
        print("Error during logging!")
        raise