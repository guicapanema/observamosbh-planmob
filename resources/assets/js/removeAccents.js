window.removeAccents = function (string) {
	let translate_regexp = /[áàãéèíìóòõúùç]/g;
	var translate = {
		'á': 'a', 'à': 'a', 'ã': 'a',
		'é': 'e', 'è': 'e',
		'í': 'i', 'ì': 'i',
		'ó': 'o', 'ò': 'o', 'õ': 'o',
		'ú': 'u', 'ù': 'u',
		'ç': 'c'
	};
	return (string.replace(translate_regexp, function(match) {
		return translate[match];
	}) );
}
