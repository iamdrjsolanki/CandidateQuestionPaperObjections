package com.iamdrjsolanki.cqpo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.iamdrjsolanki.cqpo.model.AuthenticationReponse;
import com.iamdrjsolanki.cqpo.model.AuthenticationRequest;
import com.iamdrjsolanki.cqpo.service.AuthenticationService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api-auth")
public class AuthenticationController {
	
	private final AuthenticationService authService;
	
	@GetMapping("/")
	public String testpage() {
		return "Test Page!";
	}
	
	@PostMapping("/authenticate")
	public AuthenticationReponse authenticate(@RequestBody AuthenticationRequest request) {
		return authService.authenticate(request);	
	}

}
