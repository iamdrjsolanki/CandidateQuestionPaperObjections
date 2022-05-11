package com.iamdrjsolanki.cqpo.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.iamdrjsolanki.cqpo.model.CandidateObjectionDetails;
import com.iamdrjsolanki.cqpo.service.CandidateObjectionsService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api-objections")
public class CandidateObjectionsController {
	
	private final CandidateObjectionsService coService;
	
	@GetMapping("/objections")
	public ResponseEntity<?> getAllObjections() {
		return new ResponseEntity<List<CandidateObjectionDetails>>(coService.getAllObjections(), HttpStatus.OK);
	}
	
	@GetMapping("/objections/{candidateId}")
	public ResponseEntity<?> getCandidateObjections(@PathVariable("candidateId") Long candidateId) {
		return new ResponseEntity<List<CandidateObjectionDetails>>(coService.getObjectionsByCandidateId(candidateId), HttpStatus.OK);
	}
	
	@PostMapping("/save-objections")
	public ResponseEntity<?> saveCandidateObjections(@RequestBody List<CandidateObjectionDetails> codList) {
		coService.saveCandidateObjections(codList);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	@PostMapping("/submit-objections")
	public ResponseEntity<?> submitCandidateObjections(@RequestBody List<CandidateObjectionDetails> codList) {
		coService.submitCandidateObjections(codList);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}

}
