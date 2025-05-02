#include <stddef.h>
#include <stdint.h>

// Prototipo para escribir en la pantalla
void print(const char *str) {
    uint16_t *VideoMemory = (uint16_t *)0xB8000;
    for (size_t i = 0; str[i] != '\0'; i++) {
        VideoMemory[i] = (VideoMemory[i] & 0xFF00) | str[i];
    }
}

// Función principal del kernel
void kernel_main(void) {
    print("Sistema operativo minimalista cargado.\n");
    print("Cargando Python...\n");

    // Aquí se debería cargar un intérprete de Python
    // Para un sistema real, necesitarías integrar un intérprete embebido como MicroPython.
    while (1) {}
}
