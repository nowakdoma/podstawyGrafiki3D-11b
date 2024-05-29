#version 330

layout(triangles) in;
layout(line_strip, max_vertices = 6) out;

in vec4 gColor[];
out vec4 iColor;

void main() {
    // Pêtla iteruj¹ca po trójk¹cie wejœciowym
    for (int i = 0; i < 3; ++i) {
        // Przekazywanie pozycji i koloru punktu A
        gl_Position = gl_in[i].gl_Position;
        iColor = gColor[i];
        EmitVertex();

        // Przekazywanie pozycji i koloru punktu D (œrednia z A, B i C)
        int nextIndex1 = (i + 1) % 3;
        int nextIndex2 = (i + 2) % 3;
        gl_Position = (gl_in[i].gl_Position + gl_in[nextIndex1].gl_Position + gl_in[nextIndex2].gl_Position) / 3.0;
        iColor = (gColor[i] + gColor[nextIndex1] + gColor[nextIndex2]) / 3.0;
        EmitVertex();

        // Nastêpny wierzcho³ek tworz¹cy odcinek (punkt B lub C)
        int nextIndex3 = (i + 2) % 3;
        gl_Position = gl_in[nextIndex3].gl_Position;
        iColor = gColor[nextIndex3];
        EmitVertex();

        // Koniec odcinka
        EndPrimitive();
    }
}
