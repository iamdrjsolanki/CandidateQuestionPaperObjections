import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { map } from 'rxjs/operators'
import { CandidateObjectionDetails } from '../model/candidate-objections-details.model';

@Injectable({
  providedIn: 'root'
})
export class CandidateObjectionsService {

  private SERVER_URL = environment.serverUrl;
  //codDto: CandidateObjectionDetails[];

  constructor(
    private http: HttpClient
  ) {}

  getCandidateObjections(candidateId: number) : Observable<CandidateObjectionDetails[]> {
    return this.http
      .get<CandidateObjectionDetails[]>(`${this.SERVER_URL}/api-objections/objections/${candidateId}`)
      .pipe(
        map(data => {
          return JSON.stringify(data);
        })
      );
  }

}
