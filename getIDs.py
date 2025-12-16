import requests
import json

URL = "https://api.steampowered.com/ISteamChartsService/GetGamesByConcurrentPlayers/v1/"

Response = requests.get(URL)
FilteredData = []

if Response.status_code == 200:
    ResponseJSON = Response.json()
    for Game in ResponseJSON["response"]["ranks"]:
        # print(f"Game ranking: {Game["rank"]}, game ID: {Game["appid"]}, concurent players: {Game["concurrent_in_game"]}")
        FilteredData.append({
            "appid": Game["appid"],
            "rank": Game["rank"],
            "concurrent_players": Game["concurrent_in_game"]
        })
        
    with open("SteamGamesGoodV.json", "w", encoding = "utf-8") as f:
        json.dump(FilteredData, f, indent = 4)
else:
    print("There was some error with request")

