const rows = document.querySelectorAll("tr");

const results = [];

rows.forEach(row => {
    const rankCell = row.querySelector("td:first-child");
    const link = row.querySelector(".game-name a");
    const currentPlayersCell = row.querySelector("td.num:not(.period-col)");

    if (rankCell && link && currentPlayersCell) {
        const rank = parseInt(rankCell.textContent.replace(".", "").trim());

        const href = link.getAttribute("href");
        const appid = parseInt(href.replace("/app/", "").trim());

        const concurrentPlayers = parseInt(
            currentPlayersCell.textContent.replace(/,/g, "").trim()
        );

        results.push({
            rank: rank,
            appid: appid,
            concurrent_players: concurrentPlayers
        });
    }
});

console.log(JSON.stringify(results, null, 4));
