extends Control

onready var seeds_container = $MarginContainer/TabContainer/Seeds/ScrollContainer/VBoxContainer
onready var drinks_container = $MarginContainer/TabContainer/Drinks/ScrollContainer/VBoxContainer
onready var shop_item_scene = preload("res://src/scenes/Shop/ShopHBox.tscn")

var money = GameState.global_money

# create dictionary containing info ab every item shop item
# - asset
# - name
# - sell
# - buy
# - id
var shop_items: Dictionary = {
	"seeds": [
		Utils.ShopItem.new(
			load("res://assets/shop/shop_item_icons/potato_seeds.png"),
			"Potato Seeds",
			5,
			10,
			"potato_seeds"
		),
		Utils.ShopItem.new(
			load("res://assets/shop/shop_item_icons/carrot_seeds.png"),
			"Carrot Seeds",
			5,
			10,
			"carrot_seeds"
		),
		Utils.ShopItem.new(
			load("res://assets/shop/shop_item_icons/onion_seeds.png"),
			"Onion Seeds",
			5,
			10,
			"onion_seeds"
		),
		Utils.ShopItem.new(
			load("res://assets/shop/shop_item_icons/pepper_seeds.png"),
			"Pepper Seeds",
			5,
			10,
			"pepper_seeds"
		),
		Utils.ShopItem.new(
			load("res://assets/shop/shop_item_icons/salad_seeds.png"),
			"Salad Seeds",
			5,
			10,
			"salad_seeds"
		),
		Utils.ShopItem.new(
			load("res://assets/shop/shop_item_icons/tomat_seeds.png"),
			"Tomato seeds",
			5,
			10,
			"tomat_seeds"
		)
	],
	"drinks": [
		Utils.ShopItem.new(
			load("res://assets/shop/shop_item_icons/water_bottle.png"),
			"Water Bottle",
			0,
			10,
			"water_bottle"
		)
	]
}

func _ready():
	# instance shop item scenes in the shop ui for every item in shop_items
	for i in shop_items.seeds:
		var hboxcontainer: Node = shop_item_scene.instance();
		$MarginContainer/TabContainer/Seeds/ScrollContainer/VBoxContainer.add_child(hboxcontainer)
		hboxcontainer.get_node("ItemIcon").texture = i.texture
		hboxcontainer.get_node("ItemName").text = i.text
		hboxcontainer.get_node("ButtonSell").text = "Sell $" + String(i.sell_price) 
		hboxcontainer.get_node("ButtonBuy").text = "Buy $" + String(i.buy_price)
		hboxcontainer.id = i.id
		hboxcontainer.sell_price = i.sell_price
		hboxcontainer.buy_price = i.buy_price
		hboxcontainer.connect("ArbitraryButton_pressed", self, "_on_ArbitraryButton_pressed")
	
	for i in shop_items.drinks:
		var hboxcontainer: Node = shop_item_scene.instance();
		$MarginContainer/TabContainer/Drinks/ScrollContainer/VBoxContainer.add_child(hboxcontainer)
		hboxcontainer.get_node("ItemIcon").texture = i.texture
		hboxcontainer.get_node("ItemName").text = i.text
		hboxcontainer.get_node("ButtonSell").text = "Sell $" + String(i.sell_price) 
		hboxcontainer.get_node("ButtonBuy").text = "Buy $" + String(i.buy_price)
		hboxcontainer.get_node("ButtonSell").visible = false
		hboxcontainer.id = i.id
		hboxcontainer.buy_price = i.buy_price
		hboxcontainer.connect("ArbitraryButton_pressed", self, "_on_ArbitraryButton_pressed")

func _process(delta):
	for i in seeds_container.get_children():
		var button_sell = i.get_node("ButtonSell")
		var button_buy = i.get_node("ButtonBuy")
		var button_sell_price = i.sell_price
		var button_buy_price = i.buy_price
		if button_buy_price > money:
			button_buy.disabled = true
	
	for i in drinks_container.get_children():
		var button_buy = i.get_node("ButtonBuy")
		var button_buy_price = i.buy_price
		if button_buy_price > money:
			button_buy.disabled = true

func _on_ArbitraryButton_pressed(id, type):
	print(id, " ", type)
	
