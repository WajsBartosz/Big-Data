const rows = document.querySelectorAll("tr");

const results = [];

rows.forEach(row => {
    const numberCell = row.querySelector("td:first-child");
    const link = row.querySelector(".game-name a");
    const peakCell = row.querySelector(".peak-concurrent");

    if (numberCell && link && peakCell) {

        const rank = parseInt(numberCell.textContent.replace(".", "").trim());

        const href = link.getAttribute("href");
        const appid = parseInt(href.replace("/app/", "").trim());

        const peak = parseInt(peakCell.textContent.replace(/,/g, "").trim());

        results.push({
            rank: rank,
            appid: appid,
            peak: peak
        });
    }
});

console.log(JSON.stringify(results, null, 4));
