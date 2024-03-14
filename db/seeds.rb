require 'open-uri'

puts "Cleaning database..."
Invite.destroy_all
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

activity1 = Activity.create!(
   name: "Crossfit",
   recommended_conditions: ["Obesity"],
   not_recommended_conditions: ["Rheumatoid Arthritis", "Cancer", "Chronic Fatigue Syndrome", "Cardiovascular Disease", "Arthritis", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Chronic Kidney Disease", "Schizophrenia", "Fibromyalgia", "Epilepsy"],
   neutral_conditions: [],
   user: created_users.sample,
   address: "Carrer de Arago 224",
   location: "Barcelona, España",
   description: "High-intensity fitness program that incorporates elements from various sports and types of exercise.",
   date: "2024-03-10",
   spaces: 20
)

activity1.photo.attach(io: File.open('app/assets/images/crossfit.png'), filename: 'crossift.png', content_type: 'image/png')

neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

activity2 = Activity.create!(
  name: "Box",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "Passeig de Gracia",
  location: "Barcelona, España",
  description: "Combat sport that involves high-intensity training and cardiovascular exercise.",
  date: "2024-03-11",
  spaces: 15
)

activity2.photo.attach(io: File.open("app/assets/images/boxing.png"), filename: "attachment_2", content_type: "image/png")


neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

activity3 = Activity.create!(
  name: "Football",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Team sport that involves running, kicking, and passing a ball.",
  date: "2024-03-20",
  spaces: 22
)

activity3.photo.attach(io: File.open("app/assets/images/football.png"), filename: "attachment_3", content_type: "image/png")


neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

activity4 = Activity.create!(
  name: "Basketball",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Fast-paced sport played between two teams, each consisting of five players. The objective is to score points by shooting the ball through the opponent's hoop while preventing them from doing so. It involves running, jumping, and quick changes in direction.",
  date: "2024-03-21",
  spaces: 20
)

activity4.photo.attach(io: File.open("app/assets/images/basketball.png"), filename: "attachment_4", content_type: "image/png")


neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

activity5 = Activity.create!(
  name: "Wrestling",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Combat sport involving grappling techniques such as clinch fighting, throws, takedowns, joint locks, and pins. It requires strength, agility, and strategy.",
  date: "2024-03-21",
  spaces: 15
)

activity5.photo.attach(io: File.open("app/assets/images/wrestling.png"), filename: "attachment_5", content_type: "image/png")


neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

activity6 = Activity.create!(
  name: "Martial Arts",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Encompass various combat and self-defense practices originating from different cultures and traditions. These disciplines emphasize physical fitness, mental focus, and self-discipline. Examples include karate, judo, taekwondo, kung fu, and Brazilian jiu-jitsu.",
  date: "2024-03-21",
  spaces: 20
)

activity6.photo.attach(io: File.open("app/assets/images/martial_arts.png"), filename: "attachment_6", content_type: "image/png")


neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"]

activity7 = Activity.create!(
  name: "Rugby",
  recommended_conditions: [],
  not_recommended_conditions: ["Cardiovascular Disease", "Cancer", "Chronic Fatigue Syndrome", "Chronic Kidney Disease", "Chronic Pain Syndromes", "Hypertension (High Blood Pressure)", "Osteoporosis", "Rheumatoid Arthritis", "Arthritis", "Osteoporosis", "Fibromyalgia", "Multiple Sclerosis", "Parkinson's Disease", "Schizophrenia", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Full-contact team sport, involves tackling opponents to gain possession of the ball and score points by carrying it over the opponent's goal line or kicking it through the goalposts.",
  date: "2024-03-25",
  spaces: 30
)

activity7.photo.attach(io: File.open("app/assets/images/rugby.png"), filename: "attachment_7", content_type: "image/png")


neutral_conditions = medical_conditions - ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"]

activity8 = Activity.create!(
  name: "Rowing",
  recommended_conditions: ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia", "Cancer"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Also known as crew, is a water sport where individuals or teams propel a boat through water using oars. It provides a full-body workout, engaging muscles in the arms, legs, and core. Rowing is often practiced in calm waters such as lakes or rivers, and it can be both a recreational and competitive activity.",
  date: "2024-04-10",
  spaces: 20
)

activity8.photo.attach(io: File.open("app/assets/images/rowing.png"), filename: "attachment_8", content_type: "image/png")


neutral_conditions = medical_conditions - ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"]

activity9 = Activity.create!(
  name: "Elliptical Training",
  recommended_conditions: ["COPD (Chronic Obstructive Pulmonary Disease)", "Multiple Sclerosis", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Crohn's Disease", "Ulcerative Colitis", "Chronic Pain Syndromes", "Fibromyalgia", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Is a low-impact cardiovascular exercise performed on an elliptical machine. It simulates activities like walking, running, and climbing stairs without causing excessive stress on the joints. It's suitable for individuals looking to improve cardiovascular health, burn calories, and strengthen muscles in the lower body.",
  date: "2024-04-12",
  spaces: 15
)

activity9.photo.attach(io: File.open("app/assets/images/elliptical_training.png"), filename: "attachment_9", content_type: "image/png")


neutral_conditions = medical_conditions - ["Cardiovascular Disease", "Osteoporosis", "Asthma", "Chronic Pain Syndromes", "COPD (Chronic Obstructive Pulmonary Disease)", "Fibromyalgia", "Hypertension (High Blood Pressure)", "Schizophrenia", "Alzheimer's Disease", "Epilepsy", "Chronic Kidney Disease", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Insomnia", "Cancer"]

activity10 = Activity.create!(
  name: "Walking",
  recommended_conditions: ["Cardiovascular Disease", "Osteoporosis", "Asthma", "Chronic Pain Syndromes", "COPD (Chronic Obstructive Pulmonary Disease)", "Fibromyalgia", "Hypertension (High Blood Pressure)", "Schizophrenia", "Alzheimer's Disease", "Epilepsy", "Chronic Kidney Disease", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Insomnia", "Cancer"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Is one of the simplest and most effective forms of exercise. It can be done anywhere and requires no special equipment. Improves cardiovascular health, strengthen bones, alleviate symptoms of asthma, relieve chronic pain, and reduce the risk of many chronic diseases. It's also a great way to clear the mind, reduce stress, and improve overall well-being.",
  date: "2024-07-03",
  spaces: 20
)

activity10.photo.attach(io: File.open("app/assets/images/walking.png"), filename: "attachment_10", content_type: "image/png")


neutral_conditions = medical_conditions - ["Osteoporosis", "Depression", "Osteoporosis", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"]

activity11 = Activity.create!(
  name: "Dancing",
  recommended_conditions: ["Osteoporosis", "Depression", "Osteoporosis", "Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Dynamic and energetic workouts that combine rhythmic movements with music. Involves cardiovascular improvement",
  date: "2024-04-15",
  spaces: 20
)


activity11.photo.attach(io: File.open("app/assets/images/dancing.png"), filename: "attachment_11", content_type: "image/png")

neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Arthritis", "Asthma", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

activity12 = Activity.create!(
  name: "Aerobic Classes",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Dynamic and energetic workouts that combine rhythmic movements with music. These classes typically include various exercises such as running, jumping, and kicking to improve cardiovascular fitness, flexibility, and overall strength.",
  date: "2024-04-20",
  spaces: 15
)

activity12.photo.attach(io: File.open("app/assets/images/aerobic.png"), filename: "attachment_12", content_type: "image/png")


neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

activity13 = Activity.create!(
  name: "Hiking",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hyperthyroidism", "Hypothyroidism", "Cancer", "Anxiety Disorders", "Bipolar Disorder", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Involves walking in natural environments, typically on trails or paths in the countryside or mountains. It offers numerous health benefits such as improving cardiovascular fitness, strengthening muscles, reducing stress, and enhancing mental well-being.",
  date: "2024-04-21",
  spaces: 20
)

activity13.photo.attach(io: File.open("app/assets/images/hiking.png"), filename: "attachment_13", content_type: "image/png")


neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Arthritis", "Asthma", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

activity14 = Activity.create!(
  name: "Swimming",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Arthritis", "Asthma", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Low-impact aerobic exercise that involves moving through water using various strokes. It provides a full-body workout, improving cardiovascular health, muscle strength, and endurance.",
  date: "2024-05-05",
  spaces: 15
)

activity14.photo.attach(io: File.open("app/assets/images/swimming.png"), filename: "attachment_14", content_type: "image/png")

neutral_conditions = medical_conditions - ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

activity15 = Activity.create!(
  name: "Jogging",
  recommended_conditions: ["Diabetes", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Is a form of running at a slow, steady pace. Jogging can be done almost anywhere and requires minimal equipment.",
  date: "2024-05-10",
  spaces: 20
)

activity15.photo.attach(io: File.open("app/assets/images/jogging.png"), filename: "attachment_15", content_type: "image/png")


neutral_conditions = medical_conditions - ["Diabetes", "Arthritis", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"]

activity16 = Activity.create!(
  name: "Cycling",
  recommended_conditions: ["Diabetes", "Arthritis", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Low-impact exercise that provides a great cardiovascular workout while being gentle on the joints. It can be done indoors on a stationary bike or outdoors on roads or trails. It's also a convenient mode of transportation and a fun recreational activity.",
  date: "2024-05-15",
  spaces: 15
)

activity16.photo.attach(io: File.open("app/assets/images/cycling.png"), filename: "attachment_16", content_type: "image/png")


neutral_conditions = medical_conditions - ["Diabetes", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"] - ["Arthritis", "Rheumatoid Arthritis"]

activity17 = Activity.create!(
  name: "Running",
  recommended_conditions: ["Diabetes", "Depression", "Chronic Kidney Disease", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cardiovascular Disease", "Cancer", "Bipolar Disorder", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "High-impact aerobic exercise that involves moving at a fast pace, typically faster than a walk or jog. It can be done outdoors or on a treadmill indoors.",
  date: "2024-05-20",
  spaces: 20
)

activity17.photo.attach(io: File.open("app/assets/images/running.png"), filename: "attachment_17", content_type: "image/png")


neutral_conditions = medical_conditions - ["Depression", "Bipolar Disorder", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Insomnia", "Rheumatoid Arthritis", "Fibromyalgia", "Chronic Pain Syndromes", "Parkinson's Disease", "Multiple Sclerosis", "Alzheimer's Disease", "Depression", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Pain Syndromes", "Stroke", "Chronic Kidney Disease", "Hypothyroidism"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis", "Schizophrenia", "Cardiovascular Disease", "Hypertension (High Blood Pressure)", "Chronic Fatigue Syndrome", "Epilepsy"]

activity18 = Activity.create!(
  name: "Climbing",
  recommended_conditions:["Depression", "Bipolar Disorder", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Epilepsy", "Insomnia", "Rheumatoid Arthritis", "Fibromyalgia", "Chronic Pain Syndromes", "Parkinson's Disease", "Multiple Sclerosis", "Alzheimer's Disease", "Depression", "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Pain Syndromes", "Stroke", "Chronic Kidney Disease", "Hypothyroidism"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis", "Schizophrenia", "Cardiovascular Disease", "Hypertension (High Blood Pressure)", "Chronic Fatigue Syndrome", "Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Challenging sport that involves ascending steep rock faces or indoor climbing walls using various techniques and equipment. Also offers mental benefits such as problem-solving and overcoming fears.",
  date: "2024-06-10",
  spaces: 15
)

activity18.photo.attach(io: File.open("app/assets/images/climbing.png"), filename: "attachment_18", content_type: "image/png")


neutral_conditions = medical_conditions - ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"]

activity19 = Activity.create!(
  name: "Tenis",
  recommended_conditions: ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Fast-paced sport played individually against a single opponent (singles) or between two teams of two players each (doubles). It involves hitting a felt-covered rubber ball over a net using a tennis racket.",
  date: "2024-06-15",
  spaces: 8
)

activity19.photo.attach(io: File.open("app/assets/images/tenis.png"), filename: "attachment_19", content_type: "image/png")


neutral_conditions = medical_conditions - ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"] - ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"]

activity20 = Activity.create!(
  name: "Padel",
  recommended_conditions: ["Diabetes", "Depression", "Hypothyroidism", "Hyperthyroidism", "Fibromyalgia", "Hypertension (High Blood Pressure)",  "Anxiety Disorders", "Post-Traumatic Stress Disorder (PTSD)", "Crohn's Disease", "Chronic Pain Syndromes", "Insomnia"],
  not_recommended_conditions: ["Arthritis", "Rheumatoid Arthritis", "Osteoporosis"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Racquet sport that combines elements of tennis and squash, played on a small court enclosed by walls. It is typically played in doubles format. Padel involves hitting a perforated ball back and forth over the net using solid paddles. The enclosed court and simplified rules make it accessible to players of all skill levels.",
  date: "2024-07-02",
  spaces: 4
)

activity20.photo.attach(io: File.open("app/assets/images/padel.png"), filename: "attachment_20", content_type: "image/png")


neutral_conditions = medical_conditions - ["Diabetes", "Osteoporosis", "Chronic Pain Syndrome", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cancer", "Alzheimer's Disease", "Rheumatoid Arthritis"] - ["Epilepsy"]

activity21 = Activity.create!(
  name: "Gym Session",
  recommended_conditions: ["Diabetes", "Osteoporosis", "Chronic Pain Syndrome", "Obesity", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Cancer", "Alzheimer's Disease", "Rheumatoid Arthritis"],
  not_recommended_conditions: ["Epilepsy"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Typically involves a combination of cardiovascular exercises, strength training, and flexibility exercises. Participants may use various gym equipment such as treadmills, stationary bikes, weight machines, and free weights. Gym sessions are customizable to individual fitness levels and goals, making them suitable for a wide range of people.",
  date: "2024-07-03",
  spaces: 10
)


activity21.photo.attach(io: File.open("app/assets/images/gym.png"), filename: "attachment_21", content_type: "image/png")

neutral_conditions = medical_conditions - ["Obesity", "Hypertension (High Blood Pressure)", "Epilepsy", "Osteoporosis", "Diabetes", "Asthma", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Anxiety Disorders", "Bipolar Disorder",  "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Stroke", "Chronic Pain Syndrome", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Fibromyalgia", "Chronic Fatigue Syndrome"]

activity22 = Activity.create!(
  name: "High Intensity Interval Training (HIIT)",
  recommended_conditions: ["Obesity", "Hypertension (High Blood Pressure)"],
  not_recommended_conditions: ["Epilepsy", "Osteoporosis", "Diabetes", "Asthma", "Parkinson's Disease", "Hypothyroidism", "Hyperthyroidism", "Anxiety Disorders", "Bipolar Disorder",  "Schizophrenia", "Post-Traumatic Stress Disorder (PTSD)", "Alzheimer's Disease", "Stroke", "Chronic Pain Syndrome", "Chronic Kidney Disease", "Rheumatoid Arthritis", "Chronic Fatigue Syndrome", "Crohn's Disease", "Ulcerative Colitis", "Fibromyalgia", "Chronic Fatigue Syndrome"],
  neutral_conditions: neutral_conditions,
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Is a form of cardiovascular exercise characterized by short bursts of intense anaerobic exercise followed by brief recovery periods. It is known for its effectiveness in burning calories and improving cardiovascular health in a short amount of time. HIIT workouts can include exercises such as sprinting, jumping jacks, burpees, and mountain climbers.",
  date: "2024-07-03",
  spaces: 10
)

activity22.photo.attach(io: File.open("app/assets/images/hiit.png"), filename: "attachment_22", content_type: "image/png")


neutral_conditions = medical_conditions - ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"]

activity23 = Activity.create!(
  name: "Yoga",
  recommended_conditions: ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Mind-body practice that combines physical postures, breathing exercises, and meditation or relaxation. It is beneficial for improving flexibility, strength, and mental well-being. Participants of all levels can enjoy the benefits of yoga, including stress reduction and improved sleep quality.",
  date: "2024-07-03",
  spaces: 15
)

activity23.photo.attach(io: File.open("app/assets/images/yoga.png"), filename: "attachment_23", content_type: "image/png")

neutral_conditions = medical_conditions - ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"]

activity24 = Activity.create!(
  name: "Taichi",
  recommended_conditions: ["Depression", "Fibromyalgia", "Anxiety Disorders", "Bipolar Disorder", "Post-Traumatic Stress Disorder (PTSD)", "Chronic Fatigue Syndrome", "Ulcerative Colitis", "Insonmia"],
  neutral_conditions: neutral_conditions,
  not_recommended_conditions: [],
  user: created_users.sample,
  address: "La Rambla",
  location: "Barcelona, España",
  description: "Also known as Taiji, is a gentle form of martial art that involves slow, flowing movements and deep breathing. It is often described as meditation in motion, as it promotes relaxation, balance, and inner peace.",
  date: "2024-07-03",
  spaces: 15
)

activity24.photo.attach(io: File.open("app/assets/images/taichi.png"), filename: "attachment_24", content_type: "image/png")


puts "Created #{Activity.count} activities"
