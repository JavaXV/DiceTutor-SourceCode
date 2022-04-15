package com.example.dicetutor;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.TextView;

public class Academic1 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_academic1);

        TextView textView = findViewById(R.id.textSkip);

        textView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openNewActivity();
            }
        });


        Spinner mySpinner = (Spinner) findViewById(R.id.spinner4);
        ArrayAdapter<String> myAdapter = new ArrayAdapter<String>(Academic1.this,
                android.R.layout.simple_list_item_1, getResources().getStringArray(R.array.education));
        myAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mySpinner.setAdapter(myAdapter);
    }

    public void openNewActivity(){
        Intent intent = new Intent(this, Guatrantor.class);
        startActivity(intent);
    }
}