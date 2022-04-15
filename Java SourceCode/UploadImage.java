package com.example.dicetutor;

import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

import java.net.URI;

public class UploadImage extends AppCompatActivity {
    ImageView imgProfile;
    Button btnPhoto, btn;
    public static final int CAMERA_REQ_CODE=1;
    public static final int CAMERA_REQ_CODES=111;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_upload_image);

        imgProfile = findViewById(R.id.ivProfile);
        btnPhoto = findViewById(R.id.btnPhoto);

        btn = findViewById(R.id.btn);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
                intent.setType("image/*");
                intent.setAction(Intent.ACTION_GET_CONTENT);
                startActivityForResult(Intent.createChooser(intent, "Title"),CAMERA_REQ_CODE);

            }
        });

        if(ContextCompat.checkSelfPermission( UploadImage.this, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(UploadImage.this,new String[]{Manifest.permission.CAMERA},100);
        }
        btnPhoto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                startActivityForResult(intent, 100);
            }
        });
    }
    @SuppressLint("MissingSuperCall")
    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        if(requestCode == CAMERA_REQ_CODE && resultCode == RESULT_OK && data != null){
            Uri uri = data.getData();
            imgProfile.setImageURI(uri);
            btnPhoto.setText("Done");
        }
        if(requestCode == 100 && data != null){
            Bundle bundle = data.getExtras();
            Bitmap finalPhoto = (Bitmap) bundle.get("data");
            imgProfile.setImageBitmap(finalPhoto);
            btn.setText("Done");
        }
    }


}