shader_type canvas_item;

uniform vec4 base_color: hint_color = vec4(1.0);
uniform vec4 flash_color: hint_color = vec4(1.0);
uniform float flash_modifier: hint_range(0.0,1.0) = 1;
uniform float flash_speed: hint_range(1.0, 5.0) = 1;

void fragment(){
	vec4 color = texture(TEXTURE, UV);
	color.rgb = mix(base_color.rgb,flash_color.rgb, flash_modifier * abs(sin(TIME * flash_speed)));
	COLOR = color;
}