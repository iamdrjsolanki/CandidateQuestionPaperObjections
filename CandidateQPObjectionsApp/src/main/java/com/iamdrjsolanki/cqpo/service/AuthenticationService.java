package com.iamdrjsolanki.cqpo.service;

import java.time.Instant;

import javax.validation.Valid;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.iamdrjsolanki.cqpo.dto.CandidateEnrollmentDetailsDTO;
import com.iamdrjsolanki.cqpo.model.AuthenticationResponse;
import com.iamdrjsolanki.cqpo.model.AuthenticationRequest;
import com.iamdrjsolanki.cqpo.model.RefreshTokenRequest;
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
	private final RefreshTokenService refreshTokenService;

	public AuthenticationResponse authenticate(AuthenticationRequest request) {
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
		
		return AuthenticationResponse.builder()
				.username(userProfile.getUsername())
				.role(userProfile.getRole())
				.jwt(jwt)
				.cedDto(cedDto)
				.expiresAt(Instant.now().plusMillis(jwtUtil.getExpirationTime()))
				.refreshToken(refreshTokenService.generateRefreshToken().getToken())
				.build();
	}
	
	public boolean isLoggedIn() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return !(authentication instanceof AnonymousAuthenticationToken && authentication.isAuthenticated());
	}
	
	public AuthenticationResponse refreshToken(@Valid RefreshTokenRequest refreshTokenReq) {
		refreshTokenService.validateRefreshToken(refreshTokenReq.getRefreshToken());
		String token = jwtUtil.generateTokenWithUsername(refreshTokenReq.getUsername());
		
		UserProfile userProfile = userProfileService.getUserProile(refreshTokenReq.getUsername());
		CandidateEnrollmentDetailsDTO cedDto = cqpoService.getCandidateDetails(userProfile.getUsername());
		
		return AuthenticationResponse.builder()
				.username(userProfile.getUsername())
				.role(userProfile.getRole())
				.jwt(token)
				.cedDto(cedDto)
				.expiresAt(Instant.now().plusMillis(jwtUtil.getExpirationTime()))
				.refreshToken(refreshTokenReq.getRefreshToken())
				.build();
	}	

}
