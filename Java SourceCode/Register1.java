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

public class RegisterActivity extends AppCompatActivity {
    private String st;
    private EditText txtemail, txtfirstname, txtlastname;
    private Button buttonRegister;
    private ProgressDialog progressDialog;


    String ROOT_URL1 ="http://192.168.56.1/dicetutormobile/reg.php";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        txtfirstname = (EditText) findViewById(R.id.txtfirstname);
        txtlastname = (EditText) findViewById(R.id.txtlastname);
        txtemail = (EditText) findViewById(R.id.txtemail);
        buttonRegister = (Button) findViewById(R.id.buttonRegister);
        progressDialog = new ProgressDialog(this);


        buttonRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
               // openNewActivityc();
                progressDialog.setMessage("Registering User ...");
                progressDialog.show();

                final String firstname = txtfirstname.getText().toString();
                final String lastname = txtlastname.getText().toString();
                final String email = txtemail.getText().toString();

                StringRequest request = new StringRequest(Request.Method.POST, ROOT_URL1, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        progressDialog.dismiss();

                        int duration = Toast.LENGTH_LONG;

                        Toast toast = Toast.makeText(RegisterActivity.this, response.toString(), duration);
                        if (firstname.equals("") || lastname.equals("") || email.equals("")) {
                            progressDialog.dismiss();

                            ViewGroup group = (ViewGroup) toast.getView();
                            TextView messageTextView = (TextView) group.getChildAt(0);
                            messageTextView.setTextSize(20);

                            View view = toast.getView();
                            view.setBackgroundResource(R.drawable.error);
                            toast.setView(view);
                            toast.show();
                        }
                        try {
                            progressDialog.hide();
                            JSONObject obj = new JSONObject(response);
                            if(!obj.getBoolean("error")){
                                Intent i = new Intent(RegisterActivity.this, ProcessActivity3.class);
                                st = txtemail.getText().toString().trim();
                                i.putExtra("value", st);
                                startActivity(i);
                                finish();

                            }else{
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
                        params.put("firstname", firstname);
                        params.put("lastname", lastname);
                        params.put("email", email);
                        return params;
                    }
                };
                RequestQueue requestQueue = Volley.newRequestQueue(RegisterActivity.this);
                 request.setRetryPolicy(new DefaultRetryPolicy(10 * 500, 1, 1.0f));
                requestQueue.add(request);

            }
        });
    }
    //public void openNewActivityc(){
      //  Intent intent = new Intent(this, ProcessActivity3.class);
       // startActivity(intent);
   // }


}