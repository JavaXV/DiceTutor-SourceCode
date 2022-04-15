package com.example.dicetutor;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.view.View;
import android.widget.Button;

import android.os.Bundle;

public class MainActivity extends AppCompatActivity {
    Button startButton;
    Button startSignin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        startButton = (Button) findViewById(R.id.startButton);
        startSignin = (Button) findViewById(R.id.startSignin);

        startButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openNewActivity();
            }
        });
        startSignin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openNewActivity1();
            }
        });
    }
    public void openNewActivity(){
        Intent intent = new Intent(this, ProcessActivity1.class);
        startActivity(intent);
    }
    public void openNewActivity1(){
        Intent intent = new Intent(this,  processActivityx4.class);
        startActivity(intent);
    }
}
