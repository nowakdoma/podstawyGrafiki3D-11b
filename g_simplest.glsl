#version 330

layout(triangles) in;
layout(line_strip, max_vertices = 6) out;

in vec4 gColor[];
out vec4 iColor;

void main() {
    // Pêtla iteruj¹ca po trójk¹cie wejœciowym
    for (int i = 0; i < 3; ++i) {
        // Przekazywanie pozycji i koloru punktu
        gl_Position = gl_in[i].gl_Position;
        iColor = gColor[i];
        EmitVertex();

        // Nastêpny wierzcho³ek tworz¹cy odcinek
        int nextIndex = (i + 1) % 3;
        gl_Position = gl_in[nextIndex].gl_Position;
        iColor = gColor[nextIndex];
        EmitVertex();

        // Koniec odcinka
        EndPrimitive();
    }
}
