float mag(in vec2 coord)
{
    return pow(coord[0]*coord[0] + coord[1]*coord[1], 0.5);
}



void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = 2.0*fragCoord/iResolution.xy-1.0;

    uv[1] *= 0.5;
    uv[0] *= 1.0 + 0.2*cos(iTime);
    //uv[1] *= 1.0 + 0.2*sin(iTime);
    // Time varying pixel color
    vec3 col1 = 0.5 + 0.5*cos(atan(uv[1],uv[0])*1.0+iTime*3.0+vec3(0,2,4));
    
    vec3 col = (sin(mag(uv)*2.0*6.28 + iTime) + 0.2) * col1;
    // Output to screen
    fragColor = vec4(col,1.0);
}
