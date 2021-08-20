package com.iamdrjsolanki.cqpo.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class CandidateEnrollmentDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cedId;
	
	private String cedCandidateName;
	
	private String cedRollNo;
	
	private Date cedFromExamDate;
	
	private Date cedToExamDate;
	
	private String cedExamTime;
	
	@ManyToMany(cascade = { 
						CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST 
					}, 
					fetch = FetchType.LAZY
				)
	@JoinTable(name = "candidate_subject", 
					joinColumns = @JoinColumn(name = "ced_id", referencedColumnName = "cedId"), 
					inverseJoinColumns = @JoinColumn(name = "sd_id", referencedColumnName = "sdId")
				)
	@JsonIgnore
	private List<SubjectDetails> subjects;
	
	@ManyToMany(cascade = { 
						CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST 
					}, 
					fetch = FetchType.EAGER
				)
	@JoinTable(name = "candidate_question", 
					joinColumns = @JoinColumn(name = "ced_id"), 
					inverseJoinColumns = @JoinColumn(name = "qpd_id")
				)

	@JsonIgnore
	private List<QuestionPaperDetails> questions;

}
