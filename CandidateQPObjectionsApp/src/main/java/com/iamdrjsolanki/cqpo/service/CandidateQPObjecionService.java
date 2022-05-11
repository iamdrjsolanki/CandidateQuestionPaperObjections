package com.iamdrjsolanki.cqpo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.iamdrjsolanki.cqpo.dto.CandidateEnrollmentDetailsDTO;
import com.iamdrjsolanki.cqpo.dto.QuestionPaperDetailsDTO;
import com.iamdrjsolanki.cqpo.dto.SubjectDetailsDTO;
import com.iamdrjsolanki.cqpo.model.CandidateEnrollmentDetails;
import com.iamdrjsolanki.cqpo.repository.CandidateEnrollmentDetailsRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CandidateQPObjecionService {

	private final CandidateEnrollmentDetailsRepository cedRepo;

	public CandidateEnrollmentDetailsDTO getCandidateDetails(String username) {
		CandidateEnrollmentDetails ced = cedRepo.findByCedRollNo(username);

		CandidateEnrollmentDetailsDTO cedDto = new CandidateEnrollmentDetailsDTO();
		cedDto.setCedCandidateName(ced.getCedCandidateName());
		cedDto.setCedExamTime(ced.getCedExamTime());
		cedDto.setCedFromExamDate(ced.getCedFromExamDate());
		cedDto.setCedToExamDate(ced.getCedToExamDate());
		cedDto.setCedId(ced.getCedId());
		cedDto.setCedRollNo(ced.getCedRollNo());
		cedDto.setSubjects(getSubjects(ced));
		cedDto.setQuestions(getQuestions(ced));
		cedDto.setSubjectsQuestionsMap(getSubjectQuestionsMap(cedDto.getQuestions()));

		return cedDto;
	}

	private List<SubjectDetailsDTO> getSubjects(CandidateEnrollmentDetails ced) {
		List<SubjectDetailsDTO> subjects = new ArrayList<>();
		for (int i = 0; i < ced.getSubjects().size(); i++) {
			SubjectDetailsDTO subject = new SubjectDetailsDTO();
			subject.setSdId(ced.getSubjects().get(i).getSdId());
			subject.setSubjectName(ced.getSubjects().get(i).getSubjectName());
			subjects.add(subject);
		}
		return subjects;
	}
	
	private List<QuestionPaperDetailsDTO> getQuestions(CandidateEnrollmentDetails ced) {
		List<QuestionPaperDetailsDTO> questions = new ArrayList<>();
		for (int i = 0; i < ced.getQuestions().size(); i++) {
			QuestionPaperDetailsDTO question = new QuestionPaperDetailsDTO();
			question.setQpdId(ced.getQuestions().get(i).getQpdId());
			question.setQpdQuestion(ced.getQuestions().get(i).getQpdQuestion());
			question.setQpdMarksAllotted(ced.getQuestions().get(i).getQpdMarksAllotted());
			question.setQpdQuestionNumber(ced.getQuestions().get(i).getQpdQuestionNumber());
			question.setQpdQuestionAnswerOption1(ced.getQuestions().get(i).getQpdQuestionAnswerOption1());
			question.setQpdQuestionAnswerOption2(ced.getQuestions().get(i).getQpdQuestionAnswerOption2());
			question.setQpdQuestionAnswerOption3(ced.getQuestions().get(i).getQpdQuestionAnswerOption3());
			question.setQpdQuestionAnswerOption4(ced.getQuestions().get(i).getQpdQuestionAnswerOption4());
			question.setQpdQuestionCorrectAnswer(ced.getQuestions().get(i).getQpdQuestionCorrectAnswer());
			question.setQpdSubjectName(ced.getQuestions().get(i).getSubjectDetails().getSubjectName());
			
			questions.add(question);
		}
		return questions;
	}
	
	private Map<String, QuestionPaperDetailsDTO> 
		getSubjectQuestionsMap(List<QuestionPaperDetailsDTO> questions) {
		
		Map<String, QuestionPaperDetailsDTO> subjectsQuestionsMap = new HashMap<>();
		for(int i=0; i<questions.size(); i++) {
			String key = questions.get(i).getQpdSubjectName() + "^" + questions.get(i).getQpdQuestionNumber();
			subjectsQuestionsMap.put(key, questions.get(i));
		}
		return subjectsQuestionsMap;
	}

}
