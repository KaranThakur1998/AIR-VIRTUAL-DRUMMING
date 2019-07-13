
 [x,Fs] = audioread('snare.ogg');
 [y,Fs] = audioread('crash1_1.ogg');
 [z,Fs] = audioread('splash.ogg');
 [u,Fs] = audioread('ride1.ogg');
    
vid=videoinput('winvideo',1,'YUY2_640x480');
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb');
vid.FrameGrabInterval = 5;
start(vid);

while(vid.FramesAcquired<=500)
    a=0;
    b=0;
    c=0;
    d=0;
    data=getsnapshot(vid);    
    for row=1:200
        for col=1:200
            if data(row,col,1)>100 && data(row,col,2)<100 && data(row,col,3)<100
                a=a+1;
            end
            data(row,col,1)=200;
        end
    end 

     
       for row=1:200
           for col=440:640
               if data(row,col,1)>100 && data(row,col,2)<100 && data(row,col,3)<100
                   b=b+1;
               end
            data(row,col,3)=200;
           end 
       end 
       
        for row=280:480
        for col=1:200
            if data(row,col,1)>100 && data(row,col,2)<100 && data(row,col,3)<100
                c=c+1;
            end
            data(row,col,2)=200;
        end
    end 
       
        for row=280:480
        for col=440:640
            if data(row,col,1)>100 && data(row,col,2)<100 && data(row,col,3)<100
                d=d+1;
            end
            data(row,col,1)=25;
        end
    end 
       if a>200
           sound(x,Fs);
       end
           if b>400
           sound(y,Fs);
           end
          if c>400
           sound(z,Fs);
          end
              if d>500
           sound(u,Fs);
              end
       imshow(data);
end
 stop(vid);
flushdata(vid);
