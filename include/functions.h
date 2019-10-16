#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#define IZQUIERDA 1
#define DERECHA 2
#define SPACE 8
#define PAREDES_LATERALES 219
#define PARED_ARRIBA 223
#define PARED_ABAJO 220

#define CUERPO_CENTRO 231
#define CUERPO_IZQUIERDA 230
#define CUERPO_DERECHA 232

#define PLATAFORMA_IZQUIERDA 224 
#define PLATAFORMA_CENTRO 223
#define PLATAFORMA_DERECHA 225


#define PELOTA 226
#define CORAZON 3
#define BORRADOR 32

#define LIMITE_LATERAL_IZQUIERDO 5
#define LIMITE_LATERAL_DERECHO 75

#define LIMITE_ARRIBA 5
#define LIMITE_ABAJO 25


#define LATERAL_IZQUIERDO 1
#define LATERAL_DERECHO 2
#define SUPERIOR 3
#define INFERIOR 4
#define NO_COLISION 5

#define TO_STR(ch) ( ( ((ch) >= 0 ) && ((ch) <= 9) )? (48 + (ch)) : ('a' + ((ch) - 10)) )


#include "structs.h"
#include <keypad.h>
#include <screen.h>

void Inicializar(Juego *juego);
void DibujarLimites();
void DibujarElementos(Juego * juego);
void DibujarVidas(uint8_t vidas);
void Loop(Juego *juego);
void MovimientoPlataforma(Plataforma * plataforma,Pelota * pelota,uint8_t tecla);
bool ColisionPlataforma(Plataforma * plataforma,Pelota * pelota);
bool LimiteLaterales(uint8_t x);
uint8_t LimitesMapa(uint8_t x, uint8_t y);
void DibujarPlataforma(Plataforma * plataforma);
void DibujarBloques(Bloques bloques [4][21]);
void DibujarPelota(Pelota * pelota);
void BorrarPlataforma(Plataforma * plataforma);
void BorrarPelota(Pelota * pelota);
void MovimientoPelota(Pelota *pelota);



#endif // FUNCTIONS_H