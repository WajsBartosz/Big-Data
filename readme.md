
# Big Data project

Here is a small instruction how to run scripts in order to generate your own JSON instead of using this in project.

## 1. Run Python script GetIDs.py
In order to do this, please type in terminal:

```
python3 GetIDs.py
```

_Keep in mind that you need to have Python installed._


Above script will generate a JSON with a list of top 100 games from Steam

## 2. If you would like to get more games you can use GetIDs.js script on site https://steamcharts.com/top

In order to do this, please copy the script, open the page https://steamcharts.com/top/p.5 (on this page the first game is the 101st game), open the console of your web browser and paste the script in console. You should receive a list from JSON that is ready to paste for JSON generated in previous point.


## 3. When you have JSON with games you can run script GetGamesData.py.
Type in terminal 

```
python3 GetGamesData.p
```

_Keep in mind that this script can take a couple of minutes (the more games you have in JSON the longer it will take)_

## 4. Once the script is finished you can use page https://codebeautify.org/json-to-jsonl-converter to convert JSON to JSONL

## 5. When you have JSONL file ready, you can upload it to GCP Big Query




