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
        MovimientoPelota(&juego);
        ColisionBloques(&juego);
        RedibujarBloques(&juego);

        delay_ms(100);
    }
    
    RedibujarBloques(&juego);

    return 0;
}
