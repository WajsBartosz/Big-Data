import requests
import json
import time

def RequestWithRetries(URL, Retries = 10, Delay = 5):
    for Attempt in range(1, Retries + 1):
        try:
            Response = requests.get(URL, timeout=10)
            Response.raise_for_status()
            return Response
        except Exception as e:
            print(f"Try {Attempt}/{Retries} failed: {e}")
            if Attempt < Retries:
                time.sleep(Delay)
            else:
                print("All requests failed")
                return None

URL = "https://store.steampowered.com/api/appdetails?appids="
GamesData = []
ProblematicIDs = []

with open('SteamGames.json', 'r') as File:
    Data = json.load(File)

for Row in Data:
    NumberOfPlayers = Row['concurrent_players']
    GameID = Row['appid']
    Rank = Row['rank']
    print(f"{Rank}: {GameID}")
    RequestURL = URL + str(GameID)
    Response = RequestWithRetries(RequestURL)
    if Response is None:
        print(f"Problems with game: {GameID}")
        ProblematicIDs.append(GameID)
        continue

    print(Response)
    ResponseJSON = Response.json()
    if ResponseJSON[str(GameID)]['success'] == True:
        print(ResponseJSON)
        GameName = ResponseJSON[str(GameID)]['data']['name']
        print(f"{GameName}: {GameID}")
        IsFree = ResponseJSON[str(GameID)]['data']['is_free']
        try:
            SupportedLanguages = ResponseJSON[str(GameID)]['data']['supported_languages']
        except KeyError:
            SupportLanguages = None
        try:
            Developer = ResponseJSON[str(GameID)]['data']['developers']
        except KeyError:
            Developer = None
        try:
            NumberOfDLC = len(ResponseJSON[str(GameID)]['data']['dlc'])
        except KeyError:
            NumberOfDLC = 0
        try:
            Publisher = ResponseJSON[str(GameID)]['data']['publishers']
        except KeyError:
            Publisher = None
        PlayableOnWindows = ResponseJSON[str(GameID)]['data']['platforms']['windows']
        PlayableOnMac = ResponseJSON[str(GameID)]['data']['platforms']['mac']
        PlayableOnLinux = ResponseJSON[str(GameID)]['data']['platforms']['linux']
        try:
            Categories = ResponseJSON[str(GameID)]['data']['categories']
        except KeyError:
            Categories = {}
        try:
            Genres = ResponseJSON[str(GameID)]['data']['genres']
        except KeyError:
            Genres = None
        try:
            Achievements = ResponseJSON[str(GameID)]['data']['achievements']['total']
        except KeyError:
            Achievements = 0
        ReleaseDate = ResponseJSON[str(GameID)]['data']['release_date']['date']

        GamesData.append({
            "Rank": Rank,
            "Name": GameName,
            "GameID": GameID,
            "NumberOfPlayers": NumberOfPlayers,
            "ReleaseData": ReleaseDate,
            "IsFree": IsFree,
            "SupportedLanguages": SupportedLanguages,
            "Developer": Developer,
            "Publisher": Publisher,
            "PlayableOnWindows": PlayableOnWindows,
            "PlayableOnMac": PlayableOnMac,
            "PlayableOnLinux": PlayableOnLinux,
            "Categories": Categories,
            "NumberOfDLC": NumberOfDLC,
            "Genres": Genres,
            "NumberOfAchievements": Achievements
        })
        # print(GamesData)
        # print(ResponseJSON)
        # print(ResponseJSON[str(row['appid'])]['data']['name'])
        time.sleep(0.5)
    else:
        ProblematicIDs.append(GameID)

with open("GamesData.json", "w", encoding = "utf-8") as f:
    json.dump(GamesData, f, indent = 6)

print(ProblematicIDs)