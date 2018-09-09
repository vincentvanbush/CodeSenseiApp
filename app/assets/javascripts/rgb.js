document.addEventListener('keydown', function(e) {
	console.log('Key down: ' + e.key)
	var className
	switch (e.key) {
		case 'r':
			className = 'bg-danger'
			break
		case 'g':
			className = 'bg-success'
			break
		case 'b':
			className = 'bg-info'
			break
	}
	document.body.className =  className
})

document.addEventListener('keyup',  function(e) {
	console.log('Key up: ' + e.key)
	document.body.className = ''
})