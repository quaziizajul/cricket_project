from django.http import HttpResponse
from django.conf import settings
import traceback
from utils.ErrorLogger import cricket_logger

# Middleware to handle errror for production environment.
class ErrorHandlerMiddleware:

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        return response

    def process_exception(self, request, exception):
        if  settings.DEBUG:
            if exception:
                logger =cricket_logger()

                message = "exception occoured in {url} errror: \n\n{error}\n\n````traceback:\n{tb}````".format(
                    url=request.build_absolute_uri(),
                    error=repr(exception),
                    tb=traceback.format_exc()
                )
                #log this messgae into database/log file for debug purpose
                logger.exception(message)
                
            return HttpResponse("Oops!!..Error processing the request . Please contact your administrator", status=500)