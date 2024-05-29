#version 330

uniform mat4 M;

in vec4 vertex;
in vec4 color;

out vec4 gColor;
out vec4 gVertex; // Wsp�rz�dne wierzcho�ka w przestrzeni modelu

void main(void) {
    gColor = color;
    gVertex = M * vertex; // Przekazanie wsp�rz�dnych wierzcho�ka w przestrzeni modelu
}
