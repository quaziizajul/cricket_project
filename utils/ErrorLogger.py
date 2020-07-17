import functools
import logging
import cricket
import os

def cricket_logger():
    """
    Creates a logging object and returns it
    """
    logger = logging.getLogger("cricket_logger")
    logger.setLevel(logging.INFO)

    # create the logging file handler
    path = os.path.dirname(os.path.dirname(os.path.abspath(cricket.__file__))) + "\\logs\\log.txt"
    fh = logging.FileHandler(path)

    fmt = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    formatter = logging.Formatter(fmt)
    fh.setFormatter(formatter)

    # add handler to logger object
    logger.addHandler(fh)
    return logger


def log_exception(function):
    """
    this decoration will log if there is any exception in the decorated function
    """
    @functools.wraps(function)
    def wrapper(*args, **kwargs):
        logger = cricket_logger()
        try:
            return function(*args, **kwargs)
        except:
            # log the exception
            print('exception')
            err = "There was an exception in  "
            err += function.__name__
            logger.exception(err)

            # re-raise the exception
            raise
    return wrapper