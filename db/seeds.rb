# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users arrays
users = [
  { email: "ciscotomaramo@gmail.com", password: "password" },
  { email: "msvalerialg@gmail.com", password: "password" },
  { email: "martin.guido.r17@gmail.com", password: "password" },
  { email: "ottatinicolas91@gmail.com", password: "password" }

]

created_users = []
users.each do |user|
  User.create(
    first_name: user[:first_name],
    last_name: user[:last_name],
    email: user[:email],
    password: user[:password]
  )
  created_users << user
  created_users.save!
end

# Create an array of medical conditions
medical_conditions = [
  "Alzheimer's Disease", "Anxiety Disorders", "Arthritis", "Asthma", "Bipolar Disorder", "Cancer", "Cardiovascular Disease", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "COPD (Chronic Obstructive Pulmonary Disease)", "Crohn's Disease", "Depression", "Diabetes", "Epilepsy", "Fibromyalgia", "Hypertension (High Blood Pressure)", "Hyperthyroidism", "Hypothyroidism", "Insomnia", "Multiple Sclerosis", "Obesity", "Osteoporosis", "Parkinson's Disease", "Post-Traumatic Stress Disorder (PTSD)", "Rheumatoid Arthritis", "Schizophrenia", "Stroke", "Ulcerative Colitis"
]

# neutral_conditions = medical_conditions.reject { |condition| recommended_conditions.include?(condition) }

# Activity.create!(
#   name: "",
#   recommended_conditions: [],
#   not_recommended_conditions: [],
#   neutral_conditions: [],
#   description: "",
#   date: "",
#   organiser: "",
#   attendees: "",
#   spaces: "",
#   private: ""
# )

Activity.create!(
  name: "Crossfit",
  recommended_conditions: [],
  not_recommended_conditions: ["Rheumatoid Arthritis", "Cancer", "Chronic Fatigue Syndrome", "Cardiovascular Disease", "Arthritis", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Chronic Kidney Disease", "Schizophrenia", "Fibromyalgia", "Epilepsy"],
  neutral_conditions: medical_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Box",
  recommended_conditions: [],
  not_recommended: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: medical_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Football",
  recommended_conditions: [],
  not_recommended: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: medical_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Basketball",
  recommended_conditions: [],
  not_recommended: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: medical_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Wrestling",
  recommended_conditions: [],
  not_recommended: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: medical_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Martial Arts",
  recommended_conditions: [],
  not_recommended: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: medical_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Rugby",
  recommended_conditions: [],
  not_recommended: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: medical_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Rowing",
  recommended_conditions: ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia", "Cancer"],
  neutral_conditions: medical_conditions - recommended_conditions,
  not_recommended: [],
  user: created_users.sample
)

Activity.create!(
  name: "Elliptical Training",
  recommended_conditions: ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: medical_conditions - recommended_conditions,
  not_recommended: [],
  user: created_users.sample
)

Activity.create!(
  name: "Walking",
  recommended_conditions: ["Cardiovascular Disease", "Osteoporosis", "Asthma", "Chronic Pain Syndromes", "COPD (Chronic Obstructive Pulmonary Disease)", "Fibromyalgia", "Hypertension (High Blood Pressure)", "Schizophrenia", "Alzheimer's Disease", "Epilepsy", "Chronic Kidney Disease", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Insomnia", "Cancer"],
  neutral_conditions: medical_conditions - recommended_conditions,
  not_recommended_conditions: [],
  user: created_users.sample
)
Activity.create!(
  name: "Dancing",
  recommended_conditions: ["Osteoporosis", "Depression", "Osteoporosis", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: medical_conditions - recommended_conditions,
  not_recommended: [],
  user: created_users.sample
)

Activity.create!(
  name: "Aerobic Classes",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: medical_conditions - recommended_conditions,
  not_recommended: [],
  user: created_users.sample
)

Activity.create!(
  name: "Hiking",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: medical_conditions - recommended_conditions,
  not_recommended: [],
  user: created_users.sample
)

Activity.create!(
  name: "Swimming",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Arthritis", "Asthma", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: medical_conditions - recommended_conditions,
  not_recommended_conditions: [],
  user: created_users.sample
)

Activity.create!(
  name: "Jogging",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: medical_conditions - recommended_conditions,
  not_recommended_conditions: [],
  user: created_users.sample
)

Activity.create!(
  name: "Cycling",
  recommended_conditions: ["Diabetes", "Arthritis", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: medical_conditions - recommended_conditions,
  not_recommended_conditions: [],
  user: created_users.sample
)

Activity.create!(
  name: "Running",
  recommended_conditions: ["Diabetes", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis"],
  neutral_conditions: medical_conditions - recommended_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Climbing",
  recommended_conditions:["Depression", "Bipolar Disorder", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Insomnia", "Rheumatoid Arthritis", "Fibromyalgia", "Chronic Pain Syndromes", "Parkinson's Disease", "Multiple Sclerosis", "Alzheimer's Disease", "Depression", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Pain Syndromes", "Stroke", "Chronic Kidney Disease", "Hypothyroidism"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis", "Schizophrenia", "Cardiovascular Disease", "Hypertension (High Blood Pressure)", "Chronic Fatigue Syndrome", "Epilepsy"],
  neutral_conditions: medical_conditions - recommended_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Tenis",
  recommended_conditions: ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"],
  neutral_conditions: medical_conditions - recommended_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Padel",
  recommended_conditions: ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"],
  neutral_conditions: medical_conditions - recommended_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Gym Session",
  recommended_conditions: ["Diabetes", "Osteoporosis", "Chronic Pain Syndrome", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cancer", "Alzheimer's Disease", "Rheumatoid Arthritis"],
  not_recommended_conditions: ["Epilepsy"],
  neutral_conditions: medical_conditions - recommended_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "High Intensity Interval Training (HIIT)",
  recommended_conditions: ["Obesity", "Hypertension (High Blood Pressure)"],
  not_recommended_conditions: ["Epilepsy", "Osteoporosis", "Diabetes", "Asthma", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Anxiety Disorders", "Bipolar Disorder",  "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Stroke", "Chronic Pain Syndrome", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Fibromyalgia", "Chronic Fatigue Syndrome"],
  neutral_conditions: medical_conditions - recommended_conditions - not_recommended_conditions,
  user: created_users.sample
)

Activity.create!(
  name: "Yoga",
  recommended_conditions: ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"],
  neutral_conditions: medical_conditions - recommended_conditions,
  not_recommended_conditions: [],
  user: created_users.sample
)

Activity.create!(
  name: "Taichi",
  recommended_conditions: ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"],
  neutral_conditions: medical_conditions - recommended_conditions,
  not_recommended_conditions: [],
  user: created_users.sample
)
