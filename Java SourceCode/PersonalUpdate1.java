package com.example.dicetutor;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.TextView;

public class PersonalUpdate1 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_personal_update1);


        TextView textView = findViewById(R.id.textContinue);
        textView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openNewActivity();
            }
        });

        Spinner mySpinner = (Spinner) findViewById(R.id.spinner4);
        ArrayAdapter<String> myAdapter = new ArrayAdapter<String>(PersonalUpdate1.this,
                android.R.layout.simple_list_item_1, getResources().getStringArray(R.array.GENDER));
        myAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mySpinner.setAdapter(myAdapter);

        Spinner mySpinnerX = (Spinner) findViewById(R.id.spinner1);
        ArrayAdapter<String> myAdapterX = new ArrayAdapter<String>(PersonalUpdate1.this,
                android.R.layout.simple_list_item_1, getResources().getStringArray(R.array.names));
        myAdapterX.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mySpinnerX.setAdapter(myAdapterX);

        Spinner mySpinner2 = (Spinner) findViewById(R.id.spinner2);
        ArrayAdapter<String> myAdapter2 = new ArrayAdapter<String>(PersonalUpdate1.this,
                android.R.layout.simple_list_item_1, getResources().getStringArray(R.array.naming));
        myAdapter2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mySpinner2.setAdapter(myAdapter2);

        Spinner mySpinner3 = (Spinner) findViewById(R.id.spinner3);
        ArrayAdapter<String> myAdapter3 = new ArrayAdapter<String>(PersonalUpdate1.this,
                android.R.layout.simple_list_item_1, getResources().getStringArray(R.array.city));
        myAdapter3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mySpinner3.setAdapter(myAdapter3);
    }
    public void openNewActivity(){
        Intent intent = new Intent(this, Academic.class);
        startActivity(intent);
    }
}