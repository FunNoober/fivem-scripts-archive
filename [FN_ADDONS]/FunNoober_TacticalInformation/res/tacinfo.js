const WHOLE_UI = document.getElementById("whole-ui")

window.addEventListener('message', (event) => {
    let data = event.data
    if(data.type === "update"){
        let direction = data.info.dir.replace("_", " ")
        document.getElementById('dir').innerHTML = direction
        document.getElementById("time").innerHTML = `${data.info.day} ${data.info.hour}:${data.info.minute}`
        document.getElementById("play-name").innerHTML = data.info.playerName
        document.getElementById("position").innerHTML = `${data.info.x}, ${data.info.y}, ${data.info.z}`
        document.getElementById("road").innerHTML = data.info.location
        document.getElementById("postal").innerHTML = `NEAREST POSTAL: ${data.info.postal}`
        document.getElementById("aop").innerHTML = `AOP: ${data.info.aop}`
        document.getElementById('status911').innerHTML = data.info.recent911Call
        document.getElementById('dutyStatus').innerHTML = data.info.dutyStatus
    }
    if(data.type === "show"){
        WHOLE_UI.style.visibility = "visible"
    }
    if(data.type === "hide"){
        WHOLE_UI.style.visibility = "hidden"
    }
})