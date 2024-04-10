const HTML_BODY = document.getElementById('html-body')

window.addEventListener('message', (event) => {
    if (event.data.type === 'open'){
        openNotepad()
    }
});

function openNotepad(){
    HTML_BODY.style.display = 'flex'
}

document.getElementById('close-button').addEventListener("click", function(){
    HTML_BODY.style.display = 'none'
    fetch(`https://${GetParentResourceName()}/closeNotepad`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            close: true
        })
    }).then(resp => resp.json())
})