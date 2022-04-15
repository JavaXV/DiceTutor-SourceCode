package com.example.dicetutor;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;

public class UpdatePersonalInfo extends AppCompatActivity {
    Button textContinue;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_update_personal_info);

        Spinner mySpinner = (Spinner) findViewById(R.id.spinner4);
        ArrayAdapter<String> myAdapter = new ArrayAdapter<String>(UpdatePersonalInfo.this,
                android.R.layout.simple_list_item_1, getResources().getStringArray(R.array.bank));
        myAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mySpinner.setAdapter(myAdapter);

        textContinue = (Button) findViewById(R.id.textContinue);
        textContinue.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openNewActivity();
            }
        });
    }
    public void openNewActivity(){
        Intent intent = new Intent(this, UpdatePersonalInfo2.class);
        startActivity(intent);
    }
}