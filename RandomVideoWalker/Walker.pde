class Walker {
  
 int x;
 int y;
 float t;
 float xoff;
 float yoff;
 
 Walker() {
  x = width/2;
  y = height/2;
  t = 0;
  xoff = 0;
  yoff = 10000;
 }
  
 void display() {
  stroke(255,0,0);
  point(x,y);
 }
  
 void step() {
   /* Method 1
   int choice = int(random(4)); 
   
   if (choice == 0) {
     x++;
   } else if (choice == 1) {
     x--;
   } else if (choice == 2) {
     y++;
   } else if (choice == 3) {
     y--;
   }
   */
   
   /*Method 2   -1,1 doesn't work
   float stepx = random(-1,2.1);
   float stepy = random(-1,2.1);
   x += stepx;
   y += stepy;
   constrain(x, 0, width-1);
   constrain(y, 0, height-1);
   */
   
   /*Method 3
   int[] stuff = new int[5];
   stuff[0] = -1;
   stuff[1] = -1;
   stuff[2] = 0;
   stuff[3] = 1;
   stuff[4] = 1;
   int indexX = int(random(stuff.length));
   int indexY = int(random(stuff.length));
   x += stuff[indexX];
   y += stuff[indexY];
   constrain(x,0,width);
   constrain(y,0,height);
   println(x,y); 
   */
   
   /* Methhod 4.1
   float prob = 0.51;
   float r = random(1);
   if (r < prob) {
     x++;
   } else   {
     x--;
   }
   */
   
   /* Method 4.2
   float num = random(1);
   if(num<0.4){ x++;}
   else if(num<0.6){x--;}
   else if(num<0.8){y++;}
   else{y--;}
   */
   
   /* Method 4.3 probability of going towards mouse
   float num = random(1);
   if (num<0.2){
     if(x<mouseX){x++;}else{x--;}
     if(y<mouseY){y++;}else{y--;}
   }
   else if(num<0.4){ x++;}
   else if(num<0.6){x--;}
   else if(num<0.8){y++;}
   else{y--;}
   */
   
   /* Method 5 - Lévy Flight Approximation
   float r  = random(1);
   float xstep;
   float ystep;
   if (r < 0.02) {
     xstep = random(-25,30);
     ystep = random(-25,30);
   } else {
     xstep = random(-1,2);
     ystep = random(-1,2);
   }
   
   x+=xstep;
   y+=ystep;
   constrain(x,100,width-100);
   constrain(y,100,height-100);
   println(x,y);
   */
   
   /* Method 6 - the higher a number, the more likely it is to be picked
   //Noise
   
   float montecarlo() {  
     while(true){
       float r1=random(1);
       float probability=r1;
       float r2=random(1);
       if(r2<probability) {
         return r1;
       }
     }
   }
   
   float stepsize = random(montecarlo());
   
   float stepx = random(-stepsize, stepsize);
   float stepy = random(-stepsize, stepsize);
   
   x+=stepx;
   y+=stepy;
   */
   
   /* Method 7.1 - Mapped Perlin Noise Walker
   float n=noise(t);
   x= int(map(n,0,1,0,width));
   t+=0.01;
   */
   
   /* Method 7.2 - 2D perlin noise for position walker
   x = int(map(noise(xoff),0,1,0,width));
   y = int(map(noise(yoff),0,1,0,height));
   
   xoff+=0.01;
   yoff+=0.01;
   */
   
   // Method 7.3 - 2D perlin noise for stepsize walker
   float stepsizex = int(map(noise(xoff),0,1,0,50));
   float stepsizey = int(map(noise(yoff),0,1,0,50));
   
   float stepx = random(-stepsizex, stepsizex+1);
   float stepy = random(-stepsizey, stepsizey+1);
   
   x+=stepx; 
   y+=stepy; 
   
   xoff+=0.001;
   yoff+=0.001;
   
   
 }
  
 
}