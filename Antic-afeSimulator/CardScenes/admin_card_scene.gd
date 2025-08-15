extends Node2D






func set_texts(card_data: AdminCardData):
	$FirsstAction.text = card_data.first_action.action_text
	$SecondAction.text = card_data.second_action.action_text
	$AdditionalAction.text = card_data.additional_action.action_text
