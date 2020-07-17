from django.db import models
from django.forms import ModelForm
from cricket.models import *

class TeamsForm(ModelForm):
    class Meta:
        model = Team
        fields = ['teamName', 'logoURL', 'clubState']