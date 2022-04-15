package com.example.dicetutor;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class ProcessActivity3 extends AppCompatActivity {
    Button textCheck;
    private String st;
    private EditText txtemail, txtpass, txtcpass;
    private Button buttonRegisters;
    private ProgressDialog progressDialog;


    private static final String ROOT_URL ="http://192.168.56.1/dicetutormobile/tutorregx.php";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_process3);

        txtpass = (EditText) findViewById(R.id.txtpass);
        txtcpass = (EditText) findViewById(R.id.txtcpass);
        txtemail = (EditText) findViewById(R.id.txtemail);
        buttonRegisters = (Button) findViewById(R.id.buttonRegisters);
        progressDialog = new ProgressDialog(this);

        st=getIntent().getExtras().getString("value");
        txtemail.setText(st);

        buttonRegisters.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
              //  openNewActivityc();
                progressDialog.setMessage("Registering User ...");
                progressDialog.show();

                final String passwords = txtpass.getText().toString();
                final String cpassword = txtcpass.getText().toString();
                final String email = txtemail.getText().toString();

                StringRequest request = new StringRequest(Request.Method.POST, ROOT_URL, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        progressDialog.dismiss();
                        int duration = Toast.LENGTH_SHORT;

                        Toast toast = Toast.makeText(ProcessActivity3.this, response.toString(), duration);

                        if (passwords.equals("") || cpassword.equals("") || email.equals("")) {

                            ViewGroup group = (ViewGroup) toast.getView();
                            TextView messageTextView = (TextView) group.getChildAt(0);
                            messageTextView.setTextSize(30);

                            View view = toast.getView();
                            view.setBackgroundResource(R.drawable.error);
                            toast.setView(view);
                            toast.show();
                        }else{
                            toast.show();
                            Intent intent = new Intent(ProcessActivity3.this, ProcessActivity2.class);
                            startActivity(intent);
                        }
                    }
                }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        progressDialog.hide();
                        Toast.makeText(ProcessActivity3.this, "" + error.toString(), Toast.LENGTH_SHORT).show();
                    }
                }){

                    @Nullable
                    @Override
                    protected Map<String, String> getParams() throws AuthFailureError {
                        Map<String,String> params = new HashMap<>();
                        params.put("passwords", passwords);
                        params.put("cpassword", cpassword);
                        params.put("email", email);
                        return params;
                    }
                };
                RequestQueue requestQueue = Volley.newRequestQueue(ProcessActivity3.this);
                request.setRetryPolicy(new DefaultRetryPolicy(10 * 1000, 1, 1.0f));
                requestQueue.add(request);

            }
        });
    }
  //  public void openNewActivityc(){
  //     Intent intent = new Intent(this, ProcessActivity2.class);
    //    startActivity(intent);
   // }
}