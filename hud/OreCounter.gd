extends HudElement

@export_category("Responsivnes vs Performance")
@export_range(0.005, 0.5, 0.005) var set_cooldown:float = 0.02
var cooldown:float = 0.0

func _ready() -> void :
	Style.init(self) #Applying style
	Data.listen(self, "map.tilesdestroyed") # setting listener for destroyed tiles
	setupText() # init values to setup correct tile ammount
	set_process(false) # turning process function off

func propertyChanged(property:String, oldValue, newValue) -> void:
	match property:
		"map.tilesdestroyed":
			# May look like not a lot but will prevent from multiple acessing Arrays
			# and counting tiles when big bombs explodes, improving performace.
			# The bigger the cooldown the less responsive it will be but you will
			# save a little on preformace could be exported later as option for players
			# to tweek although I don't think it will be problem with this mod
			# as just running ok without this.
			cooldown = set_cooldown
			set_process(true)

func _process(delta:float) -> void: # Only run turn on if tiledestroyed value has changed
	if cooldown > 0.0:
		cooldown -= delta # Added cooldown to prevent acessing data multiple times
	else:
		setupText()
		set_process(false)

func setupText() -> void :
	%Counter.text = str(Level.map.tileData.get_resource_cells_by_id(0).size())
	%Counter2.text = str(Level.map.tileData.get_resource_cells_by_id(1).size())
	%Counter3.text = str(Level.map.tileData.get_resource_cells_by_id(2).size())
	%Counter4.text = str(Level.map.tileData.get_remaining_mineable_tile_count())
