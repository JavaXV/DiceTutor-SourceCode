package com.example.dicetutor;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.view.View;
import android.widget.Button;

import android.os.Bundle;
import android.widget.TextView;

public class Father extends AppCompatActivity {
    private String st;

 @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_father);

        TextView textView4 = findViewById(R.id.txtdashboard);
       // TextView textView = findViewById(R.id.editlayout);
        TextView textView1 = findViewById(R.id.LogOut);
     //   TextView textView2 = findViewById(R.id.updateFile);

        st=getIntent().getExtras().getString("value");
        textView4.setText(st);




        textView1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openNewActivity1();
            }
        });


    }
    public void openNewActivity(){
        Intent intent = new Intent(this, EditActivity.class);
        startActivity(intent);
    }
    public void openNewActivity1(){
        Intent intent = new Intent(this, processActivityx4.class);
        startActivity(intent);
    }
    public void openNewActivity1x(){
        Intent intent = new Intent(this, UpdatePersonalInfo.class);
        startActivity(intent);
    }
}