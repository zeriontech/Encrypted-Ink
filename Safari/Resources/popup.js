function switchAccount() {
    browser.tabs.query({active: true, currentWindow: true}, function(tabs) {
        browser.tabs.sendMessage(tabs[0].id, {greeting: "hello"});
    });
}

document.getElementById("account").onclick = switchAccount;
