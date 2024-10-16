extends Node

const turrets := {
	"GreenTower": {
		"stats": {
			"damage": 10,
			"attack_speed": 2.0,
			"attack_range": 200.0,
			"bulletSpeed": 200.0,
			"bulletPierce": 1,
		},
		"upgrades": {
			"damage": {"amount": 2.5, "multiplies": false},
			"attack_speed": {"amount": 1.5, "multiplies": true},
		},
		"name": "Green Tower",
		"cost": 50,
		"upgrade_cost": 50,
		"max_level": 2,
		"scene": "res://Scenes/turrets/turretBase/turretBase.tscn",
		"sprite": "res://Assets/turrets/turret4.png",
		"scale": 0.6,
		"rotates": true,
		"bullet": "fire",
	},
	"FlameTower": {
		"stats": {
			"damage": 0.5,
			"attack_speed": 20.0,
			"attack_range": 250.0,
			"bulletSpeed": 400.0,
			"bulletPierce": 4,
		},
		"upgrades": {
			"damage": {"amount": 2.5, "multiplies": false},
			"attack_speed": {"amount": 1.5, "multiplies": true},
		},
		"name": "FlameTower",
		"cost": 70,
		"upgrade_cost": 50,
		"max_level": 3,
		"scene": "res://Scenes/turrets/projectileTurret/projectileTurret.tscn",
		"sprite": "res://Assets/turrets/turret3.png",
		"scale": 2,
		"rotates": false,
		"bullet": "laser",
	},
	"IceTower": {
		"stats": {
			"damage": 0.5,
			"attack_speed": 0.5,
			"attack_range": 300.0,
			"ray_duration": 1.0,
			"ray_length": 300.0,
		},
		"upgrades": {
			"damage": {"amount": 1.0, "multiplies": false},
			"attack_speed": {"amount": 1.5, "multiplies": true},
			"ray_length": {"amount": 1.5, "multiplies": true},
			"ray_duration": {"amount": 1.5, "multiplies": true},
		},
		"name": "IceTower",
		"cost": 30,
		"upgrade_cost": 50,
		"max_level": 3,
		"scene": "res://Scenes/turrets/rayTurret/rayTurret.tscn",
		"sprite": "res://Assets/turrets/turret1.png",
		"scale": 3,
		"rotates": true,
	},
	"RockTower": {
		"stats": {
			"damage": 5.0,
			"attack_speed": 1.0,
			"attack_range": 100.0,
		},
		"upgrades": {
			"damage": {"amount": 2.5, "multiplies": false},
			"attack_speed": {"amount": 1.5, "multiplies": true},
		},
		"name": "RockTower",
		"cost": 70,
		"upgrade_cost": 50,
		"max_level": 3,
		"scene": "res://Scenes/turrets/meleeTurret/meleeTurret.tscn",
		"sprite": "res://Assets/turrets/turret2.png",
		"scale": 2,
		"rotates": false,
	},
}

const stats := {
	"damage": {"name": "Damage"},
	"attack_speed": {"name": "Speed"},
	"attack_range": {"name": "Range"},
	"bulletSpeed": {"name": "Bullet Speed"},
	"bulletPierce": {"name": "Bullet Pierce"},
	"ray_length": {"name": "Ray Length"},
	"ray_duration": {"name": "Ray Duration"},
}

const bullets := {
	"fire": {
		"frames": "res://Assets/bullets/bullet1.tres",
	},
	"laser": {
		"frames": "res://Assets/bullets/bullet2.tres",
	}
}

const enemies := {
	"yellowDino1": {
		"stats": {
			"hp": 10.0,
			"speed": .3,
			"baseDamage": 5.0,
			"goldYield": 10.0,
			},
		"difficulty": 1.0,
		"sprite": "res://Assets/enemies/dino1.png",
	},
	"blueDino": {
		"stats": {
			"hp": 5.0,
			"speed": 1,
			"baseDamage": 5.0,
			"goldYield": 10.0,
			},
		"difficulty": 2.0,
		"sprite": "res://Assets/enemies/dino2.png",
	},
	"yellowDino": {
		"stats": {
			"hp": 10.0,
			"speed": .5,
			"baseDamage": 1.0,
			"goldYield": 10.0,
			},
		"difficulty": 3.0,
		"sprite": "res://Assets/enemies/dino3.png",
	},
	"greenDino": {
		"stats": {
			"hp": 10.0,
			"speed": 2,
			"baseDamage": 1.0,
			"goldYield": 10.0,
			},
		"difficulty": 4.0,
		"sprite": "res://Assets/enemies/dino4.png",
	}
}

const maps := {
	"map1": {
		"name": "Arena Map",
		"bg": "res://Assets/maps/map1.png",
		"scene": "res://Scenes/maps/map1.tscn",
		"baseHp": 10,
		"startingGold": 100,
		"spawner_settings":
			{
			"difficulty": {"initial": 2.0, "increase": 1.5, "multiplies": true},
			"max_waves": 10,
			"wave_spawn_count": 10,
			"special_waves": {},
			},
	},
	
	"map3": {
		"name": "Grass Valley Map",
		"bg": "res://Assets/maps/map3.png",
		"scene": "res://Scenes/maps/map3.tscn",
		"baseHp": 10,
		"startingGold": 100,
		"spawner_settings":
			{
			"difficulty": {"initial": 2.0, "increase": 1.5, "multiplies": true},
			"max_waves": 10,
			"wave_spawn_count": 10,
			"special_waves": {},
			},
	},
	
	"map4": {
		"name": "Enchanted Map",
		"bg": "res://Assets/maps/map4.png",
		"scene": "res://Scenes/maps/map4.tscn",
		"baseHp": 10,
		"startingGold": 100,
		"spawner_settings":
			{
			"difficulty": {"initial": 2.0, "increase": 1.5, "multiplies": true},
			"max_waves": 10,
			"wave_spawn_count": 10,
			"special_waves": {},
			},
	},
	
	"map5": {
		"name": "Deserted Map",
		"bg": "res://Assets/maps/map5.jpg",
		"scene": "res://Scenes/maps/map5.tscn",
		"baseHp": 10,
		"startingGold": 100,
		"spawner_settings":
			{
			"difficulty": {"initial": 2.0, "increase": 1.5, "multiplies": true},
			"max_waves": 10,
			"wave_spawn_count": 10,
			"special_waves": {},
			},
	},
}
