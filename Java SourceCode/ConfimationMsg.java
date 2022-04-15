package com.example.dicetutor;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class ProcessActivity5 extends AppCompatActivity {
    Button textChecks;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_process5);


        textChecks = (Button) findViewById(R.id.textChecks);
        textChecks.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openNewActivityx();
            }
        });
    }
    public void openNewActivityx(){
        Intent intent = new Intent(this, processActivityx4.class);
        startActivity(intent);
    }
}