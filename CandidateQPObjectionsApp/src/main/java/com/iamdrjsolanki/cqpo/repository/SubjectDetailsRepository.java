package com.iamdrjsolanki.cqpo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iamdrjsolanki.cqpo.model.SubjectDetails;

@Repository
public interface SubjectDetailsRepository extends JpaRepository<SubjectDetails, Long> {
	
	
}
