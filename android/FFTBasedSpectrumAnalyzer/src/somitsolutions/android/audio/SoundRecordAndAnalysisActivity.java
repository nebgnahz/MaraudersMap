package somitsolutions.android.audio;
import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.MediaRecorder;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;
import ca.uol.aig.fftpack.RealDoubleFFT;


public class SoundRecordAndAnalysisActivity extends Activity implements OnClickListener{
	
    int frequency = 44100;
    int channelConfiguration = AudioFormat.CHANNEL_CONFIGURATION_MONO;
    int audioEncoding = AudioFormat.ENCODING_PCM_16BIT;


    private RealDoubleFFT transformer;
    int blockSize = 2048;
    Button startStopButton;
    boolean started = false;

    RecordAudio recordTask;

    ImageView imageView;
    Bitmap bitmap;
    Canvas canvas;
    Paint paint;
    static SoundRecordAndAnalysisActivity mainActivity;
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    private class RecordAudio extends AsyncTask<Void, double[], Void> {
        @Override
        protected Void doInBackground(Void... params) {
            int bufferSize = AudioRecord.getMinBufferSize(frequency,
                channelConfiguration, audioEncoding);
            AudioRecord audioRecord = new AudioRecord(
                MediaRecorder.AudioSource.DEFAULT, frequency,
                channelConfiguration, audioEncoding, bufferSize);

            short[] buffer = new short[blockSize];
            double[] toTransform = new double[blockSize];
            try{
            	audioRecord.startRecording();
            }
            catch(IllegalStateException e){
            	Log.e("Recording failed", e.toString());
            }
            while (started) {
                int bufferReadResult = audioRecord.read(buffer, 0, blockSize);
    
                for (int i = 0; i < blockSize && i < bufferReadResult; i++) {
                    toTransform[i] = (double) buffer[i] / 32768.0; // signed 16 bit
                }

                transformer.ft(toTransform);
                publishProgress(toTransform);
            }
            try{
            	audioRecord.stop();
            }
            catch(IllegalStateException e){
            	Log.e("Stop failed", e.toString());
            }
            return null;
        }
        
        protected void onProgressUpdate(double[]... toTransform) {
            Log.e("RecordingProgress", "Displaying in progress");

            paint.setColor(Color.GREEN);
            int xOffset = 1840;
            int xScale = 8;
            canvas.drawColor(Color.BLACK);
            paint.setStrokeWidth(2);
            for (int i = xOffset; i < toTransform[0].length; i++) {
                int x = (i*1 - xOffset) * xScale;
                int upy = (int) (100 - Math.abs((toTransform[0][i] * 10)))*10;
                int downy = 100*10;
                canvas.drawLine(x, downy, x, upy, paint);
            }

            int textSize = 40;
            paint.setTextSize(textSize);
            paint.setColor(Color.WHITE);
            int x = 0;
            int downy = 1100;
            int upy = 1000;
            canvas.drawText("(kHz)", x, downy+textSize, paint);
            
            x = (1857 - xOffset) * xScale;
            canvas.drawLine(x, upy, x, downy, paint);
            canvas.drawText("20.0", x-textSize, downy+textSize, paint);
            
            x = (1880 - xOffset) * xScale;
            canvas.drawLine(x, upy, x, downy, paint);
            canvas.drawText("20.25", x-textSize, downy+textSize, paint);
            
            x = (1904 - xOffset) * xScale;
            canvas.drawLine(x, upy, x, downy, paint);
            canvas.drawText("20.5", x-textSize, downy+textSize, paint);

            x = (1927 - xOffset) * xScale;
            canvas.drawLine(x, upy, x, downy, paint);
            canvas.drawText("20.75", x-textSize, downy+textSize, paint);
            
            x = (1950 - xOffset) * xScale;
            canvas.drawLine(x, upy, x, downy, paint);
            canvas.drawText("21.0", x-textSize, downy+textSize, paint);
            imageView.invalidate();
            /*
            canvas.drawColor(Color.BLACK);
            paint.setStrokeWidth(1);
            for (int i = 0; i < toTransform[0].length; i++) {
                int x = i*1;
                int downy = (int) (100 - Math.abs((toTransform[0][i] * 10)))*4;
                int upy = 100*4;
                canvas.drawLine(x, downy, x, upy, paint);
            }
            imageView.invalidate();
            */
        }
    }

    public void onClick(View v) {
        if (started) {
            started = false;
            startStopButton.setText("Start");
            recordTask.cancel(true);
        } else {
            started = true;
            startStopButton.setText("Stop");
            recordTask = new RecordAudio();
            recordTask.execute();
        }
     }
        
    static SoundRecordAndAnalysisActivity getMainActivity(){
    	return mainActivity;
    }
        
    public void onStop(){
    	super.onStop();
    	started = false;
        startStopButton.setText("Start");
    	recordTask.cancel(true);
    }
        
    public void onStart(){
    	super.onStart();
    	
    	setContentView(R.layout.main);
        
        startStopButton = (Button) this.findViewById(R.id.StartStopButton);
        startStopButton.setOnClickListener(this);

        transformer = new RealDoubleFFT(blockSize);

        imageView = (ImageView) this.findViewById(R.id.imageView1);
        bitmap = Bitmap.createBitmap((int)1024,(int)1400,Bitmap.Config.ARGB_8888);
        canvas = new Canvas(bitmap);
        paint = new Paint();
        paint.setColor(Color.GREEN);
        imageView.setImageBitmap(bitmap);
        //imageView.
        mainActivity = this;
    }
}
    
