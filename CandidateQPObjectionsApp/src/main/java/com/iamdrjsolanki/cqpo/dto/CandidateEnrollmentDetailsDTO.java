package com.iamdrjsolanki.cqpo.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CandidateEnrollmentDetailsDTO {
	
	private Long cedId;
	private String cedCandidateName;
	private String cedRollNo;
	private Date cedFromExamDate;	
	private Date cedToExamDate;
	private String cedExamTime;
	private List<SubjectDetailsDTO> subjects;
	private List<QuestionPaperDetailsDTO> questions;

}
