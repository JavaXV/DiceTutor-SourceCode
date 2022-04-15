package com.example.dicetutor;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class EditActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit);


        TextView textView1 = findViewById(R.id.LogOut);
        textView1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openNewActivity1();
            }
        });
    }
    public void openNewActivity1(){
        Intent intent = new Intent(this, processActivityx4.class);
        startActivity(intent);
    }
}