package com.iamdrjsolanki.cqpo.dto;

import java.util.List;

import com.iamdrjsolanki.cqpo.model.CandidateEnrollmentDetails;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SubjectDetailsDTO {
	
	private Long sdId;
	private String subjectName;
	private List<CandidateEnrollmentDetails> candidates;

}
