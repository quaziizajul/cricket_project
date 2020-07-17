# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Country(models.Model):
    CONTINENT_CHOICES = (
        ('Asia', 'Asia'),
        ('Europe', 'Europe'),
        ('North America', 'North America'),
        ('Africa', 'Africa'),
        ('Oceania', 'Oceania'),
        ('Antarctica', 'Antarctica'),
        ('South America', 'South America'),
    )
    code = models.CharField(max_length=3, primary_key=True, verbose_name='Country Code')
    name = models.CharField(max_length=60, verbose_name='Country Name')
    continent = models.CharField(max_length=20, choices=CONTINENT_CHOICES, default='Asia')

    def __unicode__(self):
        return self.name

    class Meta:
        db_table = 'country'

class Team(models.Model):
    teamId = models.AutoField(primary_key=True)
    teamName = models.CharField(max_length=50)
    logoURL = models.URLField(max_length=500)
    clubState = models.CharField(max_length=50) 

    def __unicode__(self):
        return self.teamName
    class Meta:
        db_table = 'team'

class Player(models.Model):
    playerId = models.AutoField(primary_key=True)
    countryId = models.ForeignKey(Country)
    teamId = models.ForeignKey(Team)
    firstName = models.CharField(max_length=50)
    lastName = models.CharField(max_length=50)  
    imageURL = models.URLField(max_length=500)
    jerse_number = models.IntegerField()
    def __unicode__(self):
        return self.firstName
    def getFullName(self):
        return self.firstName +' '+ self.lastName  
    
    class Meta:
        db_table = 'player'


class Matches(models.Model):
    matchId = models.AutoField(primary_key=True)
    team1 = models.ForeignKey(Team, related_name='team1')
    team2 = models.ForeignKey(Team, related_name='team2')
    winerTeam = models.ForeignKey(Team, related_name='winerTeam')
    matchDate = models.DateField()

    def __unicode__(self):
        return str(self.matchId)

    class Meta:
        db_table = 'matches'


class PlayerHistory(models.Model):
    historyId = models.AutoField(primary_key=True)
    playerId = models.ForeignKey(Player,on_delete=models.CASCADE)
    matches = models.IntegerField(default=0)
    run = models.IntegerField(default=0)
    highest_score = models.IntegerField(default=0)
    fifties = models.IntegerField(default=0)
    hundreds = models.IntegerField(default=0)
    def __unicode__(self):
        return self.historyId

    class Meta:
        db_table = 'player_history'                