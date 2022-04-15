package com.example.dicetutor;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;

public class UpdatePersonalInfo2 extends AppCompatActivity {
    Button textMove;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_update_personal_info2);

        textMove = (Button) findViewById(R.id.textMove);
        textMove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openNewActivity();
            }
        });

        Spinner mySpinner = (Spinner) findViewById(R.id.spinner1);
        ArrayAdapter<String> myAdapter = new ArrayAdapter<String>(UpdatePersonalInfo2.this,
                android.R.layout.simple_list_item_1, getResources().getStringArray(R.array.names));
        myAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mySpinner.setAdapter(myAdapter);

        Spinner mySpinner2 = (Spinner) findViewById(R.id.spinner2);
        ArrayAdapter<String> myAdapter2 = new ArrayAdapter<String>(UpdatePersonalInfo2.this,
                android.R.layout.simple_list_item_1, getResources().getStringArray(R.array.naming));
        myAdapter2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mySpinner2.setAdapter(myAdapter2);

        Spinner mySpinner3 = (Spinner) findViewById(R.id.spinner3);
        ArrayAdapter<String> myAdapter3 = new ArrayAdapter<String>(UpdatePersonalInfo2.this,
                android.R.layout.simple_list_item_1, getResources().getStringArray(R.array.city));
        myAdapter3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mySpinner3.setAdapter(myAdapter3);
    }

    public void openNewActivity(){
        Intent intent = new Intent(this, Academic.class);
        startActivity(intent);
    }
}