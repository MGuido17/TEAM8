class Profile < ApplicationRecord
  belongs_to :user
  # has_one_attached :photo
  serialize :medical_condition, type: Array, coder: JSON
  serialize :mentalh_health_condition, type: Array, coder: JSON

  MEDICAL_CONDITION = ["Alzheimer's Disease", "Arthritis", "Asthma", "Cancer", "Cardiovascular Disease", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "COPD (Chronic Obstructive Pulmonary Disease)", "Crohn's Disease", "Diabetes", "Epilepsy", "Fibromyalgia", "Hypertension (High Blood Pressure)", "Hyperthyroidism", "Hypothyroidism", "Insomnia", "Multiple Sclerosis", "Obesity", "Osteoporosis", "Parkinson's Disease", "Rheumatoid Arthritis", "Stroke", "Ulcerative Colitis"]

  MENTAL_HEALTH_CONDITION = ["Anxiety Disorders", "Bipolar Disorder", "Depression", "Post-Traumatic Stress Disorder (PTSD)", "Schizophrenia"]
end
