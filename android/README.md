# validating idea
In Matlab, use the following command to generate sound:
   
    t=linspace(0,10,960000); 
	y=sin(20000*2*pi*t)+sin(20250*2*pi*t)+sin(20375*2*pi*t);
	y=y./3;
	
You can combine sine waves by adding a sin function with a specified frequency. In total, eight frequencies from 20000 to 20875 can be used increasing by 125 for each. You should make sure to divide the combined signal y by the total number of sine waves. Because the received strength of the signal tends to attenuate as the frequency gets higher, using lower frequencies is preferable.

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
