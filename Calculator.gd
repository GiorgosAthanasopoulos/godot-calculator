extends Node2D

func _on_seven_pressed():
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "7"


func _on_eight_pressed():
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "8"


func _on_nine_pressed():
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "9"


func _on_four_pressed():
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "4"


func _on_five_pressed():
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "5"


func _on_six_pressed():
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "6"


func _on_one_pressed():
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "1"


func _on_two_pressed():
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "2"


func _on_three_pressed():
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "3"


func _on_zero_pressed():
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "0"


func operator(char: String) -> bool:
	return char == "+" or char == "-" or char == "*" or char == "/"


func numeric(char: String) -> bool:
	return char in "0123456789"


func can_place_op() -> bool:
	var text = $ParentMarginContainer/VerticalContentContainer/Row1/Display.text
	return text != "" and not operator(text[len(text)-1])


func get_last_display_number():
	var index = -1
	var i = 0
	var text = $ParentMarginContainer/VerticalContentContainer/Row1/Display.text
	if not len(text) > 0:
		return
	for char in text:
		if operator(char):
			index = i + 1
		i += 1
	return text.substr(index, len(text)-index) if not operator(text[len(text)-1]) else text.substr(index, len(text)-index-1)


func _on_period_pressed():
	var text = $ParentMarginContainer/VerticalContentContainer/Row1/Display.text
	var lastTextChar = text[len(text) - 1]
	if numeric(lastTextChar) and not "." in get_last_display_number():
		$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "."


func _on_slash_pressed():
	if can_place_op():
		$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "/"


func _on_star_pressed():
	if can_place_op():
		$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "*"


func _on_minus_pressed():
	if can_place_op():
		$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "-"


func _on_plus_pressed():
	if can_place_op():
		$ParentMarginContainer/VerticalContentContainer/Row1/Display.text += "+"


func _on_clear_pressed():
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text = ""


func _on_equals_pressed():
	var text = $ParentMarginContainer/VerticalContentContainer/Row1/Display.text
	var expression = Expression.new()
	expression.parse(text)
	var result = expression.execute()
	$ParentMarginContainer/VerticalContentContainer/Row1/Display.text = String.num(result)
