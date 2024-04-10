let aop = "Whole Map"
const buttons = document.getElementsByClassName("navigation-item")
const backgroundContents = document.getElementById("content")
const images = ["legion-square.jpg", "sandy-airfield.jpg", "paleto-gas-station.jpg", "grapeseed-mainstreet.jpg", "fort-zancudo.jpg", "vespuci-pier.jpg", "cayo-perico-spawn.jpg", "lsia-spawn.jpg"]
let selectedSpawn = 0

for (let i = 0; i < buttons.length; i++){
    buttons[i].addEventListener("click", function(){
        backgroundContents.style.backgroundImage = `url(assets/${images[i]})`
        selectedSpawn = buttons[i].dataset.index
    })
}

document.getElementById("go-button").addEventListener("click", function(){
    fetch(`https://${GetParentResourceName()}/selectedspawn`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({spawnId: selectedSpawn})
    }).then(resp => resp.json()).then(resp => console.log(resp));
    backgroundContents.style.display = "none"
})

window.addEventListener('message', (event) => {
    if(event.data.type === 'aop_set'){
        aop = event.data.aop_value
        document.getElementById('heading-urrp').innerHTML = `West Side San Andreas Roleplay | AOP: ${aop}`
    }
});