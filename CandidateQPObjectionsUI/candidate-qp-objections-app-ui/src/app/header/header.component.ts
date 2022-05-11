import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { environment } from '../../environments/environment'
import { ObjectionCandidateBean } from '../model/objection-candidate.model';
import { AuthService } from '../services/auth.service';

@Component({
    selector: 'app-header',
    templateUrl: './header.component.html',

})
export class HeaderComponent implements OnInit {

    isAuthenticated = false;
    collapsed: boolean = true;
    userId: string;
    clientName: string = environment.clientName;
    objectionCandidateData: ObjectionCandidateBean;

    constructor(
      private authservice: AuthService, private router: Router
    ) {}

    ngOnInit() {
      this.authservice.isUserLoggedIn.subscribe(data => this.isAuthenticated = data);
      this.authservice.getLoggedInUser.subscribe(username => this.userId = username);
    }

    onLogout() {
      this.authservice.logout();
      this.router.navigateByUrl('').then(() => {
        window.location.reload();
      })
    }

}
