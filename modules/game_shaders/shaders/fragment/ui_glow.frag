uniform float u_Time;
uniform vec2 u_Resolution;
uniform sampler2D u_Tex0;

void main(void)
{
    vec2 uv = gl_TexCoord[0].xy;
    vec4 color = texture2D(u_Tex0, uv);
    
    // Add subtle glow effect to UI elements
    float glow = 0.0;
    if (color.a > 0.1) {
        glow = 0.2 + 0.1 * sin(u_Time * 2.0);
    }
    
    // Apply glow only to non-transparent pixels
    color.rgb += glow * color.a;
    
    gl_FragColor = color * gl_Color;
}