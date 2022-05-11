import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { CandidateEnrollmentDetails } from 'src/app/model/candidate-enrollment-details.model';
import { CandidateSubjectDetails } from 'src/app/model/candidate-subject-details.model';
import { QuestionPaperDetails } from 'src/app/model/question-paper-details.model';
import { SubjectDetails } from 'src/app/model/subject-details.model';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-question-details',
  templateUrl: './question-details.component.html',
  styleUrls: ['./question-details.component.css']
})
export class QuestionDetailsComponent implements OnInit {

  selectedSubject: string;
  cedDto: CandidateEnrollmentDetails;
  subjects: SubjectDetails[];
  questions: QuestionPaperDetails[];
  candidateSubjectMap = new Map<string, CandidateSubjectDetails>();
  currentSubject: string;
  currentQuestion: QuestionPaperDetails;
  totalMarks: number;
  totalQuestions: number;
  questionNo: string = '';
  constructQuestAns: boolean = false;
  subjectsQuestionsDetailsMap = new Map<string, QuestionPaperDetails>();

  questionNumber: number;
  question: string;
  questionAnswerOption1: string;
  questionAnswerOption2: string;
  questionAnswerOption3: string;
  questionAnswerOption4: string;	
  questionCorrectAnswer: string;
  qpdMarksAllotted: string;

  constructor(
    private authservice: AuthService, private toastr: ToastrService
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
    this.currentSubject = value;
    this.totalMarks = this.candidateSubjectMap.get(value)!.totalMarks;
    this.totalQuestions = this.candidateSubjectMap.get(value)!.totalQuestions;
  }

  getQuestionDetails(questionNo: string) {
    if(this.currentSubject === undefined) {
      this.toastr.error("Please select a subject.");
      return;
    }
    if(questionNo === undefined || questionNo === "") {
      this.toastr.error("Please enter question number.");
      return;
    }
    if(+questionNo > this.totalQuestions) {
      this.toastr.error("Total questions for the subject "+ this.currentSubject +" is "+ this.totalQuestions +".");
      return;
    }
    let key: string = this.currentSubject+"^"+questionNo;
    this.questionNumber = this.cedDto.subjectsQuestionsMap[key].qpdQuestionNumber;
    this.question = this.cedDto.subjectsQuestionsMap[key].qpdQuestion;
    this.questionAnswerOption1 = this.cedDto.subjectsQuestionsMap[key].qpdQuestionAnswerOption1;
    this.questionAnswerOption2 = this.cedDto.subjectsQuestionsMap[key].qpdQuestionAnswerOption2;
    this.questionAnswerOption3 = this.cedDto.subjectsQuestionsMap[key].qpdQuestionAnswerOption3;
    this.questionAnswerOption4 = this.cedDto.subjectsQuestionsMap[key].qpdQuestionAnswerOption4;	
    this.questionCorrectAnswer = this.cedDto.subjectsQuestionsMap[key].qpdQuestionCorrectAnswer;
    this.qpdMarksAllotted = this.cedDto.subjectsQuestionsMap[key].qpdMarksAllotted;
    this.constructQuestAns = true;
  }

}
