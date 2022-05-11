import { HttpClient } from '@angular/common/http';
import { EventEmitter, Injectable, Output } from '@angular/core';
import { Observable, Subject, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { LoginRequestPayload } from '../model/login-request.payload';
import { LoginResponsePayload } from '../model/login-response.payload';
import { map, tap } from 'rxjs/operators'
import { LocalStorageService } from 'ngx-webstorage';
import { CandidateEnrollmentDetails } from '../model/candidate-enrollment-details.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  public isUserLoggedIn = new Subject<boolean>();
  public getLoggedInUser = new Subject<string>();
  private SERVER_URL = environment.serverUrl;
  cedDto: CandidateEnrollmentDetails;

  refreshTokenPayload = {
    refreshToken: this.getRefreshToken(),
    username: this.getUsername()
  }

  constructor(
    private http: HttpClient,
    private localWebStorage: LocalStorageService
  ) {}

  login(loginReqPayload: LoginRequestPayload) : Observable<boolean> {
    return this.http
      .post<LoginResponsePayload>(`${this.SERVER_URL}/api-auth/authenticate`, loginReqPayload)
      .pipe(
        map(data => {
          this.localWebStorage.store('authenticationToken', data.jwt);
          this.localWebStorage.store('refreshToken', data.refreshToken);
          this.localWebStorage.store('expiresAt', data.expiresAt);
          this.localWebStorage.store('username', data.username);

          this.isUserLoggedIn.next(true);
          this.getLoggedInUser.next(data.username);

          this.cedDto = data.cedDto;
          return true;
        })
      );
  }

  isLoggedIn(): boolean {
    return this.getJwtToken() != null;
  }

  getJwtToken() {
    return this.localWebStorage.retrieve('authenticationToken');
  }

  getRefreshToken() {
    return this.localWebStorage.retrieve('refreshToken');
  }

  getUsername() {
    return this.localWebStorage.retrieve('username');
  }

  getExpiresAt() {
    return this.localWebStorage.retrieve('expiresAt');
  }

  refreshToken() {
    return this.http
        .post<LoginResponsePayload>(`${this.SERVER_URL}/api-auth/refresh/token`, this.refreshTokenPayload)
        .pipe(
          tap(response => {
            this.localWebStorage.clear('authenticationToken');
            this.localWebStorage.clear('expiresAt');

            this.localWebStorage.store('authenticationToken', response.jwt);
            this.localWebStorage.store('expiresAt', response.expiresAt);
          })
        );
  }

  logout() {
    this.http
      .post(`${this.SERVER_URL}/api-auth/logout`, this.refreshTokenPayload, { responseType: 'text' })
      .subscribe(data => {
        console.log(data);
      }, error => {
        throwError(error);
      })
    this.localWebStorage.clear('authenticationToken');
    this.localWebStorage.clear('username');
    this.localWebStorage.clear('refreshToken');
    this.localWebStorage.clear('expiresAt');
  }

}
