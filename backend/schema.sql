-- schema.sql
-- PostgreSQL schema for the LINEkUp application

-- Users Table: Stores information about all users, including students, freelancers, and employers.
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    line_user_id VARCHAR(255) UNIQUE NOT NULL,
    display_name VARCHAR(255), -- User's display name from their LINE profile
    picture_url TEXT, -- URL for the user's LINE profile picture
    status_message TEXT, -- User's status message from their LINE profile
    email VARCHAR(255) UNIQUE,
    role VARCHAR(50) NOT NULL CHECK (role IN ('student', 'freelancer', 'employer')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Profiles Table: Stores the professional profiles of users seeking opportunities.
CREATE TABLE profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER UNIQUE NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    summary TEXT, -- AI-generated professional summary
    full_text_resume TEXT, -- Raw text from an uploaded resume
    skills JSONB, -- e.g., ["JavaScript", "Graphic Design"]
    experience JSONB, -- e.g., [{"title": "Software Engineer", "company": "ABC Corp"}]
    education JSONB, -- e.g., [{"degree": "Bachelor of Science", "school": "XYZ University"}]
    preferences JSONB, -- e.g., {"location": "Bangkok", "job_type": "full-time"}
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Jobs Table: Stores job and internship opportunities posted by employers.
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY,
    employer_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255),
    required_skills JSONB,
    salary_range VARCHAR(100),
    job_type VARCHAR(50) NOT NULL CHECK (job_type IN ('full-time', 'part-time', 'internship', 'freelance')),
    status VARCHAR(50) NOT NULL DEFAULT 'open' CHECK (status IN ('open', 'closed', 'filled')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Applications Table: Tracks job applications made by users.
CREATE TABLE applications (
    id SERIAL PRIMARY KEY,
    job_id INTEGER NOT NULL REFERENCES jobs(id) ON DELETE CASCADE,
    applicant_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    status VARCHAR(50) NOT NULL DEFAULT 'applied' CHECK (status IN ('applied', 'viewed', 'shortlisted', 'rejected', 'accepted')),
    applied_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(job_id, applicant_id) -- Ensures a user can only apply to a job once
);

-- Chats Table: Manages chat sessions between employers and applicants.
CREATE TABLE chats (
    id SERIAL PRIMARY KEY,
    application_id INTEGER UNIQUE NOT NULL REFERENCES applications(id) ON DELETE CASCADE,
    employer_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    applicant_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Messages Table: Stores individual chat messages.
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    chat_id INTEGER NOT NULL REFERENCES chats(id) ON DELETE CASCADE,
    sender_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    sent_at TIMESTAMPTZ DEFAULT NOW()
);

-- Career Guidance Interactions Table: Logs interactions with the AI career guidance bot.
CREATE TABLE career_guidance_interactions (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    query TEXT NOT NULL,
    response TEXT NOT NULL,
    timestamp TIMESTAMPTZ DEFAULT NOW()
);

-- Create indexes for frequently queried columns to improve performance
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_jobs_location ON jobs(location);
CREATE INDEX idx_jobs_job_type ON jobs(job_type);
CREATE INDEX idx_applications_status ON applications(status);