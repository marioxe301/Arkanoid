#include "functions.h"


void DibujarLimites(){
    clear_screen();
    set_color(WHITE,BLACK);

    set_cursor(2,35);
    puts("ARKANOID");


    //limite lateral izquierdo
    for(unsigned i=4;i<=26;i++){
        set_cursor(i,4);
        put_char(PAREDES_LATERALES);
        set_cursor(i,76);
        put_char(PAREDES_LATERALES);
    }

    //limite superior
    for(unsigned i=5;i<=75;i++){
        set_cursor(4,i);
        put_char(PARED_ARRIBA);
    }

    //limite inferior
    for(unsigned i=5;i<=75;i++){
        set_cursor(26,i);
        put_char(PARED_ABAJO);
    }

    //x (5 - 75) 
    //y (4 - 26)

}

void Inicializar(Juego *juego){
    //primero ubicamos la plataforma
    juego->plataforma.x = 37; //a la mitad
    juego->plataforma.y = 25; //abajo  

    //inicializar vidas
    juego->vidas = 3;

    //inicializar la pelota
    juego->pelota.x = 37;
    juego->pelota.y = 24;
    juego->pelota.movimiento = false;
    juego->pelota.abajo = false;
    juego->pelota.arriba = false;
    juego->pelota.derecha = false;
    juego->pelota.izquierda = false;

    //inicializar posiciones de los bloques

    uint8_t positionX = 10;
    uint8_t positionY = 7;
    for(unsigned i=0;i<4;i++){

        for(unsigned j=0;j<21;j++){
            juego->bloques[i][j].impacto= false;
            juego->bloques[i][j].x = positionX;
            juego->bloques[i][j].y = positionY;

            positionX+=3;
        }
        positionX=10;
        positionY++;
    }
}

void DibujarElementos(Juego * juego){
    // dibuja primero la plataforma
    uint8_t fg,bg;
    get_color(&fg,&bg);

    set_color(YELLOW,BLACK);
    set_cursor(juego->plataforma.y,juego->plataforma.x-2);
    put_char(PLATAFORMA_IZQUIERDA);
    set_cursor(juego->plataforma.y,juego->plataforma.x-1);
    put_char(PLATAFORMA_CENTRO);
    set_cursor(juego->plataforma.y,juego->plataforma.x);
    put_char(PLATAFORMA_CENTRO);
    set_cursor(juego->plataforma.y,juego->plataforma.x+1);
    put_char(PLATAFORMA_CENTRO);
    set_cursor(juego->plataforma.y,juego->plataforma.x+2);
    put_char(PLATAFORMA_DERECHA);

    set_color(fg,bg);

    get_color(&fg,&bg);

    //dibuja la pelota
    set_color(WHITE,BLACK);
    set_cursor(juego->pelota.y,juego->pelota.x);
    put_char(PELOTA);

    set_color(fg,bg);

    //dibuja los bloques

    get_color(&fg,&bg);
    set_color(RED,WHITE);

    for(unsigned i = 0; i<4;i++){
        for(unsigned j=0;j<21;j++){
            set_cursor(juego->bloques[i][j].y,juego->bloques[i][j].x-1);
            put_char(CUERPO_IZQUIERDA);
            set_cursor(juego->bloques[i][j].y,juego->bloques[i][j].x);
            put_char(CUERPO_CENTRO);
            set_cursor(juego->bloques[i][j].y,juego->bloques[i][j].x+1);
            put_char(CUERPO_DERECHA);
        }
    }

    set_color(fg,bg);
}

void DibujarVidas(uint8_t vidas){
    uint8_t fg,bg;
    get_color(&fg,&bg);

    //x 28 y 35

    set_color(WHITE,BLACK);
    set_cursor(28,35);
    puts("VIDAS: ");
    for(unsigned i=0;i<vidas;i++){
        set_color(RED,BLACK);
        put_char(CORAZON);
        puts(" ");

    }

    set_color(fg,bg);
}

