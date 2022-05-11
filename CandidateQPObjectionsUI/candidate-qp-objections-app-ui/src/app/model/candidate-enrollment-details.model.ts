import { SubjectDetails } from '../model/subject-details.model';
import { QuestionPaperDetails } from '../model/question-paper-details.model';

export class CandidateEnrollmentDetails {
    cedId: number;
	cedCandidateName: string;
	cedRollNo: string;
	cedFromExamDate: string;	
	cedToExamDate: string;
	cedExamTime: string;
	subjects: Array<SubjectDetails>;
	questions: Array<QuestionPaperDetails>;
	subjectsQuestionsMap = new Map<string, QuestionPaperDetails>();
}