#include "functions.h"

int main() {
    Juego juego;
    Inicializar(&juego);
    
    DibujarLimites();
    DibujarElementos(&juego);
    DibujarVidas(&juego);

    keypad_init();
    while (VerificarGanar(&juego))
    {
        uint8_t keyboard = keypad_getkey();
        MovimientoPlataforma(&juego,keyboard);
        RedibujarBloques(&juego);
        MovimientoPelota(&juego);
        ColisionBloques(&juego);

        delay_ms(50);
    }
    
    RedibujarBloques(&juego);

    return 0;
}
