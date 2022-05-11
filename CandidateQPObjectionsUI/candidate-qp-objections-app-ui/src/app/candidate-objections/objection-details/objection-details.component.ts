import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, NgForm, Validators } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { CandidateEnrollmentDetails } from 'src/app/model/candidate-enrollment-details.model';
import { CandidateObjectionDetails } from 'src/app/model/candidate-objections-details.model';
import { QuestionPaperDetails } from 'src/app/model/question-paper-details.model';
import { SubjectDetails } from 'src/app/model/subject-details.model';
import { AuthService } from 'src/app/services/auth.service';
import { CandidateObjectionsService } from 'src/app/services/candidate-objections.service';

@Component({
  selector: 'app-objection-details',
  templateUrl: './objection-details.component.html',
  styleUrls: ['./objection-details.component.css']
})
export class ObjectionDetailsComponent implements OnInit {

  createObjectionsForm: FormGroup;
  objectionsPayload: CandidateObjectionDetails[];
  objections: CandidateObjectionDetails[];
  objectionsLoaded: Promise<boolean>;
  cedDto: CandidateEnrollmentDetails;
  subjects: SubjectDetails[];
  questions: QuestionPaperDetails[];

  constructor(
    private authservice: AuthService, private toastr: ToastrService,
    private candidateObjectionService: CandidateObjectionsService
  ) {
    // this.objectionsPayload = {
    //   subjectName: '',
    //   questionNumber: '',
    //   reason: '',
    //   description: ''
    // }
  }
  
  ngOnInit(): void {
  
  this.cedDto = this.authservice.cedDto;
  this.subjects = this.cedDto.subjects;
  this.questions = this.cedDto.questions;

    let candidateId = this.cedDto.cedId;
    this.candidateObjectionService
      .getCandidateObjections(candidateId)
      .subscribe(data => {
          console.log("objections:"+data);
          this.objections = data;
          this.objectionsLoaded = Promise.resolve(true);
        },
        error => {
          console.log(<any>error);
        }
      );

      console.log("objections after"+this.objections);
  }

  addObjectionForm() {}

  saveObjection(form: NgForm) {
    const userId = form.value.gitUser;
  }

}
