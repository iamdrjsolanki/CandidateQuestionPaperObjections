package com.iamdrjsolanki.cqpo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iamdrjsolanki.cqpo.model.UserProfile;

@Repository
public interface UserProfileRepository extends JpaRepository<UserProfile, Long> {
	
	UserProfile findByUsername(String username);

}
