function col_check(List,StartOn){
	if (is_array(List) == false) {
		show_message("The game has crashed due to failed collision array with " + object_get_name(object_index) + ", in instance " + string(id))
		game_end()
	}
	else {
	for (var j = StartOn; j < array_length(List); ++j) {
	
	for (var l = 0; l < instance_number(List[j]); ++l) {
	    var _select = instance_find(List[j],l)
    var _colcheck = instance_place(x,y,_select)
	if (_colcheck == noone) {
		continue
	}
	else {
		var _bleft = _colcheck.bbox_left;
		var _bright = _colcheck.bbox_right;
		var _btop = _colcheck.bbox_top;
		var _bbottom = _colcheck.bbox_bottom;
		_colcheck = instance_place(x,y,_select)
		if (_colcheck != noone) {
			var _xcol = sign(x - _colcheck.x);
			var _ycol = sign(y - _colcheck.y);
			var _sidex = array_create(2);
			var _sidey = array_create(2);
			switch (_xcol) {
				case 1:
				_sidex[0] = bbox_left;
				_sidex[1] = _bright;
				break;
				case 0:
				_sidex[0] = bbox_left;
				_sidex[1] = _bright;
				break;
				case -1:
				_sidex[0] = bbox_right;
				_sidex[1] = _bleft;
				break;
			}
			switch (_ycol) {
				case 1:
				_sidey[0] = bbox_top;
				_sidey[1] = _bbottom;
				break;
				case 0:
				_sidey[0] = bbox_top;
				_sidey[1] = _bbottom;
				break;
				case -1:
				_sidey[0] = bbox_bottom;
				_sidey[1] = _btop;
				break;
			}
			var _xscore = abs(_sidex[1] - _sidex[0])
			var _yscore = abs(_sidey[1] - _sidey[0])
			var _winnerIsX = false;
			if (_xscore >= _yscore){
				_winnerIsX = true;
				switch (_ycol) {
					case 1:
					y = _bbottom + (y - bbox_top);
					break;
					case 0:
					y = _bbottom + (y - bbox_top);
					break;
					case -1:
					y = _btop - (bbox_bottom - y);
					break;
				}
			}
			if (_xscore <= _yscore) {
				switch (_xcol) {
					case 1:
					x = _bright + (x - bbox_left);
					break;
					case 0:
					x = _bright + (x - bbox_left);
					break;
					case -1:
					x = _bleft - (bbox_right - x);
					break;
				}
			}				
		}
	}
}
}
}
}