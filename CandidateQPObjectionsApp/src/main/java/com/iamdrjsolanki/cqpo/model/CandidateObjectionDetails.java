package com.iamdrjsolanki.cqpo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class CandidateObjectionDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codObjectionId;
	
	private Long codSubjectId;
	
	private Long codQuestionId;
	
	private Long codCandidateId;
	
	private Long codQuestionNumber;
	
	private IssueType codIssueType;
	
	private String codDescription;
	
	private boolean codSaved;
	
	private boolean codSubmitted;

}
