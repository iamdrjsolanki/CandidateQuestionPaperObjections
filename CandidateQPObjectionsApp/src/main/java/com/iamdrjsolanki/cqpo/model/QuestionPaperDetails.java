package com.iamdrjsolanki.cqpo.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class QuestionPaperDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long qpdId;
	
	private Long qpdQuestionNumber;
	
	private String qpdQuestion;
	
	private String qpdQuestionAnswerOption1;
	
	private String qpdQuestionAnswerOption2;
	
	private String qpdQuestionAnswerOption3;
	
	private String qpdQuestionAnswerOption4;
	
	private String qpdQuestionCorrectAnswer;
	
	private String qpdMarksAllotted;
	
	@ManyToMany(cascade = { 
					CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST 
				}, 
				fetch = FetchType.LAZY,
				mappedBy = "questions"
			)
	@JsonIgnore
	private List<CandidateEnrollmentDetails> candidates;
	
	@ManyToOne(cascade = { 
					CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST 
				}, 
				fetch = FetchType.LAZY
			)
	@JoinColumn(name = "sdId", referencedColumnName = "sdId")
	private SubjectDetails subjectDetails;

}
