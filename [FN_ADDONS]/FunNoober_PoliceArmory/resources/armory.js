// Fun Noober - 2023

// https://wiki.rage.mp/index.php?title=Weapons_Components
// https://wiki.rage.mp/index.php?title=Weapons
const weaponsData = {
    "weapons": [
        {
            "weapon-name": "M4A1 Carbine",
            "weapon-hash": "WEAPON_CARBINERIFLE",
            "attachements": [
                {
                    "attachement-name": "Holo-sight",
                    "attachement-hash": "COMPONENT_AT_SCOPE_MEDIUM"
                },
                {
                    "attachement-name": "Suppressor",
                    "attachement-hash": "COMPONENT_AT_AR_SUPP"
                },
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_CARBINERIFLE_CLIP_01"
                },
                {
                    "attachement-name": "Extended Mag",
                    "attachement-hash": "COMPONENT_CARBINERIFLE_CLIP_02"
                }
            ]
        },
        {
            "weapon-name": "Sepcial Carbine",
            "weapon-hash": "WEAPON_SPECIALCARBINE",
            "attachements": [
                {
                    "attachement-name": "Scope",
                    "attachement-hash": "COMPONENT_AT_SCOPE_MEDIUM"
                },
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Grip",
                    "attachement-hash": "COMPONENT_AT_AR_AFGRIP"
                },
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_SPECIALCARBINE_CLIP_01"
                },
                {
                    "attachement-name": "Extended Mag",
                    "attachement-hash": "COMPONENT_SPECIALCARBINE_CLIP_02"
                }
            ]
        },
        {
            "weapon-name": "Bullpup Rifle",
            "weapon-hash": "WEAPON_BULLPUPRIFLE",
            "attachements": [
                {
                    "attachement-name": "Scope",
                    "attachement-hash": "COMPONENT_AT_SCOPE_SMALL"
                },
                {
                    "attachement-name": "Grip",
                    "attachement-hash": "COMPONENT_AT_AR_AFGRIP"
                },
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_BULLPUPRIFLE_CLIP_01"
                },
                {
                    "attachement-name": "Extended Mag",
                    "attachement-hash": "COMPONENT_BULLPUPRIFLE_CLIP_02"
                }
            ]   
        },
        {
            "weapon-name": "Assault Rifle",
            "weapon-hash": "WEAPON_ASSAULTRIFLE",
            "attachements": [
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Scope",
                    "attachement-hash": "COMPONENT_AT_SCOPE_MACRO"
                },
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Extended Mag",
                    "attachement-hash": "COMPONENT_ASSAULTRIFLE_CLIP_02"
                }
            ]
        },
        {
            "weapon-name": "Heavy Rifle",
            "weapon-hash": "WEAPON_HEAVYRIFLE",
            "attachements": [
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_HEAVYRIFLE_CLIP_01"
                },
                {
                    "attachement-name": "Extended Mag",
                    "attachement-hash": "COMPONENT_HEAVYRIFLE_CLIP_02"
                },
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Scope",
                    "attachement-hash": "COMPONENT_AT_SCOPE_MEDIUM"
                },
                {
                    "attachement-name": "Suppressor",
                    "attachement-hash": "COMPONENT_AT_AR_SUPP"
                }
            ]
        },
        {
            "weapon-name": "Tactical Rifle",
            "weapon-hash": "WEAPON_TACTICALRIFLE",
            "attachements": [
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH_REH"
                },
                {
                    "attachement-name": "Grip",
                    "attachement-hash": "COMPONENT_AT_AR_AFGRIP"
                }
            ]
        },
        {
            "weapon-name": "Coil PDW",
            "weapon-hash": "WEAPON_COMBATPDW",
            "attachements": [
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Grip",
                    "attachement-hash": "COMPONENT_AT_AR_AFGRIP"
                },
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_COMBATPDW_CLIP_01"
                },
                {
                    "attachement-name": "Extended Mag",
                    "attachement-hash": "COMPONENT_COMBATPDW_CLIP_02"
                }
            ]
        },
        {
            "weapon-name": "Pistol",
            "weapon-hash": "WEAPON_PISTOL",
            "attachements": [
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_PI_FLSH"
                },
                {
                    "attachement-name": "Suppressor",
                    "attachement-hash": "COMPONENT_AT_PI_SUPP_02"
                },
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_PISTOL_CLIP_01"
                },
                {
                    "attachement-name": "Extended Mag",
                    "attachement-hash": "COMPONENT_PISTOL_CLIP_02"
                }
            ]
        },
        {
            "weapon-name": "Combat Pistol",
            "weapon-hash": "WEAPON_COMBATPISTOL",
            "attachements": [
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_PI_FLSH"
                },
                {
                    "attachement-name": "Suppressor",
                    "attachement-hash": "COMPONENT_AT_PI_SUPP"
                },
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_COMBATPISTOL_CLIP_01"
                },
                {
                    "attachement-name": "Extended Mag",
                    "attachement-hash": "COMPONENT_COMBATPISTOL_CLIP_02"
                }
            ]
        },
        {
            "weapon-name": "SMG",
            "weapon-hash": "WEAPON_SMG",
            "attachements": [
                {
                    "attachement-name": "Scope",
                    "attachement-hash": "COMPONENT_AT_SCOPE_MACRO_02"
                },
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Suppressor",
                    "attachement-hash": "COMPONENT_AT_PI_SUPP"
                },
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_SMG_CLIP_01"
                },
                {
                    "attachement-name": "Extended Mag",
                    "attachement-hash": "COMPONENT_SMG_CLIP_02"
                }
            ]
        },
        {
            "weapon-name": "Tactical SMG",
            "weapon-hash": "WEAPON_TECPISTOL",
            "attachements": []
        },
        {
            "weapon-name": "Pump shotgun",
            "weapon-hash": "WEAPON_PUMPSHOTGUN",
            "attachements": [
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Suppressor",
                    "attachement-hash": "COMPONENT_AT_SR_SUPP"
                }
            ]
        },
        {
            "weapon-name": "Pump Shotgun MK.2",
            "weapon-hash": "WEAPON_PUMPSHOTGUN_MK2",
            "attachements": [
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Suppressor",
                    "attachement-hash": "COMPONENT_AT_SR_SUPP_03"
                },
                {
                    "attachement-name": "Holosight",
                    "attachement-hash": "COMPONENT_AT_SIGHTS"
                },
                {
                    "attachement-name": "Scope",
                    "attachement-hash": "COMPONENT_AT_SCOPE_SMALL_MK2"
                },
                {
                    "attachement-name": "Normal Shells",
                    "attachement-hash": "COMPONENT_PUMPSHOTGUN_MK2_CLIP_01"
                },
                {
                    "attachement-name": "Steel Buckshot",
                    "attachement-hash": "COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING"
                },
                {
                    "attachement-name": "Flechette Shells",
                    "attachement-hash": "COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT"
                }
            ]
        },
        {
            "weapon-name": "Bullpup Shotgun",
            "weapon-hash": "WEAPON_BULLPUPSHOTGUN",
            "attachements": [
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Grip",
                    "attachement-hash": "COMPONENT_AT_AR_AFGRIP"
                },
                {
                    "attachement-name": "Suppressor",
                    "attachement-hash": "COMPONENT_AT_AR_SUPP_02"
                }
            ]
        },
        {
            "weapon-name": "Assault Shotgun",
            "weapon-hash": "WEAPON_ASSAULTSHOTGUN",
            "attachements": [
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Grip",
                    "attachement-hash": "COMPONENT_AT_AR_AFGRIP"
                },
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_ASSAULTSHOTGUN_CLIP_01"
                },
                {
                    "attachement-name": "Extended Mag",
                    "attachement-hash": "COMPONENT_ASSAULTSHOTGUN_CLIP_01"
                }
            ]
        },
        {
            "weapon-name": "Sniper rifle",
            "weapon-hash": "WEAPON_SNIPERRIFLE",
            "attachements": [
                {
                    "attachement-name": "Suppressor",
                    "attachement-hash": "COMPONENT_AT_AR_SUPP_02"
                },
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_SNIPERRIFLE_CLIP_01"
                },
                {
                    "attachement-name": "Default Scope",
                    "attachement-hash": "COMPONENT_AT_SCOPE_LARGE"
                },
                {
                    "attachement-name": "Advanced Scope",
                    "attachement-hash": "COMPONENT_AT_SCOPE_MAX"
                }
            ]
        },
        {
            "weapon-name": "Marksman Rifle",
            "weapon-hash": "WEAPON_MARKSMANRIFLE",
            "attachements": [
                {
                    "attachement-name": "Flashlight",
                    "attachement-hash": "COMPONENT_AT_AR_FLSH"
                },
                {
                    "attachement-name": "Suppressor",
                    "attachement-hash": "COMPONENT_AT_AR_SUPP"
                },
                {
                    "attachement-name": "Scope",
                    "attachement-hash": "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM"
                },
                {
                    "attachement-name": "Default Mag",
                    "attachement-hash": "COMPONENT_MARKSMANRIFLE_CLIP_01"
                },
                {
                    "attachement-name": "Extended Mag",
                    "attachement-hash": "COMPONENT_MARKSMANRIFLE_CLIP_02"
                }
            ]
        },
        {
            "weapon-name": "Precision Rifle",
            "weapon-hash": "WEAPON_PRECISIONRIFLE",
            "attachements": []
        },
        {
            "weapon-name": "Grenade",
            "weapon-hash": "WEAPON_GRENADE",
            "attachements": []
        },
        {
            "weapon-name": "BZGas",
            "weapon-hash": "WEAPON_BZGAS",
            "attachements": []
        },
        {
            "weapon-name": "Fire extinguisher",
            "weapon-hash": "WEAPON_FIREEXTINGUISHER",
            "attachements": []
        },
        {
            "weapon-name": "Taser",
            "weapon-hash": "WEAPON_STUNGUN",
            "attachements": []
        },
        {
            "weapon-name": "Flashlight",
            "weapon-hash": "WEAPON_FLASHLIGHT",
            "attachements": []
        },
        {
            "weapon-name": "Knife",
            "weapon-hash": "WEAPON_KNIFE",
            "attachements": []
        },
        {
            "weapon-name": "Nightstick",
            "weapon-hash": "WEAPON_NIGHTSTICK",
            "attachements": []
        }
    ]
}

