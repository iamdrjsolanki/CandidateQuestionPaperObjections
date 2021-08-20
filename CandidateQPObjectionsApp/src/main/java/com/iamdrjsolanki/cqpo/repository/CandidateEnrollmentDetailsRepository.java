package com.iamdrjsolanki.cqpo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iamdrjsolanki.cqpo.model.CandidateEnrollmentDetails;

@Repository
public interface CandidateEnrollmentDetailsRepository extends JpaRepository<CandidateEnrollmentDetails, Long> {

	CandidateEnrollmentDetails findByCedRollNo(String username);

}
