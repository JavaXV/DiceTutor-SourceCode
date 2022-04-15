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

public class ProcessActivity2 extends AppCompatActivity {

    private String st;
    private EditText txtVerify;
    private Button textCheck;
    private ProgressDialog progressDialog;


    private static final String ROOT_URL ="http://192.168.56.1/dicetutormobile/digitverify.php";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_process2);

        txtVerify = (EditText) findViewById(R.id.txtVerify);
        textCheck = (Button) findViewById(R.id.textCheck);
        progressDialog = new ProgressDialog(this);

        textCheck.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
               // openNewActivityc();
                progressDialog.setMessage("Registering User ...");
                progressDialog.show();

                final String digitvalue = txtVerify.getText().toString();


                StringRequest request = new StringRequest(Request.Method.POST, ROOT_URL, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        progressDialog.dismiss();
                        int duration = Toast.LENGTH_LONG;

                        Toast toast = Toast.makeText(ProcessActivity2.this, response.toString(), duration);
                        if (digitvalue.equals("")) {
                            progressDialog.dismiss();
                            ViewGroup group = (ViewGroup) toast.getView();
                            TextView messageTextView = (TextView) group.getChildAt(0);
                            messageTextView.setTextSize(30);

                            View view = toast.getView();
                            view.setBackgroundResource(R.drawable.error);
                            toast.setView(view);
                            toast.show();
                        }
                        try {
                            progressDialog.hide();
                            JSONObject obj = new JSONObject(response);
                            if(!obj.getBoolean("error")){
                                Intent intent = new Intent(ProcessActivity2.this, ProcessActivity5.class);
                                startActivity(intent);

                            }else{
                                ViewGroup group = (ViewGroup) toast.getView();
                                TextView messageTextView = (TextView) group.getChildAt(0);
                                messageTextView.setTextSize(30);

                                View view = toast.getView();
                                view.setBackgroundResource(R.drawable.error);
                                toast.setView(view);
                                toast.show();
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                },new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        progressDialog.hide();
                        Toast.makeText(ProcessActivity2.this, "" + error.toString(), Toast.LENGTH_SHORT).show();
                    }
                }){

                    @Nullable
                    @Override
                    protected Map<String, String> getParams() throws AuthFailureError {
                        Map<String,String> params = new HashMap<>();
                        params.put("digitvalue", digitvalue);
                        return params;
                    }
                };
                RequestQueue requestQueue = Volley.newRequestQueue(ProcessActivity2.this);
                request.setRetryPolicy(new DefaultRetryPolicy(10 * 1000, 1, 1.0f));
                requestQueue.add(request);

            }
        });
    }
  //  public void openNewActivityc() {
     //   Intent intent = new Intent(this, ProcessActivity5.class);
     //   startActivity(intent);
   // }

}