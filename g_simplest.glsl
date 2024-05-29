#version 330

layout(triangles) in;
layout(line_strip, max_vertices = 6) out;

in vec4 gColor[];
out vec4 iColor;

void main() {
    // P�tla iteruj�ca po tr�jk�cie wej�ciowym
    for (int i = 0; i < 3; ++i) {
        // Przekazywanie pozycji i koloru punktu
        gl_Position = gl_in[i].gl_Position;
        iColor = gColor[i];
        EmitVertex();

        // Nast�pny wierzcho�ek tworz�cy odcinek
        int nextIndex = (i + 1) % 3;
        gl_Position = gl_in[nextIndex].gl_Position;
        iColor = gColor[nextIndex];
        EmitVertex();

        // Koniec odcinka
        EndPrimitive();
    }
}
