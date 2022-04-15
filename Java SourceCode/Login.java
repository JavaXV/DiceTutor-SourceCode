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

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class processActivityx4 extends AppCompatActivity {
    private String st;
    private EditText txtemail, txtpass;
    private Button textLogin;
    private ProgressDialog progressDialog;
    private TextView textView;


    String ROOT_URL1 ="http://192.168.56.1/dicetutormobile/AccountCreation1.php";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_process_activityx4);

        txtpass = (EditText) findViewById(R.id.txtpass);
        txtemail = (EditText) findViewById(R.id.txtemail);
        textLogin = (Button) findViewById(R.id.textLogin);
        progressDialog = new ProgressDialog(this);


        TextView textView = findViewById(R.id.textSignin);
        textView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openNewActivity();
            }
        });

        textLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
               // openNewActivityc();
                progressDialog.setMessage(" User Login ...");
                progressDialog.show();


                final String passwords = txtpass.getText().toString();
                final String email = txtemail.getText().toString();

                StringRequest request = new StringRequest(Request.Method.POST, ROOT_URL1, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        progressDialog.dismiss();

                        int duration = Toast.LENGTH_LONG;

                        Toast toast = Toast.makeText(processActivityx4.this, response.toString(), duration);
                        if (passwords.equals("") || email.equals("")) {
                            progressDialog.dismiss();
                            ViewGroup group = (ViewGroup) toast.getView();
                            TextView messageTextView = (TextView) group.getChildAt(0);
                            messageTextView.setTextSize(20);
                            View view = toast.getView();
                            view.setBackgroundResource(R.drawable.error);
                            toast.setView(view);
                            toast.show();

                        }else{
                        try {
                            progressDialog.hide();
                            JSONObject obj = new JSONObject(response);
                            if (!obj.getBoolean("error")) {
                                Intent i = new Intent(processActivityx4.this, TutorProfile.class);
                                st = txtemail.getText().toString().trim();
                                i.putExtra("value", st);
                                startActivity(i);
                                finish();

                            } else {
                                ViewGroup group = (ViewGroup) toast.getView();
                                TextView messageTextView = (TextView) group.getChildAt(0);
                                messageTextView.setTextSize(20);

                                View view = toast.getView();
                                view.setBackgroundResource(R.drawable.error);
                                toast.setView(view);
                                toast.show();
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                    }
                }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        progressDialog.hide();
                    }
                }){

                    @Nullable
                    @Override
                    protected Map<String, String> getParams() throws AuthFailureError {
                        Map<String,String> params = new HashMap<>();
                        params.put("passwords", passwords);
                        params.put("email", email);
                        return params;
                    }
                };
                RequestQueue requestQueue = Volley.newRequestQueue(processActivityx4.this);
                request.setRetryPolicy(new DefaultRetryPolicy(10 * 500, 1, 1.0f));
                requestQueue.add(request);

            }
        });
    }
    public void openNewActivity(){
        Intent intent = new Intent(this, ProcessActivity1.class);
        startActivity(intent);
    }
   // public void openNewActivityc(){
     //  Intent intent = new Intent(this, TutorProfile.class);
     //   startActivity(intent);
   // }
}