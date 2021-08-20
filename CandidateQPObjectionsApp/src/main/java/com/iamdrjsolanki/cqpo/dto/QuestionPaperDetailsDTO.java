package com.iamdrjsolanki.cqpo.dto;

import java.util.List;

import com.iamdrjsolanki.cqpo.model.CandidateEnrollmentDetails;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuestionPaperDetailsDTO {
	
	private Long qpdId;
	private Long qpdQuestionNumber;
	private String qpdQuestion;
	private String qpdQuestionAnswerOption1;
	private String qpdQuestionAnswerOption2;
	private String qpdQuestionAnswerOption3;
	private String qpdQuestionAnswerOption4;	
	private String qpdQuestionCorrectAnswer;
	private String qpdMarksAllotted;
	private List<CandidateEnrollmentDetails> candidates;

}
