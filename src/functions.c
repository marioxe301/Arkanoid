#include "functions.h"

//funcion para dibujar solo la parte de arriba
void DibujarLimiteSuperior(){
    uint8_t fg,bg;
    get_color(&fg,&bg);

    set_color(WHITE,BLACK);
    //limite superior
    for(unsigned i=5;i<=75;i++){
        set_cursor(4,i);
        put_char(PARED_ARRIBA);
    }

    set_color(fg,bg);
}

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
    juego->vidas = 6;

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

    set_color(MAGENTA,BLACK);
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

void DibujarVidas(Juego * juego){
    uint8_t fg,bg;
    get_color(&fg,&bg);

    set_color(WHITE,BLACK);
    set_cursor(28,35);
    puts("VIDAS: ");
    set_color(fg,bg);
    get_color(&fg,&bg);

    set_color(BLACK,BLACK);
    for(unsigned i=0;i<6;i++){
        put_char(BORRADOR);
        puts(" ");
    }
    set_color(fg,bg);

    set_cursor(28,42);
    for(unsigned i=0;i<juego->vidas;i++){
        set_color(RED,BLACK);
        put_char(CORAZON);
        puts(" ");

    }

    set_color(fg,bg);
}

void MovimientoPlataforma(Juego * juego,uint8_t tecla){
    uint8_t tempx;
    if(tecla==IZQUIERDA){
        tempx = juego->plataforma.x-1;
        if(!LimiteLaterales(tempx) && !juego->pelota.movimiento){
            BorrarPlataforma(juego);
            BorrarPelota(juego);
            juego->plataforma.x--;
            juego->pelota.x--;
            DibujarPelota(juego);
            DibujarPlataforma(juego);
        }else if(!LimiteLaterales(tempx)){
            BorrarPlataforma(juego);
            juego->plataforma.x--;
            DibujarPelota(juego);
            DibujarPlataforma(juego);
        }
        
    }
    
    if(tecla==DERECHA){
        tempx = juego->plataforma.x+1;
        if(!LimiteLaterales(tempx) && !juego->pelota.movimiento){
            BorrarPlataforma(juego);
            BorrarPelota(juego);
            juego->plataforma.x++;
            juego->pelota.x++;
            DibujarPelota(juego);
            DibujarPlataforma(juego);
        }else if(!LimiteLaterales(tempx)){
            BorrarPlataforma(juego);
            juego->plataforma.x++;
            DibujarPelota(juego);
            DibujarPlataforma(juego);
        }
    }

    if(tecla==SPACE){
        juego->pelota.movimiento=true;
        juego->pelota.izquierda=true;
        juego->pelota.arriba=true;
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

void DibujarPlataforma(Juego * juego){
    uint8_t fg,bg;
    get_color(&fg,&bg);
    set_color(MAGENTA,BLACK);

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
}

void BorrarPlataforma(Juego * juego){
        uint8_t fg,bg;
        get_color(&fg,&bg);
        set_color(BLACK,BLACK);
        //borra la platforma
        set_cursor(juego->plataforma.y,juego->plataforma.x-2);
        put_char(BORRADOR);
        set_cursor(juego->plataforma.y,juego->plataforma.x-1);
        put_char(BORRADOR);
        set_cursor(juego->plataforma.y,juego->plataforma.x);
        put_char(BORRADOR);
        set_cursor(juego->plataforma.y,juego->plataforma.x+1);
        put_char(BORRADOR);
        set_cursor(juego->plataforma.y,juego->plataforma.x+2);
        put_char(BORRADOR);

        //restaura el color
        set_color(fg,bg);
}

bool ColisionPlataforma(Juego * juego){
    if((juego->pelota.x==juego->plataforma.x 
    || juego->pelota.x==juego->plataforma.x+1
    || juego->pelota.x==juego->plataforma.x+2
    || juego->pelota.x==juego->plataforma.x-1
    || juego->pelota.x==juego->plataforma.x-2) 
    && juego->pelota.y == juego->plataforma.y-1){
        return true;
    }
    return false;
}

void DibujarPelota(Juego * juego){
        uint8_t fg,bg;
        get_color(&fg,&bg);
        set_color(WHITE,BLACK);

        set_cursor(juego->pelota.y,juego->pelota.x);
        put_char(PELOTA);

        set_color(fg,bg);
}

void BorrarPelota(Juego * juego){
        uint8_t fg,bg;
        get_color(&fg,&bg);
        set_color(BLACK,BLACK);

        set_cursor(juego->pelota.y,juego->pelota.x);
        put_char(BORRADOR);

        set_color(fg,bg);
}

void MovimientoPelota(Juego * juego){
        uint8_t colision ;

       if(juego->pelota.izquierda && juego->pelota.arriba){
               BorrarPelota(juego);
               juego->pelota.x--;
               juego->pelota.y--;
               DibujarPelota(juego);
               colision = LimitesMapa(juego->pelota.x,juego->pelota.y);
               DecidirTrayectoria(juego,colision);
                
           
       }else if(juego->pelota.derecha && juego->pelota.arriba){
               
               BorrarPelota(juego);
               juego->pelota.x++;
               juego->pelota.y--;
               DibujarPelota(juego);
               colision = LimitesMapa(juego->pelota.x,juego->pelota.y);
               DecidirTrayectoria(juego,colision);
            
           
       }else if(juego->pelota.izquierda && juego->pelota.abajo){       
               BorrarPelota(juego);
               juego->pelota.x--;
               juego->pelota.y++;
               DibujarPelota(juego);
               colision = LimitesMapa(juego->pelota.x,juego->pelota.y);
               DecidirTrayectoria(juego,colision);
               DibujarLimiteSuperior();
    
       }else if(juego->pelota.derecha && juego->pelota.abajo){
               BorrarPelota(juego);
               juego->pelota.x++;
               juego->pelota.y++;
               DibujarPelota(juego);
               colision = LimitesMapa(juego->pelota.x,juego->pelota.y);
               DecidirTrayectoria(juego,colision);
               DibujarLimiteSuperior();
       }

}
void ReiniciarTrayectoria(Juego * juego){
    juego->pelota.abajo=false;
    juego->pelota.arriba = false;
    juego->pelota.derecha = false;
    juego->pelota.izquierda = false;
}

void DecidirTrayectoria(Juego * juego,uint8_t colision){
    switch (colision)
    {
    case LATERAL_IZQUIERDO:
            if(juego->pelota.arriba){
                    ReiniciarTrayectoria(juego);
                    juego->pelota.arriba = true;
                    juego->pelota.derecha = true;
            }else{
                    ReiniciarTrayectoria(juego);
                    juego->pelota.abajo = true;
                    juego->pelota.derecha = true;
            }
        break;
    case LATERAL_DERECHO:
            if(juego->pelota.arriba){
                    ReiniciarTrayectoria(juego);
                    juego->pelota.arriba = true;
                    juego->pelota.izquierda = true;
            }else{
                    ReiniciarTrayectoria(juego);
                    juego->pelota.abajo = true;
                    juego->pelota.izquierda = true;
            }
        break;
    case SUPERIOR:
            if(juego->pelota.izquierda){
                    ReiniciarTrayectoria(juego);
                    juego->pelota.abajo = true;
                    juego->pelota.izquierda = true;
                    
            }else{
                    ReiniciarTrayectoria(juego);
                    juego->pelota.abajo = true;
                    juego->pelota.derecha = true;
                   
            }
        break;    
    case INFERIOR:
               QuitarVidas(juego);
               BorrarPelota(juego);
               ReiniciarPelota(juego);
               DibujarPelota(juego);
               DibujarVidas(juego);
        break;
    case ESQUINA:
             if(juego->pelota.izquierda){
                 ReiniciarTrayectoria(juego);
                 juego->pelota.abajo = true;
                 juego->pelota.derecha = true;
             }else{
                 juego->pelota.abajo = true;
                 juego->pelota.izquierda = true;
             }
        break;
    default:
        if(ColisionPlataforma(juego)){
            if(juego->pelota.izquierda){
                ReiniciarTrayectoria(juego);
                juego->pelota.arriba = true;
                juego->pelota.izquierda = true;
            }else{
                ReiniciarTrayectoria(juego);
                juego->pelota.arriba = true;
                juego->pelota.derecha = true;
            }
        }
        break;
    }
}

uint8_t LimitesMapa(uint8_t x, uint8_t y){
    if((x==LIMITE_LATERAL_IZQUIERDO && y <= LIMITE_ARRIBA) || (x==LIMITE_LATERAL_DERECHO && y<=LIMITE_ARRIBA)){
        return ESQUINA;
   }else if(x==LIMITE_LATERAL_DERECHO){
        return LATERAL_DERECHO;
    }else if(y+1== LIMITE_ARRIBA){
       
        return SUPERIOR;
    }else if(y== LIMITE_ABAJO){
        return INFERIOR;
    }else  if(x==LIMITE_LATERAL_IZQUIERDO){
        return LATERAL_IZQUIERDO;
    }else{
        return NO_COLISION;
    }
}

void ReiniciarPelota(Juego * juego){
        juego->pelota.y = juego->plataforma.y-1;
        juego->pelota.x = juego->plataforma.x;
        juego->pelota.movimiento =false;
        juego->pelota.izquierda =false;
        juego->pelota.derecha =false;
        juego->pelota.arriba = false;
        juego->pelota.abajo = false;
}

void QuitarVidas(Juego * juego){
    juego->vidas--;
}
bool VerificarGanar(Juego * juego){
    uint8_t check = 0;
    if(juego->vidas<=0){
        set_cursor(13,34);
        puts("GAME OVER");
        return false;
    }else{
        if(DestruyoBloques(juego)){
            //no hay problema sigue
            return true;
        }else{
            //no hay ningun bloque
            return false;

        }
    }
}

void ColisionBloques(Juego * juego){
    for(unsigned i=0;i<4;i++){
        for(unsigned j=0;j<21;j++){
            //si pega abajo
            if((juego->pelota.x == juego->bloques[i][j].x
            || juego->pelota.x== juego->bloques[i][j].x
            || juego->pelota.x== juego->bloques[i][j].x-1) 
            && (juego->pelota.y == juego->bloques[i][j].y-1
            && !juego->bloques[i][j].impacto)){
                    //si pega abajo su trayectoria se invierte de arriba o abajo
                    TrayectoriaBloques(juego,i,j,INVERSION_Y);

            }//si pega arriba
            else if((juego->pelota.x == juego->bloques[i][j].x
            || juego->pelota.x== juego->bloques[i][j].x
            || juego->pelota.x== juego->bloques[i][j].x-1) 
            && (juego->pelota.y == juego->bloques[i][j].y+1
            && !juego->bloques[i][j].impacto)){
                    //si pega arriba su trayectoria se invierte de arriba o abajo
                    TrayectoriaBloques(juego,i,j,INVERSION_Y);
            }// si pega a los lados
            else if((juego->pelota.x== juego->bloques[i][j].x+1
            || juego->pelota.x== juego->bloques[i][j].x-1) 
            && (juego->pelota.y == juego->bloques[i][j].y
            && !juego->bloques[i][j].impacto)){
                    // si pega en un lado su trayectoria se invierte en los lados
                    TrayectoriaBloques(juego,i,j,INVERSION_X);
            }
        }
    }
}
void TrayectoriaBloques(Juego * juego,uint8_t x,uint8_t y, uint8_t trayectoria){
    juego->bloques[x][y].impacto = true;
    switch (trayectoria)
    {
    case INVERSION_Y:
            if(juego->pelota.arriba){
                juego->pelota.arriba = false;
                juego->pelota.abajo = true;
            }else{
                juego->pelota.arriba = true;
                juego->pelota.abajo = false;
            }
        break;
    case INVERSION_X:
            if(juego->pelota.izquierda){
                juego->pelota.izquierda = false;
                juego->pelota.derecha = true;
            }else{
                juego->pelota.izquierda = true;
                juego->pelota.derecha = false;
            }
        break;
    default:
            // no pasa nada
        break;
    }
}

void RedibujarBloques(Juego * juego){
    uint8_t fg,bg,fgp,bgp;
    get_color(&fg,&bg);
    set_color(RED,WHITE);

    for(unsigned i = 0; i<4;i++){
        for(unsigned j=0;j<21;j++){

            if(!juego->bloques[i][j].impacto){

            set_cursor(juego->bloques[i][j].y,juego->bloques[i][j].x-1);
            put_char(CUERPO_IZQUIERDA);
            set_cursor(juego->bloques[i][j].y,juego->bloques[i][j].x);
            put_char(CUERPO_CENTRO);
            set_cursor(juego->bloques[i][j].y,juego->bloques[i][j].x+1);
            put_char(CUERPO_DERECHA);

            }else{

            get_color(&fgp,&bgp);
            set_color(BLACK,BLACK);

            set_cursor(juego->bloques[i][j].y,juego->bloques[i][j].x-1);
            put_char(BORRADOR);
            set_cursor(juego->bloques[i][j].y,juego->bloques[i][j].x);
            put_char(BORRADOR);
            set_cursor(juego->bloques[i][j].y,juego->bloques[i][j].x+1);
            put_char(BORRADOR);

            set_color(fgp,bgp);
            }
        }
    }

    set_color(fg,bg);
}

bool DestruyoBloques(Juego * juego){
    uint8_t check = 0;
    for(unsigned i = 0; i<4;i++){
        for(unsigned j = 0; j<21;j++){
            if(juego->bloques[i][j].impacto){
                check++;
            }
        }
    }

        //verifica si hay 84 impactos
    if(check == TOTAL_BLOQUES){
        set_cursor(13,34);
        puts("GANASTE <3");
        return false;
    }else{
        return true;
    }
}