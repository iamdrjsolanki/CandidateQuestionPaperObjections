package com.iamdrjsolanki.cqpo.controller;

import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.iamdrjsolanki.cqpo.model.AuthenticationRequest;
import com.iamdrjsolanki.cqpo.model.AuthenticationResponse;
import com.iamdrjsolanki.cqpo.model.RefreshTokenRequest;
import com.iamdrjsolanki.cqpo.service.AuthenticationService;
import com.iamdrjsolanki.cqpo.service.RefreshTokenService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api-auth")
public class AuthenticationController {
	
	private final AuthenticationService authService;
	private final RefreshTokenService refreshTokenService;
	
	@GetMapping("/")
	public String testpage() {
		return "Test Page!";
	}
	
	@PostMapping("/authenticate")
	public AuthenticationResponse authenticate(@RequestBody AuthenticationRequest request) {
		return authService.authenticate(request);	
	}
	
	@PostMapping("/refresh/token")
	public AuthenticationResponse refreshToken(@Valid @RequestBody RefreshTokenRequest refreshTokenReq) {
		return authService.refreshToken(refreshTokenReq);
	}
	
	@PostMapping("/logout")
	public ResponseEntity<String> logout(@Valid @RequestBody RefreshTokenRequest refreshTokenReq) {
		refreshTokenService.deleteRefreshToken(refreshTokenReq.getRefreshToken());
		return new ResponseEntity<>("Refresh token deleted successfully", HttpStatus.OK);
	}

}
