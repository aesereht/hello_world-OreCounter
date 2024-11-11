extends Node

const MOD_NAME:String = "hello_world-OreCounter"

func _init(_modLoader:Node = ModLoader) -> void :
	ModLoaderLog.info("Init Timer.", MOD_NAME)
	ModLoaderMod.add_translation("res://mods-unpacked/hello_world-OreCounter/translations/orecounter.en.translation")
	ModLoaderMod.add_translation("res://mods-unpacked/hello_world-OreCounter/translations/orecounter.pl.translation")

func _ready() -> void :
	ModLoaderLog.info("Done", MOD_NAME)
	add_to_group("mod_init")

func modInit() -> void : 
	var pathToModYaml : String = "res://mods-unpacked/hello_world-OreCounter/yaml/orecounter.yaml"
	ModLoaderLog.info("Trying to parse YAML: %s" % pathToModYaml, MOD_NAME)
	Data.parseUpgradesYaml(pathToModYaml)
