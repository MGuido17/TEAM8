puts "Cleaning database..."
Attendee.destroy_all
Bookmark.destroy_all
MatchUser.destroy_all
Profile.destroy_all
Review.destroy_all
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
genders = ["Male", "Female"]
contact_phone_numbers = ["37648746587", "7654873465786348", "4657836478653"]
contact_addresses = ["carrer de balmes", "carrer de aguar", "carrer de gracia"]
blood_types = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"]
allergies = ["coconut", "peanuts", "penicilin"]
medical_conditions = ["Alzheimer's Disease", "Arthritis", "Asthma", "Cancer", "Cardiovascular Disease", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "COPD (Chronic Obstructive Pulmonary Disease)", "Crohn's Disease", "Diabetes", "Epilepsy", "Fibromyalgia", "Hypertension (High Blood Pressure)", "Hyperthyroidism", "Hypothyroidism", "Insomnia", "Multiple Sclerosis", "Obesity", "Osteoporosis", "Parkinson's Disease", "Rheumatoid Arthritis", "Stroke", "Ulcerative Colitis"]
mental_health_conditions = ["Anxiety Disorders", "Bipolar Disorder", "Depression", "Post-Traumatic Stress Disorder (PTSD)", "Schizophrenia"]
emergency_contact_names = ["Valeria", "Francisco", "Martin", "Nico"]
emergency_contact_phones = ["34236723762", "485376578346", "456873645783"]
emergency_contact_relationships = ["partner", "parent", "sibling"]


