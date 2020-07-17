# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render
from django.http import HttpResponse
from cricket.models import Team, Player ,Matches
from utils.ErrorLogger import log_exception
from django.template import loader
from django.db.models import Q
import random,datetime

# Create your views here.

#View to display team list
def getTeamList(request):
    temas_list = Team.objects.all()
    template = loader.get_template('team_list.html')
    context = {
        'team_list': temas_list,
    }
    return HttpResponse(template.render(context, request))

#View to display the player list of a team
def getTeamDetails(request,id):
    team = Team.objects.get(teamId=id)
    players = Player.objects.filter(teamId=id)
    template = loader.get_template('team_details.html')
    context = {
        'team':team,
        'players': players,
    }
    return HttpResponse(template.render(context, request))



#View to display fixtures
def getFixtures(request):
    fixture_data = create_fixture()
    template = loader.get_template('fixtures.html')
    context = {
        'fixture_data':fixture_data,
    }
    return HttpResponse(template.render(context, request))

# Function to create fixure. This will chnage in every call as we are not saving it in database.
#Assuming there will be 2 mathes for each team pair, One home and one away
@log_exception
def create_fixture():
    match_start_date = datetime.datetime(2020, 11, 1, 10, 00) #selecting a random date of match start
    teams = Team.objects.all()
    result = []

    for team in teams:
        for team_copy in teams.exclude(teamId=team.teamId):# loop through other teams again and filter out the current team
            result.append({"team":"%s Vs %s" % (team.teamName, team_copy.teamName),'place':team.clubState})
    
    random.shuffle(result)
    #to set data of the match
    for item in result:
        item['match_date'] = match_start_date
        match_start_date = match_start_date + datetime.timedelta(days=2)

    return  result


def pointsTable(request):
    points_data = create_points_table_data()
    template = loader.get_template('points_table.html')
    context = {
        'points_data':points_data,
    }
    return HttpResponse(template.render(context, request))

@log_exception
def create_points_table_data():    
    result = []
    teams = Team.objects.all()
    for team in teams:        
        match_played = Matches.objects.filter(Q(team1_id =team.teamId)|Q(team2_id =team.teamId)).count()
        match_won = Matches.objects.filter(winerTeam_id =team.teamId).count()
        points = 2 * match_won
        result.append({'team':team.teamName,'match_played':match_played,'match_won':match_won,'points':points})

    return result
