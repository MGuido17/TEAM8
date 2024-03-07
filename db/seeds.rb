puts "Cleaning database..."
Activity.destroy_all
User.destroy_all
puts "Creating users..."

# Create users arrays
users = [
  { first_name: "Francisco", last_name: "Posada", email: "ciscotomaramo@gmail.com", password: "password", age: 30 },
  { first_name: "Valeria", last_name: "Lezcano",  email: "msvalerialg@gmail.com", password: "password", age: 30 },
  { first_name: "Martin", last_name: "Guido", email: "martin.guido.r17@gmail.com", password: "password", age: 30 },
  { first_name: "Nicolas", last_name: "Otatti", email: "ottatinicolas91@gmail.com", password: "password", age: 30 }
]

created_users = []

users.each do |user|
  new_user = User.create!(
    first_name: user[:first_name],
    last_name: user[:last_name],
    email: user[:email],
    password: user[:password],
    age: user[:age]
  )
  
  created_users << new_user
end

puts "Created #{User.count} users"

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

neutral_conditions = medical_conditions - ["Rheumatoid Arthritis", "Cancer", "Chronic Fatigue Syndrome", "Cardiovascular Disease", "Arthritis", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Chronic Kidney Disease", "Schizophrenia", "Fibromyalgia", "Epilepsy", "Obesity"]

Activity.create!(
   name: "Crossfit",
   recommended_conditions: ["Obesity"],
   not_recommended_conditions: ["Rheumatoid Arthritis", "Cancer", "Chronic Fatigue Syndrome", "Cardiovascular Disease", "Arthritis", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Chronic Kidney Disease", "Schizophrenia", "Fibromyalgia", "Epilepsy"],
   neutral_conditions: [],
   user: created_users.sample,
   address: "Carrer de Arago 224",
   location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Box",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "Passeig de Gracia",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Football",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Basketball",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Wrestling",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Martial Arts",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Rugby",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"]

Activity.create!(
  name: "Rowing",
  recommended_conditions: ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia", "Cancer"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"]

Activity.create!(
  name: "Elliptical Training",
  recommended_conditions: ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Osteoporosis", "Asthma", "Chronic Pain Syndromes", "COPD (Chronic Obstructive Pulmonary Disease)", "Fibromyalgia", "Hypertension (High Blood Pressure)", "Schizophrenia", "Alzheimer's Disease", "Epilepsy", "Chronic Kidney Disease", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Insomnia", "Cancer"]

Activity.create!(
  name: "Walking",
  recommended_conditions: ["Cardiovascular Disease", "Osteoporosis", "Asthma", "Chronic Pain Syndromes", "COPD (Chronic Obstructive Pulmonary Disease)", "Fibromyalgia", "Hypertension (High Blood Pressure)", "Schizophrenia", "Alzheimer's Disease", "Epilepsy", "Chronic Kidney Disease", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Insomnia", "Cancer"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Osteoporosis", "Depression", "Osteoporosis", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"]

Activity.create!(
  name: "Dancing",
  recommended_conditions: ["Osteoporosis", "Depression", "Osteoporosis", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Arthritis", "Asthma", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

Activity.create!(
  name: "Aerobic Classes",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

Activity.create!(
  name: "Hiking",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Arthritis", "Asthma", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

Activity.create!(
  name: "Swimming",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Arthritis", "Asthma", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

Activity.create!(
  name: "Jogging",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Diabetes", "Arthritis", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

Activity.create!(
  name: "Cycling",
  recommended_conditions: ["Diabetes", "Arthritis", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Diabetes", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"] - ["Arthritis", "Rheumatoid Arthritis"]

Activity.create!(
  name: "Running",
  recommended_conditions: ["Diabetes", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Depression", "Bipolar Disorder", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Insomnia", "Rheumatoid Arthritis", "Fibromyalgia", "Chronic Pain Syndromes", "Parkinson's Disease", "Multiple Sclerosis", "Alzheimer's Disease", "Depression", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Pain Syndromes", "Stroke", "Chronic Kidney Disease", "Hypothyroidism"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis", "Schizophrenia", "Cardiovascular Disease", "Hypertension (High Blood Pressure)", "Chronic Fatigue Syndrome", "Epilepsy"]

Activity.create!(
  name: "Climbing",
  recommended_conditions:["Depression", "Bipolar Disorder", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Insomnia", "Rheumatoid Arthritis", "Fibromyalgia", "Chronic Pain Syndromes", "Parkinson's Disease", "Multiple Sclerosis", "Alzheimer's Disease", "Depression", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Pain Syndromes", "Stroke", "Chronic Kidney Disease", "Hypothyroidism"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis", "Schizophrenia", "Cardiovascular Disease", "Hypertension (High Blood Pressure)", "Chronic Fatigue Syndrome", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"]

Activity.create!(
  name: "Tenis",
  recommended_conditions: ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"]

Activity.create!(
  name: "Padel",
  recommended_conditions: ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Diabetes", "Osteoporosis", "Chronic Pain Syndrome", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cancer", "Alzheimer's Disease", "Rheumatoid Arthritis"] - ["Epilepsy"]

Activity.create!(
  name: "Gym Session",
  recommended_conditions: ["Diabetes", "Osteoporosis", "Chronic Pain Syndrome", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cancer", "Alzheimer's Disease", "Rheumatoid Arthritis"],
  not_recommended_conditions: ["Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Obesity", "Hypertension (High Blood Pressure)", "Epilepsy", "Osteoporosis", "Diabetes", "Asthma", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Anxiety Disorders", "Bipolar Disorder",  "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Stroke", "Chronic Pain Syndrome", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Fibromyalgia", "Chronic Fatigue Syndrome"]

Activity.create!(
  name: "High Intensity Interval Training (HIIT)",
  recommended_conditions: ["Obesity", "Hypertension (High Blood Pressure)"],
  not_recommended_conditions: ["Epilepsy", "Osteoporosis", "Diabetes", "Asthma", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Anxiety Disorders", "Bipolar Disorder",  "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Stroke", "Chronic Pain Syndrome", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Fibromyalgia", "Chronic Fatigue Syndrome"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"]

Activity.create!(
  name: "Yoga",
  recommended_conditions: ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

neutral_conditions = medical_conditions - ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"]

Activity.create!(
  name: "Taichi",
  recommended_conditions: ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España"
)

puts "Created #{Activity.count} activities"
