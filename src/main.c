#include "functions.h"

int main() {
    Juego juego;
    Inicializar(&juego);

   /* clear_screen();
    set_color(WHITE, BLACK);
    set_cursor(29, 15);
    puts("Hello!");
    
    uint8_t f, b;
    get_color(&f, &b);
    
    set_color(RED, BLACK);
    puts("\x1\x2");
    set_color(f, b);
    
    keypad_init();
    while (1) {
        uint8_t k = keypad_getkey();
        set_cursor(2, 1);
        put_char(TO_STR(k & 0xf));
        set_cursor(3, 1);
        put_char(TO_STR((k & 0xf0) >> 4));
        if (k != 0) {
            set_cursor(10, 15);
            puts("Key press");
        }
    }*/

    DibujarLimites();
    DibujarElementos(&juego);
    DibujarVidas(3);

    keypad_init();
    while (true)
    {
        uint8_t keyboard = keypad_getkey();
        MovimientoPlataforma(&juego.plataforma,&juego.pelota,keyboard);
        MovimientoPelota(&juego.pelota);
        delay_ms(70);
    }
    

    return 0;
}
