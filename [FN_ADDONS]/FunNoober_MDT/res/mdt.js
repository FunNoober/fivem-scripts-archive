window.addEventListener('message', (event) => {
    let data = event.data
    if (data.type == 'show'){
        document.getElementById('mdt-outer').style.visibility = "visible"
        document.getElementById('speed-display').innerHTML = data.speed + " MPH"
        document.getElementById('plate-display').innerHTML = data.plate
    }
    if (data.type == 'hide'){
        document.getElementById('mdt-outer').style.visibility = "hidden"
    }
    if (data.type == 'updatelockstatus'){
        let lockStatusDisplay = document.getElementById('locked-status')
        if (data.locked == true){
            lockStatusDisplay.innerHTML = 'LOCKED [U]'
        }else{
            lockStatusDisplay.innerHTML = 'UNLOCKED [U]'
        }
    }
    if (data.type == 'EmergencyCall'){
        document.getElementById('call-source').innerHTML = data.callSource
        document.getElementById('call-contents').innerHTML = data.contents.toUpperCase()
        document.getElementById('call-location').innerHTML = data.callLocation
    }
})