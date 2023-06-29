shader_type spatial;

render_mode skip_vertex_transform;

void vertex() {
    VERTEX = (MODELVIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
    NORMAL = normalize((MODELVIEW_MATRIX * vec4(NORMAL, 0.0)).xyz);
    // same as above for binormal and tangent, if normal mapping is used
}
void fragment() {
	ALBEDO = vec3(1.0, 0.0, 0.0); // use red for material albedo
}
