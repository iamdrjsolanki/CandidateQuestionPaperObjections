import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, NgForm, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { LoginRequestPayload } from '../model/login-request.payload';
import { AuthService } from '../services/auth.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginForm: FormGroup;
  loginRequestPayload: LoginRequestPayload = { username: '', password: ''};
  registerSuccessMessage: string;
  isError: boolean;

  constructor(
    private authService: AuthService, private router: Router,
    private toastr: ToastrService, private activatedRoute: ActivatedRoute
  ) {}

  ngOnInit() {
    this.loginForm = new FormGroup({
      username: new FormControl('', Validators.required),
      password: new FormControl('', Validators.required)
    });
  }

  login() {
    this.loginRequestPayload.username = this.loginForm.get('username')?.value;
    this.loginRequestPayload.password = this.loginForm.get('password')?.value;

    this.authService
      .login(this.loginRequestPayload)
      .subscribe((data) => {
        if(data) {
          console.log("Login Successful!");
          this.isError = false;
          this.router.navigateByUrl('/candidate-objections');
          this.toastr.success('Login Successful');
        } else {
          console.log(data);
          this.isError = true;
          this.toastr.error("Login Failed. Please try again.")
        }
      }, () => {
        this.toastr.error('Login Failed. Please try again.');
      });
  }

}
