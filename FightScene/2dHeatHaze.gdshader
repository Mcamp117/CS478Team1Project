//inspired by bit brains video https://www.youtube.com/watch?v=J-lu8HeO5bo&t=197s

shader_type canvas_item;
render_mode unshaded;
uniform float force = 0.26;
uniform float scale = 0.01;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
void fragment(){
	float mask = texture(TEXTURE, UV).a;
	vec2 disp = normalize(UV)*force*mask*scale;
	COLOR = texture(SCREEN_TEXTURE,SCREEN_UV - disp);
}