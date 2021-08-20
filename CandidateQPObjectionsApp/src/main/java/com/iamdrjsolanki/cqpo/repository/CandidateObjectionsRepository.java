package com.iamdrjsolanki.cqpo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.iamdrjsolanki.cqpo.model.CandidateObjectionDetails;

@Repository
public interface CandidateObjectionsRepository extends JpaRepository<CandidateObjectionDetails, Long> {

	@Modifying
	@Query("update CandidateObjectionDetails cod set cod.codSubmitted = ?1 where cod.codCandidateId = ?2 and "
			+ "cod.codSubjectId = ?3 and cod.codQuestionId = ?4 and cod.codQuestionNumber = ?5")
	void updateCandidateObjectionsToSubmit(boolean submitted, Long candidateId, Long subjectId, 
			Long questionId, Long questionNumber);

	List<CandidateObjectionDetails> findAllByCodCandidateId(Long candidateId);

}
