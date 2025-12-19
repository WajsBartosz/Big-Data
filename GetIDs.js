const Rows = document.querySelectorAll("tr");

const Results = [];

Rows.forEach(row => {
    const RankCell = row.querySelector("td:first-child");
    const Link = row.querySelector(".game-name a");
    const CurrentPlayersCell = row.querySelector("td.num:not(.period-col)");

    if (RankCell && Link && CurrentPlayersCell) {
        const rank = parseInt(RankCell.textContent.replace(".", "").trim());

        const href = Link.getAttribute("href");
        const appid = parseInt(href.replace("/app/", "").trim());

        const concurrentPlayers = parseInt(
            CurrentPlayersCell.textContent.replace(/,/g, "").trim()
        );

        Results.push({
            rank: rank,
            appid: appid,
            concurrent_players: concurrentPlayers
        });
    }
});

console.log(JSON.stringify(Results, null, 4));
