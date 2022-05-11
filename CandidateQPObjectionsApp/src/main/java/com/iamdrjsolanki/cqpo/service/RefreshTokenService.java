package com.iamdrjsolanki.cqpo.service;

import java.time.Instant;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.iamdrjsolanki.cqpo.model.RefreshToken;
import com.iamdrjsolanki.cqpo.repository.RefreshTokenRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
@Transactional
public class RefreshTokenService {
	
	private final RefreshTokenRepository refreshTokenRepo;
	
	public RefreshToken generateRefreshToken() {
		RefreshToken refreshToken = new RefreshToken();
		refreshToken.setToken(UUID.randomUUID().toString());
		refreshToken.setCreatedDate(Instant.now());
		
		return refreshTokenRepo.save(refreshToken);
	}
	
	public void validateRefreshToken(String token) {
		refreshTokenRepo.findByToken(token);
	}
	
	public void deleteRefreshToken(String token) {
		refreshTokenRepo.deleteByToken(token);
	}

}
