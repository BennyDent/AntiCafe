extends CenterContainer



var data: ActionText:
	set(set_data):
		print(set_data.action_text)
		$RichTextLabel.text = set_data.action_text;
		data = set_data
	get:
		return data;