users.each do |user|
  new_user = User.create!(
    first_name: user[:first_name],
    last_name: user[:last_name],
    email: user[:email],
    password: user[:password],
    age: user[:age]
  )
  Profile.create!(
    user: new_user,
    gender: genders.sample,
    contact_phone_number: contact_phone_numbers.sample,
    contact_address: contact_addresses.sample,
    blood_type: blood_types.sample,
    allergies: allergies.sample,
    medical_condition: [medical_conditions.sample],
    mental_health_condition: [mental_health_conditions.sample],
    emergency_contact_name: emergency_contact_names.sample,
    emergency_contact_phone: emergency_contact_phones.sample,
    emergency_contact_relationship: emergency_contact_relationships.sample
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
   location: "Barcelona, España",
   description: "Crossfit is a high-intensity fitness program that incorporates elements from various sports and types of exercise.",
   date: "2024-03-10",
   spaces: 20
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Box",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "Passeig de Gracia",
  location: "Barcelona, España",
  description: "Boxing is a combat sport that involves high-intensity training and cardiovascular exercise.",
  date: "2024-03-11",
  spaces: 15
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Football",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Football is a team sport that involves running, kicking, and passing a ball.",
  date: "2024-03-20",
  spaces: 22
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Basketball",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Basketball is a fast-paced sport played between two teams, each consisting of five players. The objective is to score points by shooting the ball through the opponent's hoop while preventing them from doing so. It involves running, jumping, and quick changes in direction.",
  date: "2024-03-21",
  spaces: 20
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Wrestling",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Wrestling is a combat sport involving grappling techniques such as clinch fighting, throws, takedowns, joint locks, and pins. It requires strength, agility, and strategy. Wrestlers compete to control and pin their opponent's shoulders to the ground, typically performed on a mat.",
  date: "2024-03-21",
  spaces: 15
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Martial Arts",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Martial arts encompass various combat and self-defense practices originating from different cultures and traditions. These disciplines emphasize physical fitness, mental focus, and self-discipline. Examples include karate, judo, taekwondo, kung fu, and Brazilian jiu-jitsu.",
  date: "2024-03-21",
  spaces: 20
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

Activity.create!(
  name: "Rugby",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Rugby is a full-contact team sport that originated in England in the 19th century. It is played with an oval-shaped ball on a rectangular field and involves tackling opponents to gain possession of the ball and score points by carrying it over the opponent's goal line or kicking it through the goalposts.",
  date: "2024-03-25",
  spaces: 30
)

neutral_conditions = medical_conditions - ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"]

Activity.create!(
  name: "Rowing",
  recommended_conditions: ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia", "Cancer"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Rowing, also known as crew, is a water sport where individuals or teams propel a boat through water using oars. It provides a full-body workout, engaging muscles in the arms, legs, and core. Rowing is often practiced in calm waters such as lakes or rivers, and it can be both a recreational and competitive activity.",
  date: "2024-04-10",
  spaces: 20
)

neutral_conditions = medical_conditions - ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"]

Activity.create!(
  name: "Elliptical Training",
  recommended_conditions: ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Elliptical training is a low-impact cardiovascular exercise performed on an elliptical machine. It simulates activities like walking, running, and climbing stairs without causing excessive stress on the joints. It's suitable for individuals looking to improve cardiovascular health, burn calories, and strengthen muscles in the lower body.",
  date: "2024-04-12",
  spaces: 15
)

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Osteoporosis", "Asthma", "Chronic Pain Syndromes", "COPD (Chronic Obstructive Pulmonary Disease)", "Fibromyalgia", "Hypertension (High Blood Pressure)", "Schizophrenia", "Alzheimer's Disease", "Epilepsy", "Chronic Kidney Disease", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Insomnia", "Cancer"]

Activity.create!(
  name: "Walking",
  recommended_conditions: ["Cardiovascular Disease", "Osteoporosis", "Asthma", "Chronic Pain Syndromes", "COPD (Chronic Obstructive Pulmonary Disease)", "Fibromyalgia", "Hypertension (High Blood Pressure)", "Schizophrenia", "Alzheimer's Disease", "Epilepsy", "Chronic Kidney Disease", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Insomnia", "Cancer"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Walking is one of the simplest and most effective forms of exercise. It can be done anywhere and requires no special equipment. Walking regularly can improve cardiovascular health, strengthen bones, alleviate symptoms of asthma, relieve chronic pain, and reduce the risk of many chronic diseases. It's also a great way to clear the mind, reduce stress, and improve overall well-being.",
  date: "2024-07-03",
  spaces: 20
)

neutral_conditions = medical_conditions - ["Osteoporosis", "Depression", "Osteoporosis", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"]

Activity.create!(
  name: "Dancing",
  recommended_conditions: ["Osteoporosis", "Depression", "Osteoporosis", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Walking is a simple yet effective form of exercise that can be done almost anywhere. It offers numerous health benefits, including improved cardiovascular fitness, strengthened bones, reduced body fat, and enhanced mental well-being. It's suitable for people of all ages and fitness levels.",
  date: "2024-04-15",
  spaces: 20
)

neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Arthritis", "Asthma", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

Activity.create!(
  name: "Aerobic Classes",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Aerobic classes are dynamic and energetic workouts that combine rhythmic movements with music. These classes typically include various exercises such as running, jumping, and kicking to improve cardiovascular fitness, flexibility, and overall strength. They are suitable for individuals looking to burn calories, improve endurance, and have fun while exercising.",
  date: "2024-04-20",
  spaces: 15
)

neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

Activity.create!(
  name: "Hiking",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Hiking involves walking in natural environments, typically on trails or paths in the countryside or mountains. It offers numerous health benefits such as improving cardiovascular fitness, strengthening muscles, reducing stress, and enhancing mental well-being. Hiking is suitable for individuals of all ages and fitness levels, providing an enjoyable way to explore nature and stay active.",
  date: "2024-04-21",
  spaces: 20
)

neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Arthritis", "Asthma", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

Activity.create!(
  name: "Swimming",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Arthritis", "Asthma", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Swimming is a low-impact aerobic exercise that involves moving through water using various strokes. It provides a full-body workout, improving cardiovascular health, muscle strength, and endurance. Swimming is suitable for individuals of all ages and fitness levels, offering a refreshing way to stay active and cool off during hot weather.",
  date: "2024-05-05",
  spaces: 15
)

neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

Activity.create!(
  name: "Jogging",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Jogging is a form of running at a slow, steady pace. It's an excellent cardiovascular exercise that helps improve endurance, strengthen muscles, and burn calories. Jogging can be done almost anywhere and requires minimal equipment, making it a convenient and accessible workout option for many people.",
  date: "2024-05-10",
  spaces: 20
)

neutral_conditions = medical_conditions - ["Diabetes", "Arthritis", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

Activity.create!(
  name: "Cycling",
  recommended_conditions: ["Diabetes", "Arthritis", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Cycling is a low-impact exercise that provides a great cardiovascular workout while being gentle on the joints. It can be done indoors on a stationary bike or outdoors on roads or trails. Cycling helps improve cardiovascular health, muscle strength, and endurance. It's also a convenient mode of transportation and a fun recreational activity.",
  date: "2024-05-15",
  spaces: 15
)

neutral_conditions = medical_conditions - ["Diabetes", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"] - ["Arthritis", "Rheumatoid Arthritis"]

Activity.create!(
  name: "Running",
  recommended_conditions: ["Diabetes", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Running is a high-impact aerobic exercise that involves moving at a fast pace, typically faster than a walk or jog. It can be done outdoors or on a treadmill indoors. Running helps improve cardiovascular health, build endurance, and burn calories. It's a popular form of exercise for people looking to lose weight, improve fitness levels, or train for races.",
  date: "2024-05-20",
  spaces: 20
)

neutral_conditions = medical_conditions - ["Depression", "Bipolar Disorder", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Insomnia", "Rheumatoid Arthritis", "Fibromyalgia", "Chronic Pain Syndromes", "Parkinson's Disease", "Multiple Sclerosis", "Alzheimer's Disease", "Depression", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Pain Syndromes", "Stroke", "Chronic Kidney Disease", "Hypothyroidism"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis", "Schizophrenia", "Cardiovascular Disease", "Hypertension (High Blood Pressure)", "Chronic Fatigue Syndrome", "Epilepsy"]

Activity.create!(
  name: "Climbing",
  recommended_conditions:["Depression", "Bipolar Disorder", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Insomnia", "Rheumatoid Arthritis", "Fibromyalgia", "Chronic Pain Syndromes", "Parkinson's Disease", "Multiple Sclerosis", "Alzheimer's Disease", "Depression", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Pain Syndromes", "Stroke", "Chronic Kidney Disease", "Hypothyroidism"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis", "Schizophrenia", "Cardiovascular Disease", "Hypertension (High Blood Pressure)", "Chronic Fatigue Syndrome", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Climbing is a challenging sport that involves ascending steep rock faces or indoor climbing walls using various techniques and equipment. It provides a full-body workout, improving strength, flexibility, and coordination. Climbing also offers mental benefits such as problem-solving and overcoming fears. It's suitable for individuals seeking adventure and a unique way to stay fit.",
  date: "2024-06-10",
  spaces: 15
)

neutral_conditions = medical_conditions - ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"]

Activity.create!(
  name: "Tenis",
  recommended_conditions: ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Tennis is a fast-paced sport played individually against a single opponent (singles) or between two teams of two players each (doubles). It involves hitting a felt-covered rubber ball over a net using a tennis racket. Tennis provides a full-body workout, improving cardiovascular health, strength, agility, and coordination. It's a popular recreational activity and competitive sport enjoyed by people of all ages.",
  date: "2024-06-15",
  spaces: 8
)

neutral_conditions = medical_conditions - ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"]

Activity.create!(
  name: "Padel",
  recommended_conditions: ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Padel is a racquet sport that combines elements of tennis and squash, played on a small court enclosed by walls. It is typically played in doubles format. Padel involves hitting a perforated ball back and forth over the net using solid paddles. The enclosed court and simplified rules make it accessible to players of all skill levels. Padel provides a cardiovascular workout while also enhancing agility, reflexes, and strategic thinking.",
  date: "2024-07-02",
  spaces: 4
)

neutral_conditions = medical_conditions - ["Diabetes", "Osteoporosis", "Chronic Pain Syndrome", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cancer", "Alzheimer's Disease", "Rheumatoid Arthritis"] - ["Epilepsy"]

Activity.create!(
  name: "Gym Session",
  recommended_conditions: ["Diabetes", "Osteoporosis", "Chronic Pain Syndrome", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cancer", "Alzheimer's Disease", "Rheumatoid Arthritis"],
  not_recommended_conditions: ["Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "A gym session typically involves a combination of cardiovascular exercises, strength training, and flexibility exercises. It is aimed at improving overall fitness, strength, and endurance. Participants may use various gym equipment such as treadmills, stationary bikes, weight machines, and free weights. Gym sessions are customizable to individual fitness levels and goals, making them suitable for a wide range of people.",
  date: "2024-07-03",
  spaces: 10
)

neutral_conditions = medical_conditions - ["Obesity", "Hypertension (High Blood Pressure)", "Epilepsy", "Osteoporosis", "Diabetes", "Asthma", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Anxiety Disorders", "Bipolar Disorder",  "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Stroke", "Chronic Pain Syndrome", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Fibromyalgia", "Chronic Fatigue Syndrome"]

Activity.create!(
  name: "High Intensity Interval Training (HIIT)",
  recommended_conditions: ["Obesity", "Hypertension (High Blood Pressure)"],
  not_recommended_conditions: ["Epilepsy", "Osteoporosis", "Diabetes", "Asthma", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Anxiety Disorders", "Bipolar Disorder",  "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Stroke", "Chronic Pain Syndrome", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Fibromyalgia", "Chronic Fatigue Syndrome"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "High Intensity Interval Training (HIIT) is a form of cardiovascular exercise characterized by short bursts of intense anaerobic exercise followed by brief recovery periods. It is known for its effectiveness in burning calories and improving cardiovascular health in a short amount of time. HIIT workouts can include exercises such as sprinting, jumping jacks, burpees, and mountain climbers. Participants should be in good physical condition and consult with a healthcare professional before starting HIIT.",
  date: "2024-07-03",
  spaces: 10
)

neutral_conditions = medical_conditions - ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"]

Activity.create!(
  name: "Yoga",
  recommended_conditions: ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Yoga is a mind-body practice that combines physical postures, breathing exercises, and meditation or relaxation. It is beneficial for improving flexibility, strength, and mental well-being. Participants of all levels can enjoy the benefits of yoga, including stress reduction and improved sleep quality.",
  date: "2024-07-03",
  spaces: 15
)

neutral_conditions = medical_conditions - ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"]

Activity.create!(
  name: "Taichi",
  recommended_conditions: ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Tai Chi, also known as Taiji, is a gentle form of martial art that involves slow, flowing movements and deep breathing. It is often described as meditation in motion, as it promotes relaxation, balance, and inner peace. Tai Chi can be practiced by people of all ages and fitness levels and is particularly beneficial for those seeking stress relief and improved physical and mental well-being.",
  date: "2024-07-03",
  spaces: 15
)

  puts "Created #{Activity.count} activities"
