package com.iamdrjsolanki.cqpo.service;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.iamdrjsolanki.cqpo.dto.CandidateEnrollmentDetailsDTO;
import com.iamdrjsolanki.cqpo.model.AuthenticationReponse;
import com.iamdrjsolanki.cqpo.model.AuthenticationRequest;
import com.iamdrjsolanki.cqpo.model.UserProfile;
import com.iamdrjsolanki.cqpo.util.JwtUtil;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AuthenticationService {
	
	private final AuthenticationManager authenticationManager;
	private final MyUserDetailsService userDetailsService;
	private final JwtUtil jwtUtil;
	private final UserProfileService userProfileService;
	private final CandidateQPObjecionService cqpoService;

	public AuthenticationReponse authenticate(AuthenticationRequest request) {
		Authentication authenticate = authenticationManager
										.authenticate(
												new UsernamePasswordAuthenticationToken(
														request.getUsername(), 
														request.getPassword()
													)
												);
		SecurityContextHolder.getContext().setAuthentication(authenticate);
		final UserDetails userDetails = userDetailsService.loadUserByUsername(request.getUsername());
		final String jwt = jwtUtil.generateToken(userDetails);
		
		UserProfile userProfile = userProfileService.getUserProile(request.getUsername());
		CandidateEnrollmentDetailsDTO cedDto = cqpoService.getCandidateDetails(userProfile.getUsername());
		
		AuthenticationReponse res = new AuthenticationReponse(userProfile.getUsername(), userProfile.getRole(), jwt, cedDto);
		
		return res;
	}
	
	

}
