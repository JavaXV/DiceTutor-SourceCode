package com.example.dicetutor;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class TutorEditProfile extends AppCompatActivity {
    private String st;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tutor_edit_profile);


        TextView textView = findViewById(R.id.ProfileInfo);
        textView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openNewActivity();
            }
        });

        TextView textView1 = findViewById(R.id.AcademicInfo);
        textView1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openNewActivity1();
            }
        });
        TextView textView2 = findViewById(R.id.GuarantorInfo);
        textView2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openNewActivity2();
            }
        });
        TextView textView3 = findViewById(R.id.BankInfo);
        textView3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openNewActivity3();
            }
        });
        TextView textView4 = findViewById(R.id.txtimage);
        textView4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openNewActivity4();
            }
        });

    }
    public void openNewActivity(){
        Intent intent = new Intent(this, PersonalUpdate1.class);
        startActivity(intent);
    }
    public void openNewActivity1(){
        Intent intent = new Intent(this, Academic.class);
        startActivity(intent);
    }
    public void openNewActivity2(){
        Intent intent = new Intent(this, Guatrantor.class);
        startActivity(intent);
    }
    public void openNewActivity3(){
        Intent intent = new Intent(this, UpdatePersonalInfo.class);
        startActivity(intent);
    }
    public void openNewActivity4(){
        Intent intent = new Intent(this, UploadImage.class);
        startActivity(intent);
    }
}