package com.iamdrjsolanki.cqpo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iamdrjsolanki.cqpo.model.UserProfile;
import com.iamdrjsolanki.cqpo.repository.UserProfileRepository;

@Service
public class UserProfileService {
	
	@Autowired
	private UserProfileRepository userProfileRepository;
	
	public UserProfile getUserProile(String username) {
		return userProfileRepository.findByUsername(username);
	}

}
