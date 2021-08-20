package com.iamdrjsolanki.cqpo.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "sdId"
	)
public class SubjectDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long sdId;
	
	private String subjectName;
	
	@ManyToMany(cascade = { 
					CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST 
				}, 
				fetch = FetchType.LAZY,
				mappedBy = "subjects"
			)
	@JsonIgnore
	private List<CandidateEnrollmentDetails> candidates;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy="subjectDetails")
    private List<QuestionPaperDetails> questionPaperDetails;

}
