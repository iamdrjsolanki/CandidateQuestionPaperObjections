package com.iamdrjsolanki.cqpo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.iamdrjsolanki.cqpo.model.CandidateObjectionDetails;
import com.iamdrjsolanki.cqpo.repository.CandidateObjectionsRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CandidateObjectionsService {
	
	private final CandidateObjectionsRepository coRepo;
	
	public List<CandidateObjectionDetails> getAllObjections() {
		return coRepo.findAll();
	}

	@Transactional
	public void saveCandidateObjections(List<CandidateObjectionDetails> codList) {
		for(CandidateObjectionDetails cod : codList) {
			coRepo.save(cod);
		}
	}

	@Transactional
	public void submitCandidateObjections(List<CandidateObjectionDetails> codList) {
		for(CandidateObjectionDetails cod : codList) {
			coRepo.updateCandidateObjectionsToSubmit(cod.isCodSubmitted(), cod.getCodCandidateId(), 
					cod.getCodSubjectId(), cod.getCodQuestionId(), cod.getCodQuestionNumber());
		}
	}

	public List<CandidateObjectionDetails> getObjectionsByCandidateId(Long candidateId) {
		return coRepo.findAllByCodCandidateId(candidateId);
	}

}
