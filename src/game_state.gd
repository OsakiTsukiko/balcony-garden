extends Node

var player_position : Vector2 = Vector2(69, 69)
var global_money = 15

var inventory: Array = []

var items: Dictionary = {
	"potato_seeds": {
		"src": load("res://assets/items/potato_seeds.png")	
	},
	"carrot_seeds": {
		"src": load("res://assets/items/carrot_seeds.png")
	},
	"onion_seeds": {
		"src": load("res://assets/items/onion_seeds.png")
	},
	"pepper_seeds": {
		"src": load("res://assets/items/pepper_seeds.png")
	},
	"tomato_seeds": {
		"src": load("res://assets/items/tomat_seeds.png")
	},
	"salad_seeds": {
		"src": load("res://assets/items/salad_seeds.png")
	},

	"potato": {
		"src": load("res://assets/items/potato.png")
	},
	"carrot": {
		"src": load("res://assets/items/carrot.png")
	},
	"onion": {
		"src": load("res://assets/items/onion.png")
	},
	"pepper": {
		"src": load("res://assets/items/pepper.png")
	},
	"tomato": {
		"src": load("res://assets/items/tomato.png")
	},
	"salad": {
		"src": load("res://assets/items/salad.png")
	},

	"water_bottle": {
		"src": load("res://assets/items/water_bottle.png")
	},
	"milk_bottle": {
		"src": load("res://assets/items/milk_bottle.png")
	},
	"chocolate_milk": {
		"src": load("res://assets/items/chocolate_milk.png")
	},

	"organic_waste": {
		"src": load("res://assets/items/organic_waste.png")
	},
	"plastic_waste": {
		"src": load("res://assets/items/plastic_waste.png")
	},
	"paper_waste": {
		"src": load("res://assets/items/paper_waste.png")
	},

	"compost": {
		"src": load("res://assets/items/compost.png")
	}
}

func add_to_inv(item: Utils.Item):
	for i in inventory:
		if (i["id"] == item["id"]):
			i["quantity"] += item["quantity"]
			return
	inventory.append(item)
