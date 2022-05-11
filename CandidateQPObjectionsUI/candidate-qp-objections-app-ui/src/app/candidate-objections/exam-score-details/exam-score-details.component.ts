import { HIGH_CONTRAST_MODE_ACTIVE_CSS_CLASS } from '@angular/cdk/a11y/high-contrast-mode/high-contrast-mode-detector';
import { Component, OnInit } from '@angular/core';
import { CandidateEnrollmentDetails } from 'src/app/model/candidate-enrollment-details.model';
import { CandidateSubjectDetails } from 'src/app/model/candidate-subject-details.model';
import { QuestionPaperDetails } from 'src/app/model/question-paper-details.model';
import { SubjectDetails } from 'src/app/model/subject-details.model';
import { AuthService } from 'src/app/services/auth.service';

interface Subjects {
  value: string;
  viewValue: string;
}

@Component({
  selector: 'app-exam-score-details',
  templateUrl: './exam-score-details.component.html',
  styleUrls: ['./exam-score-details.component.css']
})
export class ExamScoreDetailsComponent implements OnInit {

  selectedSubject: string;
  cedDto: CandidateEnrollmentDetails;
  subjects: SubjectDetails[];
  questions: QuestionPaperDetails[];
  candidateSubjectMap = new Map<string, CandidateSubjectDetails>();
  totalMarks: number;
  totalQuestions: number;

  constructor(
    private authservice: AuthService
  ) {}

  ngOnInit(): void {
    this.cedDto = this.authservice.cedDto;
    
    this.subjects = this.cedDto.subjects;
    this.questions = this.cedDto.questions;
    
    for(let subject of this.subjects) {
      let candidateSubjectDetails = new CandidateSubjectDetails();
      candidateSubjectDetails.totalMarks = this.getSubjectTotalMarks(subject.subjectName);
      candidateSubjectDetails.totalQuestions = this.getSubjectTotalQuestions(subject.subjectName);
      this.candidateSubjectMap.set(subject.subjectName, candidateSubjectDetails);
    }

    this.totalMarks = 0;
    this.totalQuestions = 0;
  }

  getSubjectTotalMarks(sub: string) {
    let totalMarks = 0;
    for(let q of this.questions) {
      if(q.qpdSubjectName === sub) {
        var marksAlloted: number = +q.qpdMarksAllotted;
        totalMarks += marksAlloted;
      }
    }
    return totalMarks;
  }

  getSubjectTotalQuestions(sub: string) {
    let totalQuestions = 0;
    for(let q of this.questions) {
      if(q.qpdSubjectName === sub) {
        totalQuestions = totalQuestions + 1;
      }
    }
    return totalQuestions;
  }

  getSelectedSubjectDetails(value: string) {
    this.totalMarks = this.candidateSubjectMap.get(value)!.totalMarks;
    this.totalQuestions = this.candidateSubjectMap.get(value)!.totalQuestions;
  }

}
