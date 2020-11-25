function buildPipe(f1, f2, f3) {
    const result = (a) => f3(f2(f1(a)));
    return result;
}

// This is how we can export functions in node
// in the same way we can use the "export" keyword in browser 
// side JS
module.exports = buildPipe;