
from django.conf.urls import url, include
from cricket.views import getTeamList, getTeamDetails,getFixtures,pointsTable

urlpatterns = [   
    url(r'^team-list/',getTeamList ,name='teams'),
    url(r'^get-team/(?P<id>\d+)/$', getTeamDetails, name='team-details'),
    url(r'^fixtures/', getFixtures, name='fixtures'),
    url(r'points-table/',pointsTable,name='points-table')
]