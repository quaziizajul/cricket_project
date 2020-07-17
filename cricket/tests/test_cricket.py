from django.test import TestCase
from cricket.models import *
from utils.utilities import fact


class ViewsTestCase(TestCase):
    def setUp(self):
        country =Country.objects.create(code='IN',name='India',continent='Asia')
        Country.objects.create(code='UK',name='England',continent='Europe')
        team =Team.objects.create(teamName='India',logoURL='https://picsum.photos/20/20',clubState='Mumbai')
        Team.objects.create(teamName='England',logoURL='https://picsum.photos/20/20',clubState='Ovel')
        Player.objects.create(firstName='MS',lastName='Dhoni',teamId=team,imageURL='https://picsum.photos/20/20',countryId=country,jerse_number=7)
    def tearDown(self):
        Player.objects.all().delete()
        Team.objects.all().delete()
        Team.objects.all().delete()

    def test_home_page(self):
        """The index page loads properly"""
        response = self.client.get('http://127.0.0.1:81/cricket/team-list/')
        #test team should have logo and team name
        self.assertEqual(response.context['team_list'][0].logoURL, 'https://picsum.photos/20/20')
        self.assertEqual(response.context['team_list'][0].teamName, 'India')
        self.assertEqual(response.status_code, 200)

    def test_team_players_page(self):
        """team page should show properly"""
        team = Team.objects.get(teamName='India')
        response = self.client.get('http://127.0.0.1:81/cricket/get-team/'+str(team.teamId)+'/')
        #test player should have logo and player name shuld be firstname + lastname
        self.assertEqual(response.context['players'][0].imageURL, 'https://picsum.photos/20/20')
        player = Player.objects.get(playerId=int(response.context['players'][0].playerId))
        player_name = player.firstName +' '+ player.lastName
        self.assertEqual(str(response.context['players'][0].getFullName()), str(player_name))
        self.assertEqual(response.status_code, 200)


    def test_match_fixtures_page(self):
        """match fixtures should show correct data"""
        teams_count = Team.objects.all().count()
        response = self.client.get('http://127.0.0.1:81/cricket/fixtures/')
        match_count =len(response.context['fixture_data'])
        #test player should have logo and player name shuld be firstname + lastname
        self.assertEqual(match_count, fact(teams_count)/fact(teams_count-2))
        self.assertEqual(response.status_code, 200)
    
    def test_points_table_page(self):
        """match fixtures should show correct data"""        
        team = Team.objects.all()[0]
        match_own_by_team =  Matches.objects.filter(winerTeam = team).count()
        points =0
        
        response = self.client.get('http://127.0.0.1:81/cricket/points-table/')
        points_table =response.context['points_data']
        for item in points_table:
            if item['team'] == team.teamName:
                points = item['points']
        #test team points from number of matches won
        self.assertEqual(points, match_own_by_team*2)
        self.assertEqual(response.status_code, 200)