window.addEventListener('message', (event) => {
    if (event.data.type == 'open'){
        document.getElementById('armory').style.visibility = 'visible'
        document.getElementById('body').style.display = 'block'
    }
    else{
        document.getElementById('armory').style.visibility = 'hidden'
        document.getElementById('body').style.display = 'none'
    }
})

function createWeapons(){
    let armory = document.getElementById("armory-container")
    for (let i = 0; i < weaponsData.weapons.length; i++){
        var item = document.createElement('div')
        item.classList.add('weapon-card')
        item.innerHTML = `
        <div class="weapon-title flex-horizontal">
            <h2>${weaponsData.weapons[i]["weapon-name"]}</h2>
            <button data-weapon-hash="${weaponsData.weapons[i]["weapon-hash"]}" class="add-weapon-button">+</button>
        </div>`

        for (let x = 0; x < weaponsData.weapons[i].attachements.length; x++){
            item.innerHTML = item.innerHTML + `
            <div class="weapon-attachements flex-horizontal">
                <h3>${weaponsData.weapons[i].attachements[x]["attachement-name"]}</h3>
                <button data-attachement-hash="${weaponsData.weapons[i].attachements[x]["attachement-hash"]}" data-weapon-hash="${weaponsData.weapons[i]["weapon-hash"]}" class="add-attachement-button">+</button>
            </div>`
        }
        armory.appendChild(item)
    }
}

createWeapons()

function manageListeners(){
    let weaponButtons = document.getElementsByClassName("add-weapon-button")
    let attachementButtons = document.getElementsByClassName("add-attachement-button")
    for (let i = 0; i < weaponButtons.length; i++){
        weaponButtons[i].addEventListener("click", (event) => {
            // weaponButtons[i].dataset.weaponHash
            fetch(`https://${GetParentResourceName()}/giveweapon`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                },
                body: JSON.stringify({
                    weaponHash: weaponButtons[i].dataset.weaponHash
                })
            }).then(resp => resp.json())
        })
    }
    for (let x = 0; x < attachementButtons.length; x++){
        attachementButtons[x].addEventListener("click", (event) => {
            // attachementButtons[x].dataset.attachementHash
            fetch(`https://${GetParentResourceName()}/giveattachement`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                },
                body: JSON.stringify({
                    weaponHash: attachementButtons[x].dataset.weaponHash,
                    weaponAttachement: attachementButtons[x].dataset.attachementHash
                })
            }).then(resp => resp.json())
        })
    }
}

manageListeners()


document.getElementById("close-button").addEventListener("click", (event) => {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: "POST",
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    }).then(resp => resp.json())
})