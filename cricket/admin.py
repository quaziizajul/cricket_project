# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin
from cricket.models import *

# Register your models here.


admin.site.register(Player)
admin.site.register(PlayerHistory)
admin.site.register(Country)
admin.site.register(Team)
admin.site.register(Matches)
