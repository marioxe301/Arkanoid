#ifndef STRUCTS_H
#define STRUCTS_H

#include <system.h>

struct
{
    uint8_t x;
    uint8_t y;

}typedef Plataforma ;

struct
{
    uint8_t x;
    uint8_t y;
    bool impacto;

}typedef Bloques;

struct
{
    uint8_t x;
    uint8_t y;
    bool izquierda;
    bool derecha;
    bool arriba;
    bool abajo;
    bool movimiento;

}typedef Pelota;

struct{
    Pelota pelota;
    Plataforma plataforma;
    Bloques bloques[4][21];
    uint8_t vidas;
}typedef Juego;

#endif // STRUCTS_H