extends GPUParticles3D

@onready var omni_light_3d = $OmniLight3D

func lightning_on():
	self.emitting = true
	omni_light_3d.visible = true
	
func lightning_off():
	self.emitting = false
	self.process_material
	omni_light_3d.visible = false
