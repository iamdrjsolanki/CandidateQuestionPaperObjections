package com.iamdrjsolanki.cqpo.model;

import com.iamdrjsolanki.cqpo.dto.CandidateEnrollmentDetailsDTO;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AuthenticationReponse {
	
	private final String username;
	private final String role;
	private final String jwt;
	private final CandidateEnrollmentDetailsDTO cedDto;

}
