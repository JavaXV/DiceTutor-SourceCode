package com.example.dicetutor;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class TutorProfile extends AppCompatActivity {
    private String st;
    private TextView txtdashboard;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tutor_profile);

        txtdashboard = (TextView) findViewById(R.id.txtdashboard);

        st=getIntent().getExtras().getString("value");
        txtdashboard.setText(st);


        TextView textView = findViewById(R.id.profile);
        textView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openNewActivity();
            }
        });
    }
    public void openNewActivity(){
        Intent intent = new Intent(this, TutorEditProfile.class);
        startActivity(intent);
    }
}