void MovimientoPlataforma(Plataforma * plataforma,Pelota * pelota,uint8_t tecla){
    uint8_t tempx;
    if(tecla==IZQUIERDA){
        tempx = plataforma->x-1;
        if(!LimiteLaterales(tempx)){
            BorrarPlataforma(plataforma);
            plataforma->x--;
            
            plataforma->x--;
            DibujarPlataforma(plataforma);
        }
        
    }
    
    if(tecla==DERECHA){
        tempx = plataforma->x+1;
        if(!LimiteLaterales(tempx)){
            BorrarPlataforma(plataforma);
            plataforma->x++;
            DibujarPlataforma(plataforma);
        }
    }

    if(tecla==SPACE){

    }
}

bool LimiteLaterales(uint8_t x){
    if(x+2 == LIMITE_LATERAL_DERECHO){
        return true;
    }else if(x-2 == LIMITE_LATERAL_IZQUIERDO){
        return true;
    }else{
        return false;
    }
}

void DibujarPlataforma(Plataforma * plataforma){
    uint8_t fg,bg;
    get_color(&fg,&bg);
    set_color(YELLOW,BLACK);

    set_cursor(plataforma->y,plataforma->x-2);
    put_char(PLATAFORMA_IZQUIERDA);
    set_cursor(plataforma->y,plataforma->x-1);
    put_char(PLATAFORMA_CENTRO);
    set_cursor(plataforma->y,plataforma->x);
    put_char(PLATAFORMA_CENTRO);
    set_cursor(plataforma->y,plataforma->x+1);
    put_char(PLATAFORMA_CENTRO);
    set_cursor(plataforma->y,plataforma->x+2);
    put_char(PLATAFORMA_DERECHA);

    set_color(fg,bg);
}

void BorrarPlataforma(Plataforma * plataforma){
        uint8_t fg,bg;
        get_color(&fg,&bg);
        set_color(BLACK,BLACK);
        //borra la platforma
        set_cursor(plataforma->y,plataforma->x-2);
        put_char(BORRADOR);
        set_cursor(plataforma->y,plataforma->x-1);
        put_char(BORRADOR);
        set_cursor(plataforma->y,plataforma->x);
        put_char(BORRADOR);
        set_cursor(plataforma->y,plataforma->x+1);
        put_char(BORRADOR);
        set_cursor(plataforma->y,plataforma->x+2);
        put_char(BORRADOR);

        //restaura el color
        set_color(fg,bg);
}

bool ColisionPlataforma(Plataforma * plataforma,Pelota * pelota){
    if(((plataforma->x || plataforma->x+1 ||plataforma->x+2 || plataforma->x-1|| plataforma-> x-2)== pelota->x)&& pelota->y== plataforma->y-1){
        return true;
    }else{
        return false;
    }
}

void DibujarPelota(Pelota * pelota){
        uint8_t fg,bg;
        get_color(&fg,&bg);
        set_color(WHITE,BLACK);

        set_cursor(pelota->y,pelota->x);
        put_char(PELOTA);

        set_color(fg,bg);
}

void BorrarPelota(Pelota * pelota){
        uint8_t fg,bg;
        get_color(&fg,&bg);
        set_color(BLACK,BLACK);

        set_cursor(pelota->y,pelota->x);
        put_char(BORRADOR);

        set_color(fg,bg);
}

void MovimientoPelota(Pelota *pelota){
        uint8_t fg,bg;
        get_color(&fg,&bg);
        set_color(WHITE,BLACK);


        set_color(fg,bg);
}

bool LimitesMapa(uint8_t x, uint8_t y){
    if((x-1==LIMITE_LATERAL_IZQUIERDO || x+1==LIMITE_LATERAL_DERECHO || y-1 == LIMITE_ARRIBA || y+1 == LIMITE_ABAJO)){
        return true;
    }else{
        return false;
    }
}