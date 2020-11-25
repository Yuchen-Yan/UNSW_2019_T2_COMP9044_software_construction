function countStats(data) {
    let match = Number(0);
    let t = Number(0);
    for (let i = 0; i<data.length; i++){
        match = match + Number(data[i].matches);
        t = t + Number(data[i].tries);
    }
    return {
                matches: match,
                tries: t
            }
}

const json = process.argv[2];
if (json === undefined) {
    throw new Error(`input not supplied`);
}
// include the json file via node's module system,
// this parses the json file into a JS object
// NOTE: this only works via node and will not work in the browser
const stats = require(`./${json}`);

console.log(countStats(stats.results));