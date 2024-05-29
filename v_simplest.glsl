#version 330

uniform mat4 M;

in vec4 vertex;
in vec4 color;

out vec4 gColor;
out vec4 gVertex; // Wspó³rzêdne wierzcho³ka w przestrzeni modelu

void main(void) {
    gColor = color;
    gVertex = M * vertex; // Przekazanie wspó³rzêdnych wierzcho³ka w przestrzeni modelu
}
