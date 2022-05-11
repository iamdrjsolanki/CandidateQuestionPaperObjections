import { CandidateEnrollmentDetails } from '../model/candidate-enrollment-details.model';

export interface LoginResponsePayload {
    username: string;
    role: string;
    jwt: string;
    expiresAt: Date;
    refreshToken: string;
    cedDto: CandidateEnrollmentDetails;
}