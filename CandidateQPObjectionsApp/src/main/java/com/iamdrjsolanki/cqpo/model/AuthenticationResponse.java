package com.iamdrjsolanki.cqpo.model;

import java.time.Instant;

import com.iamdrjsolanki.cqpo.dto.CandidateEnrollmentDetailsDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class AuthenticationResponse {
	
	private final String username;
	private final String role;
	private final String jwt;
	private final Instant expiresAt;
	private final String refreshToken;
	private final CandidateEnrollmentDetailsDTO cedDto;

}
