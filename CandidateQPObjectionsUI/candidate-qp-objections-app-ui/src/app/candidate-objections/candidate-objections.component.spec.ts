import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CandidateObjectionsComponent } from './candidate-objections.component';

describe('CandidateObjectionsComponent', () => {
  let component: CandidateObjectionsComponent;
  let fixture: ComponentFixture<CandidateObjectionsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CandidateObjectionsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CandidateObjectionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
