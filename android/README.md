# validating idea
In Matlab, use the following command to generate sound:
   
    t=linspace(0,10,960000);
    y=(sin(21000*2*pi*t) + sin(20000*2*pi*t) ) / 2;
 
Then we suggest using the default player to play the ultrasound, so you will need to write `y` to a .wav file:

    wavwrite(y,96000,'filename.wav');
    
Play the file "filename.wav" so that the computer can generate frequency modulated signals. And turn on the receiver on mobile phones (we have used Google Nexus 7 and Samsung Galaxy S3). Recommend the free software on Android ***Hertz*** which can record ".wav" file.

Then upload the file to the computer (using Dropbox or whatever you prefer), then analyze by Matlab. Importing the ".wav" file will give you **data** and **fs**. Then apply the following code in Matlab:

    L = length(data);
    NFFT = 2^nextpow2(L); 
    DTFT = fft(data,NFFT)/L;
    f = (fs)/2*linspace(0,1,NFFT/2+1);
    plot(f,2*abs(DTFT(1:NFFT/2+1)),'r') 
    title('Single-Sided Amplitude Spectrum of Input Vector')
    xlabel('Frequency (Hz)')
    grid
You will find that in frequency domain, we have recovered the modulated signal (with attenuation).



