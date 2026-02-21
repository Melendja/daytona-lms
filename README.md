<div align="center">

# 🎓 Daytona College Class Module LMS

### Full-Stack Learning Management System — Alternative Presentation Platform

![Status](https://img.shields.io/badge/Status-In%20Progress-yellow)
![Module](https://img.shields.io/badge/Module-3%20In%20Work-green)
![Stack](https://img.shields.io/badge/Stack-React%20%7C%20Node.js%20%7C%20Azure%20SQL-blue)
![Budget](https://img.shields.io/badge/Azure%20Budget-%24100%20Student%20Credit-orange)

**Course:** Web Systems II – 521F SP26 ON  
**Developer:** Jose A. Melendez  
**Instructor:** Ronald Eaglin  
**Version:** 3.0 – Assignment 5 Submission  
**Last Updated:** 02/21/2026

</div>

---

## 📋 Table of Contents

1. [Executive Summary](#1-executive-summary--project-overview)
   - [Project Goals](#11-project-goals-and-objectives)
   - [Key Stakeholders](#12-key-stakeholders-and-their-roles)
   - [Business Value](#13-business-value-and-expected-outcomes)
   - [Timeline](#14-high-level-timeline)
   - [Critical Success Factors](#15-critical-success-factors)
2. [System Architecture](#2-system-architecture)
   - [Client-Side Architecture](#21-client-side-architecture)
   - [Server-Side Architecture](#22-server-side-architecture)
3. [Technology Stack](#3-technology-stack--programming-environment)
4. [Development Environment Setup Log](#4-development-environment-setup-log)
5. [Development Documentation Standards](#5-development-documentation-standards)
   - [Purpose and Overview](#51-purpose-and-overview)
   - [Complete Stack Elements & Connectors](#52-complete-stack-elements--connectors)
   - [Language and Coding Standards](#53-language-and-coding-standards)
   - [Code Conventions](#54-code-conventions)
   - [Project Directory Structure](#55-project-directory-structure)
   - [Code Modules and Object Overview](#56-code-modules-and-object-overview)
   - [Platform & Hosting — Developer Continuity Guide](#57-platform--hosting--developer-continuity-guide)
6. [UI/UX Design Documentation](#6-uiux-design-documentation)
   - [Use Case Scenarios](#61-use-case-scenarios)
   - [Task Analysis](#62-task-analysis)
   - [UI Screen Designs](#63-ui-screen-designs)
   - [Cognitive Walkthrough & Heuristic Evaluation](#64-cognitive-walkthrough--heuristic-evaluation)
7. [Appendix](#7-appendix)

---

## 1. Executive Summary & Project Overview

### 1.1 Project Goals and Objectives

This project delivers a full-stack Learning Management System (LMS) as a modern, alternative presentation to the existing Daytona College class module format. Rather than incrementally improving the current system, this application is a ground-up replacement built on contemporary web technologies, offering a richer and more interactive experience for students, instructors, and administrators.

- ✅ Build and deploy a fully functional, database-driven LMS web application accessible via public URL on Microsoft Azure
- ✅ Implement three distinct user roles — **Admin**, **Instructor**, and **Student** — each with appropriate access controls and dedicated dashboards
- ✅ Enable full CRUD operations for course content: modules, lessons, assignments, quizzes, and supporting resources
- ✅ Support student interactions including assignment submission, quiz-taking, and progress tracking
- ✅ Demonstrate mastery of the full-stack development lifecycle: design, build, secure, and deploy a client-server web application
- ✅ Complete the project within the Azure Student Credit budget (**$100 total**), targeting under **$15/month** in cloud costs

---

### 1.2 Key Stakeholders and Their Roles

| Stakeholder | Role | Responsibilities |
|---|---|---|
| Jose A. Melendez | Developer / Student | Full application design, development, testing, deployment, and documentation |
| Ronald Eaglin | Instructor / Project Sponsor | Define requirements, provide feedback, assess final deliverable per rubric |
| Daytona College Students | End User – Student Role | Browse course content, submit assignments, take quizzes, track learning progress |
| Daytona College Instructors | End User – Instructor Role | Create and manage course modules, lessons, assignments; review and grade submissions |
| System Administrator | End User – Admin Role | Manage user accounts, enroll students, oversee platform configuration and health |

---

### 1.3 Business Value and Expected Outcomes

- **Students** gain a cleaner, responsive interface for navigating course content, reducing friction in the learning experience
- **Instructors** gain a self-service content management system, reducing dependency on administrative staff for content updates
- **The institution** gains a proof-of-concept for modernizing course delivery without adopting costly commercial LMS licenses
- **Jose A. Melendez** gains hands-on, full-stack development experience directly applicable to industry roles, with a live, deployed portfolio piece

---

### 1.4 High-Level Timeline

> ⚑ Module 1 is due today (02/17/2026). Dates for Modules 2–6 are estimated at 2-week intervals — update with your actual course deadlines as they are confirmed.

| Module | Milestone / Deliverable | Target Date | Budget Use | Status |
|:---:|---|:---:|:---:|:---:|
| 1 | Environment setup, stack selection, full documentation template | 02/17/2026 | $0 | ✅ Done |
| 2 | Project scaffolding, DB schema, Prisma models, local dev running | 03/03/2026 | $0 | ✅ Done |
| 3 | Core API endpoints (CRUD), React frontend components, auth system | 03/17/2026 | ~$5 | 🔧 In Work |
| 4 | Role-based dashboards (Admin/Instructor/Student), quiz + assignment flows | 03/31/2026 | ~$10 | ⬜ Pending |
| 5 | Cloud deployment to Azure App Service + Azure SQL, GitHub Actions CI/CD | 04/14/2026 | ~$15 | ⬜ Pending |
| 6 | Testing, bug fixes, polish, final submission + live demo | 04/28/2026 | ~$15 | ⬜ Pending |

**Total Azure Budget:** $100 (student credit)  
**Estimated Total Cloud Cost:** ~$45–$60 for full semester (well within budget)

| Service | Estimated Cost |
|---|---|
| Azure SQL Basic | ~$5/month |
| Azure App Service Free F1 | $0 during development |
| Azure App Service Basic B1 | ~$13/month for final deployment |

---

### 1.5 Critical Success Factors

- Application is deployed to Azure and publicly accessible via a live URL before final submission
- All three user roles (Admin, Instructor, Student) authenticate successfully and access role-appropriate views
- Full CRUD operations work end-to-end: create, read, update, and delete courses, modules, lessons, and assignments
- Students can submit assignments and take quizzes; instructors can grade and provide feedback
- Azure SQL database is connected, seeded, and persists data correctly in the cloud environment
- Application is responsive and functions correctly on desktop and mobile browsers
- Total Azure spend remains within the $100 student credit limit
- All course documentation requirements per the Web Systems II rubric are met

---

## 2. System Architecture

This application follows a **three-tier client-server architecture**. The React frontend communicates exclusively through a RESTful Express.js API, which reads and writes to an Azure SQL database via the Prisma ORM. All three tiers are hosted on Microsoft Azure.

```
┌─────────────────────┐     HTTPS / REST      ┌─────────────────────┐     Prisma ORM     ┌─────────────────────┐
│                     │ ───────────────────►   │                     │ ─────────────────► │                     │
│   React Frontend    │                        │  Express.js API     │                    │   Azure SQL (MSSQL) │
│   (Vite / React 18) │ ◄───────────────────   │  (Node.js 20 LTS)   │ ◄───────────────── │   (Prisma Client)   │
│                     │     JSON Responses     │                     │    Query Results   │                     │
└─────────────────────┘                        └─────────────────────┘                    └─────────────────────┘
   Azure App Service                              Azure App Service                          Azure SQL Database
```

---

### 2.1 Client-Side Architecture

#### 2.1.1 User Interface Specifications

The application provides three distinct dashboard experiences gated by user role. All views share a common navigation shell and responsive layout built with **Bootstrap 5**.

| Screen / Page | Role | Key UI Elements & Purpose |
|---|:---:|---|
| Login / Register | All | Email + password form, role selection on register, JWT issued on success |
| Student Dashboard | Student | Enrolled courses overview, progress bars, upcoming assignments, quick-access quiz launcher |
| Course / Module View | Student | Expandable module tree, lesson content area (text/video/file), lesson completion toggle |
| Assignment Submission | Student | Assignment details, rich text submission editor, file upload, submission history |
| Quiz Interface | Student | Question-by-question flow, multiple choice, timer display, instant score on submit |
| Instructor Dashboard | Instructor | My Courses list, pending submissions to grade, quick stats (enrollments, completion rates) |
| Course Content Editor | Instructor | Add/edit/delete modules and lessons, drag-to-reorder, publish/unpublish toggle |
| Assignment & Quiz Builder | Instructor | Create assignments with due dates; build quizzes with multiple-choice questions |
| Grading View | Instructor | List of submissions per assignment, inline grade entry and feedback text |
| Admin Dashboard | Admin | User management table, course enrollment controls, platform-wide statistics |

#### 2.1.2 Supported Browsers and Devices

| Category | Details |
|---|---|
| Desktop Browsers | Chrome (latest), Firefox (latest), Edge (latest), Safari (latest) |
| Mobile Browsers | Chrome for Android, Safari for iOS |
| Responsive Breakpoints | Desktop ≥ 1024px \| Tablet 768–1023px \| Mobile < 768px (Bootstrap 5 grid) |
| Minimum Resolution | 375px wide (iPhone SE baseline) |

#### 2.1.3 Client-Side Technologies and Frameworks

| Technology | Details |
|---|---|
| Frontend Framework | React 18 (bootstrapped with Vite) |
| Routing | React Router v6 |
| CSS Framework | Bootstrap 5.3 |
| HTTP Client | Axios (API calls to Express backend) |
| State Management | React Context API + useState/useReducer |
| Build Tool | Vite 5.x (fast dev server, optimized production build) |
| Package Manager | npm |

#### 2.1.4 Local Storage Requirements

| Item | Details |
|---|---|
| JWT Token | Stored in `localStorage` on login; attached as `Authorization: Bearer <token>` on all API requests |
| User Role / Profile | Cached in React Context (in-memory) after login; re-fetched on page refresh |
| Theme / Preferences | `localStorage` (dark/light mode preference, if implemented) |
| Cookies | None – stateless JWT approach used; no server-side session cookies |

---

### 2.2 Server-Side Architecture

#### 2.2.1 API Specifications

The backend exposes a RESTful JSON API. All protected routes require a valid JWT Bearer token in the `Authorization` header. Role enforcement is applied at the middleware layer.

| Method | Endpoint | Auth | Request Body | Response |
|:---:|---|:---:|---|---|
| `POST` | `/api/auth/register` | No | `{ email, password, role }` | `201` + user object |
| `POST` | `/api/auth/login` | No | `{ email, password }` | `200` + JWT token |
| `GET` | `/api/courses` | Yes | — | `200` + courses array |
| `POST` | `/api/courses` | Instructor | `{ title, description }` | `201` + course |
| `PUT` | `/api/courses/:id` | Instructor | `{ title, description, isPublished }` | `200` + updated |
| `DELETE` | `/api/courses/:id` | Instructor | — | `204` No Content |
| `GET` | `/api/courses/:id/modules` | Yes | — | `200` + modules array |
| `POST` | `/api/courses/:id/modules` | Instructor | `{ title, order }` | `201` + module |
| `GET` | `/api/modules/:id/lessons` | Yes | — | `200` + lessons array |
| `POST` | `/api/modules/:id/lessons` | Instructor | `{ title, content, type }` | `201` + lesson |
| `POST` | `/api/assignments/:id/submit` | Student | `{ content }` | `201` + submission |
| `PUT` | `/api/submissions/:id/grade` | Instructor | `{ score, feedback }` | `200` + graded |
| `POST` | `/api/quizzes/:id/attempt` | Student | `{ answers[] }` | `201` + score |
| `GET` | `/api/admin/users` | Admin | — | `200` + users array |
| `POST` | `/api/enrollments` | Admin | `{ studentId, courseId }` | `201` + enrollment |

#### 2.2.2 Database Design

The database uses **Microsoft SQL Server (Azure SQL)**. The Prisma ORM manages schema migrations and query generation. All tables use integer identity primary keys. Relationships enforce referential integrity via foreign key constraints.

| Table | Primary Key | Key Fields | Foreign Keys | Notes |
|---|---|---|---|---|
| `Users` | `userId` (int) | email, passwordHash, role, firstName, lastName, isActive | — | role: `ADMIN \| INSTRUCTOR \| STUDENT` |
| `Courses` | `courseId` (int) | title, description, isPublished, createdAt | instructorId → Users | Owned by one Instructor |
| `Enrollments` | `enrollmentId` (int) | enrolledAt | studentId → Users, courseId → Courses | Junction: Student ↔ Course |
| `Modules` | `moduleId` (int) | title, description, orderIndex | courseId → Courses | Ordered sections within a course |
| `Lessons` | `lessonId` (int) | title, content, contentType, orderIndex | moduleId → Modules | contentType: `TEXT \| VIDEO \| FILE` |
| `Assignments` | `assignmentId` (int) | title, description, dueDate, maxScore | moduleId → Modules | Linked to a specific module |
| `Submissions` | `submissionId` (int) | content, submittedAt, score, feedback | assignmentId → Assignments, studentId → Users | score nullable until graded |
| `Quizzes` | `quizId` (int) | title, timeLimitMinutes | moduleId → Modules | Optional time limit |
| `QuizQuestions` | `questionId` (int) | questionText, optionsJson, correctAnswer | quizId → Quizzes | optionsJson stores array as JSON string |
| `QuizAttempts` | `attemptId` (int) | answersJson, score, attemptedAt | quizId → Quizzes, studentId → Users | Score calculated server-side |
| `LessonProgress` | `progressId` (int) | completedAt | lessonId → Lessons, studentId → Users | Tracks lesson completion per student |

| Configuration | Details |
|---|---|
| Database Engine | Microsoft SQL Server (Azure SQL Database – Basic tier) |
| ORM | Prisma 5.x (schema-first, auto-generates typed query client) |
| Migration Strategy | `prisma migrate dev` locally; `prisma migrate deploy` in CI/CD |
| Local Dev Database | SQL Server Express OR Docker: `mcr.microsoft.com/mssql/server` |
| Database GUI | Azure Data Studio (free, cross-platform) |

#### 2.2.3 Authentication and Authorization

| Item | Details |
|---|---|
| Authentication Method | JSON Web Tokens (JWT) via the `jsonwebtoken` npm package |
| Token Storage | Client stores JWT in `localStorage`; sent as `Authorization: Bearer <token>` on all requests |
| Password Storage | `bcryptjs` – passwords hashed with salt rounds = 12 before storing |
| Token Expiration | Access token: 8 hours (suitable for a class session); no refresh token in v1.0 |
| Authorization Model | Role-Based Access Control (RBAC) – three roles: `ADMIN`, `INSTRUCTOR`, `STUDENT` |
| Middleware | `verifyToken` (checks JWT) + `requireRole('INSTRUCTOR')` (checks role) |
| Protected Routes | All `/api/*` routes except `/api/auth/login` and `/api/auth/register` require valid JWT |
| Admin Privileges | Full user management, enrollment control, access to all courses regardless of ownership |
| Instructor Privileges | Create/edit/delete own courses, modules, lessons, assignments, quizzes; grade submissions |
| Student Privileges | View enrolled courses, complete lessons, submit assignments, attempt quizzes, view own grades |

#### 2.2.4 Third-Party Integrations

| Integration | Details |
|---|---|
| Email Service | None in v1.0 (future: SendGrid for password reset / enrollment notifications) |
| File Storage | None in v1.0 – file uploads stored as base64 in DB (future: Azure Blob Storage) |
| Payment / External APIs | None – not applicable for this academic LMS |
| Key npm Packages | `express`, `prisma`, `@prisma/client`, `jsonwebtoken`, `bcryptjs`, `cors`, `dotenv`, `express-validator` |
| Key React Libraries | `react-router-dom`, `axios`, `bootstrap`, `react-bootstrap`, `react-quill` (rich text editor) |

#### 2.2.5 Hosting Requirements

| Item | Details |
|---|---|
| Cloud Provider | Microsoft Azure (student credit account) |
| App Hosting | Azure App Service – Free F1 tier during development; Basic B1 for final deployment |
| Database Hosting | Azure SQL Database – Basic tier (5 DTU, 2GB storage, ~$5/month) |
| Region | East US (lowest latency to Florida; aligns with Daytona College location) |
| CI/CD Pipeline | GitHub Actions – on push to `main`: run tests, build React, deploy to Azure App Service |
| Environment Variables | `DATABASE_URL`, `JWT_SECRET`, `NODE_ENV`, `PORT` (stored in Azure App Service Configuration) |
| Custom Domain | No – using Azure-provided `*.azurewebsites.net` URL for this project |
| SSL / HTTPS | Automatically provided by Azure App Service (no additional setup required) |
| Estimated Monthly Cost | ~$13 (B1 App Service) + ~$5 (Azure SQL Basic) = **~$18/month**; well within $100 budget |
| Version Control | This GitHub repository |

---

## 3. Technology Stack / Programming Environment

The stack was selected to maximize leverage of Jose A. Melendez's existing JavaScript and MS SQL expertise, minimize context-switching, and stay within Azure student credit constraints. A single language (JavaScript/Node.js) runs across the entire application — frontend, backend, and tooling.

### 3.1 Development Environment

| Tool | Details |
|---|---|
| Operating System | Windows 10/11 |
| IDE | Visual Studio Code (VS Code) – free, lightweight, best ecosystem for Node + React |
| VS Code Extensions | ES7+ React/Redux Snippets, Prisma, REST Client, GitLens, Azure Tools, Prettier, ESLint |
| Version Control | Git 2.x + **this GitHub repository** |
| Terminal | Windows Terminal or VS Code integrated terminal (PowerShell or Git Bash) |
| Browser DevTools | Chrome DevTools (Network tab for API inspection, React Developer Tools extension) |
| API Testing | Thunder Client (VS Code extension) or Postman |
| DB GUI | Azure Data Studio – connects to both local SQL Server Express and Azure SQL |
| Containerization | Optional: Docker Desktop (for running SQL Server locally via container) |

### 3.2 Backend Stack

| Technology | Details |
|---|---|
| Language | JavaScript (ES2022+) |
| Runtime | Node.js 20 LTS |
| Framework | Express.js 4.x – minimal, flexible REST API framework |
| ORM | Prisma 5.x – schema-first ORM with full MS SQL Server support; auto-generates typed client |
| Authentication | `jsonwebtoken` (JWT generation/verification) + `bcryptjs` (password hashing) |
| Validation | `express-validator` – request body validation middleware |
| Environment Config | `dotenv` – loads `.env` variables for local development |
| CORS | `cors` npm package – allows React dev server (port 5173) to call Express (port 3001) |
| Project Structure | MVC-style: `/routes`, `/controllers`, `/middleware`, `/prisma` |

### 3.3 Frontend Stack

| Technology | Details |
|---|---|
| Language | JavaScript (ES2022+) / JSX |
| Framework | React 18 |
| Build Tool | Vite 5.x – extremely fast dev server and build pipeline; replaces Create React App |
| Routing | React Router v6 – client-side routing with protected route wrappers per role |
| CSS Framework | Bootstrap 5.3 – responsive grid, pre-built components |
| Component Library | `react-bootstrap` – Bootstrap components as React components (no jQuery dependency) |
| HTTP Client | Axios – promise-based HTTP client; interceptors attach JWT header automatically |
| Rich Text Editor | `react-quill` – for lesson content creation and assignment submission |
| State Management | React Context API + hooks (`useState`, `useEffect`, `useContext`) |

### 3.4 Database Stack

| Technology | Details |
|---|---|
| Database Engine | Microsoft SQL Server – local: SQL Server Express 2022 (free) or Docker container |
| Cloud Database | Azure SQL Database – Basic tier (fully managed SQL Server in the cloud) |
| ORM / Query Layer | Prisma – schema defined in `schema.prisma`; queries via generated `PrismaClient` |
| DB GUI – Local Dev | Azure Data Studio (free) – connects to local SQL Server Express |
| DB GUI – Azure | Azure Portal Query Editor or Azure Data Studio (same tool, different connection string) |
| Migrations | `prisma migrate dev` (local); `prisma migrate deploy` (CI/CD) |
| Seeding | `prisma db seed` – seed script in `/prisma/seed.js` creates demo Admin, Instructor, Student + sample course |

### 3.5 Cloud and DevOps Stack

| Technology | Details |
|---|---|
| Cloud Platform | Microsoft Azure |
| App Hosting | Azure App Service (Web App) – Node.js 20 runtime stack |
| Database | Azure SQL Database – Basic tier; same SQL Server dialect as local dev (zero config change) |
| Deployment Method | GitHub Actions CI/CD pipeline – auto-deploy to Azure on push to `main` branch |
| Build Process | GitHub Actions: install deps → build React (`npm run build`) → deploy `/dist` + server to Azure |
| Secrets Management | Azure App Service 'Application Settings' – stores `DATABASE_URL`, `JWT_SECRET` securely |
| Monitoring | Azure App Service built-in logging (Log Stream) |
| Static Files | React build output (`/dist`) served by Express as static files in production |
| Estimated Cost | Azure SQL Basic ~$5/mo + App Service Basic B1 ~$13/mo = **~$18/mo total** |

---

## 4. Development Environment Setup Log

> ⚑ Complete each item below as you set up your development environment. Check off tasks and log any issues encountered. This section is your Module 1 setup evidence.

### 4.1 Recommended Setup Order

Follow this order exactly — each step depends on the previous one.

| # | Task | Target Date | Status |
|:---:|---|:---:|:---:|
| 1 | Install VS Code – [code.visualstudio.com](https://code.visualstudio.com) (free) | 02/17/2026 | ✅ Done |
| 2 | Install Node.js 20 LTS – [nodejs.org](https://nodejs.org) (includes npm) | 02/17/2026 | ✅ Done |
| 3 | Install Git – [git-scm.com](https://git-scm.com); run: `git config --global user.name` and `user.email` | 02/17/2026 | ✅ Done |
| 4 | Create GitHub account (if not already) and create a new private repository named `daytona-lms` | 02/17/2026 | ✅ Done |
| 5 | Install Azure Data Studio – free SQL GUI from Microsoft | 02/17/2026 | ✅ Done |
| 6 | Install SQL Server Express 2022 (free) **OR** set up Docker Desktop + SQL Server container | 02/24/2026 | ✅ Done |
| 7 | Scaffold backend: `mkdir daytona-lms && cd daytona-lms && npm init -y && npm install express prisma @prisma/client jsonwebtoken bcryptjs cors dotenv` | 02/24/2026 | ✅ Done |
| 8 | Initialize Prisma: `npx prisma init --datasource-provider sqlserver` | 02/24/2026 | ✅ Done |
| 9 | Define `schema.prisma` with all 11 tables (provided in Module 2 guide) | 02/24/2026 | ✅ Done |
| 10 | Run first migration: `npx prisma migrate dev --name init` | 02/24/2026 | ✅ Done |
| 11 | Scaffold frontend: `npm create vite@latest client -- --template react && cd client && npm install` | 03/03/2026 | ✅ Done |
| 12 | Install React dependencies: `npm install react-router-dom axios bootstrap react-bootstrap` | 03/03/2026 | 🔧 In Work |
| 13 | Verify full local stack runs: Express on `:3001`, React on `:5173`, DB connected | 03/03/2026 | ⬜ Pending |
| 14 | Create Azure account at [azure.microsoft.com/free/students](https://azure.microsoft.com/free/students) (activate $100 credit) | 03/03/2026 | ⬜ Pending |
| 15 | Create Azure SQL Database (Basic tier) and note the connection string | 03/10/2026 | ⬜ Pending |
| 16 | Create Azure App Service (Node 20, Free F1 tier to start) | 03/10/2026 | ⬜ Pending |
| 17 | Connect GitHub repo to Azure App Service – enable GitHub Actions auto-deploy | 03/10/2026 | ⬜ Pending |
| 18 | First successful cloud deployment – verify app loads at `*.azurewebsites.net` URL | 03/10/2026 | ⬜ Pending |

### 4.2 Issues Log

> ⚑ Document any errors or blockers here as you work through setup — this demonstrates problem-solving for the grader.

| # | Issue / Error Encountered | Root Cause | Resolution |
|:---:|---|---|---|
| 1 | _Log issue here_ | _Root cause_ | _How resolved_ |
| 2 | _Log issue here_ | _Root cause_ | _How resolved_ |
| 3 | _Log issue here_ | _Root cause_ | _How resolved_ |
| 4 | _Log issue here_ | _Root cause_ | _How resolved_ |


---

## 5. Development Documentation Standards

> This section fulfils the Assignment 5 documentation requirements. Cross-references to earlier sections are noted where content already exists. A skilled developer should be able to clone the repository and resume work using only this document.

---

### 5.1 Purpose and Overview

> Full narrative is in **[Section 1 — Executive Summary & Project Overview](#1-executive-summary--project-overview)**. The summary below is provided for quick reference.

This project is a ground-up, full-stack **Learning Management System (LMS)** built as a modern alternative to the existing Daytona College class module format. It serves three user roles — **Admin**, **Instructor**, and **Student** — and supports the complete lifecycle of an online course: content creation, student enrollment, lesson delivery, assignment submission, quiz-taking, grading, and progress tracking.

The primary course used as the working example throughout all design and documentation is **Web Systems II – 521F SP26 ON**, taught by Ronald Eaglin, Spring 2026 (online delivery).

| Item | Value |
|---|---|
| Project Name | Daytona College Class Module LMS |
| Developer | Jose A. Melendez |
| Course Context | Web Systems II – 521F SP26 ON |
| Repository | https://github.com/Melendja/daytona-lms |
| Deployment Target | Microsoft Azure (App Service + Azure SQL) |
| Target Users | Students, Instructors, Admins at Daytona College |

---

### 5.2 Complete Stack Elements & Connectors

#### Full Stack Diagram

```
┌──────────────────────────┐    HTTPS / REST JSON     ┌───────────────────────────┐
│   FRONTEND               │ ──── Axios + JWT ──────► │   BACKEND                 │
│   React 18 (Vite 5)      │ ◄─── JSON Response ───── │   Express.js 4  (Node 20) │
│   Bootstrap 5.3          │                           │   cors middleware          │
│   React Router v6        │                           │   express-validator        │
│   React Context API      │                           │   jsonwebtoken + bcryptjs  │
└──────────┬───────────────┘                           └──────────┬────────────────┘
           │                                                      │
           │  localStorage                              Prisma Client (ORM)
           │  (JWT token)                               TCP / TLS port 1433
           │                                                      │
           │                                                      ▼
           │                                           ┌──────────────────────────┐
           │                                           │   DATABASE               │
           │                                           │   Azure SQL (MS SQL      │
           │                                           │   Server) — 11 tables    │
           │                                           └──────────────────────────┘
           │
    ┌──────▼──────────────────────────────────────────────────────────┐
    │  CI/CD                                                           │
    │  GitHub repo ──► GitHub Actions (on push to main)               │
    │     └── npm install + npm run build + deploy to Azure App Service│
    └──────────────────────────────────────────────────────────────────┘
```

#### Connector Reference Table

| From | Connector / Protocol | To | Config / Notes |
|---|---|---|---|
| React (browser) | HTTP/HTTPS + Axios | Express API | Base URL set in `client/src/services/api.js`; JWT attached via Axios interceptor |
| Axios interceptor | `Authorization: Bearer <token>` header | Express `verifyToken` middleware | Token stored in `localStorage` on login |
| Express routes | Prisma Client (auto-generated) | Azure SQL Database | `DATABASE_URL` in `.env`; connection pool managed by Prisma |
| Prisma Client | TCP/TLS port 1433 | Azure SQL / SQL Server Express | Encrypt=true in production connection string |
| GitHub (main branch) | GitHub Actions workflow `.yml` | Azure App Service | Deployment credentials stored as GitHub Secrets |
| Express (production) | `express.static()` | React `/dist` build output | Client is built first; Express serves static files in production |
| Express | `cors` npm package | Browser | Allows `http://localhost:5173` in dev; locked to Azure domain in prod |
| `.env` file | `dotenv` npm package | Express config | `require('dotenv').config()` at top of `server/index.js` |
| `jsonwebtoken` | RSA/HMAC signing | JWT token | `JWT_SECRET` env var; HS256 algorithm; 8-hour expiry |
| `bcryptjs` | One-way hash | Users table `passwordHash` | Salt rounds = 12 |

#### Required Environment Variables

| Variable | Example Value | Used By |
|---|---|---|
| `DATABASE_URL` | `sqlserver://HOST:1433;database=daytona_lms;user=SA;password=P@ss;encrypt=true` | Prisma |
| `JWT_SECRET` | `your-256-bit-random-string` | jsonwebtoken |
| `NODE_ENV` | `development` or `production` | Express |
| `PORT` | `3001` | Express |

> **Never commit `.env` to Git.** Copy `.env.example` and fill in real values locally. Azure App Service Application Settings replace `.env` in production.

---

### 5.3 Language and Coding Standards

#### Primary Language — JavaScript (ES2022+)

The entire application — frontend, backend, and tooling — is written in **JavaScript ES2022+**. A single language across the full stack minimises context-switching and allows shared utility logic.

| Layer | Language / Syntax | Runtime |
|---|---|---|
| Frontend | JavaScript ES2022+ / JSX | Browser (compiled by Vite) |
| Backend | JavaScript ES2022+ (CommonJS modules) | Node.js 20 LTS |
| Database schema | Prisma Schema Language (PSL) | Prisma CLI |
| CI/CD pipeline | YAML | GitHub Actions |

#### Key Language Features Used

| Feature | Usage |
|---|---|
| `async` / `await` | All API calls and database queries — never raw `.then()` chains |
| Arrow functions | All callbacks and short functions |
| Destructuring | Props, imports, API responses (`const { data } = await api.get(...)`) |
| Template literals | Dynamic strings, SQL-equivalent query building |
| Optional chaining `?.` | Safe navigation in React components |
| Nullish coalescing `??` | Default values in components and controllers |
| Spread operator `...` | Object merging in state updates and API responses |
| ES Modules (frontend) | `import` / `export` in all React files via Vite |
| CommonJS (backend) | `require` / `module.exports` in Express files (Node default) |

#### Official Style Reference Links

| Resource | URL | Applied To |
|---|---|---|
| Airbnb JavaScript Style Guide | https://airbnb.io/javascript/ | All JS files |
| React Official Docs — Best Practices | https://react.dev/learn | All `.jsx` files |
| Express.js Guide | https://expressjs.com/en/guide/routing.html | All route/controller files |
| Prisma Naming Conventions | https://pris.ly/d/naming-conventions | `schema.prisma` |
| Node.js Best Practices | https://github.com/goldbergyoni/nodebestpractices | `server/` directory |

---

### 5.4 Code Conventions

These conventions are enforced via **ESLint** + **Prettier** (VS Code extensions). The `.eslintrc` and `.prettierrc` config files are committed to the repository root.

#### Naming Conventions

| Type | Convention | Example |
|---|---|---|
| Variables | `camelCase` | `studentId`, `courseTitle`, `isEnrolled` |
| Functions | `camelCase` | `getEnrolledCourses()`, `submitAssignment()` |
| React Components | `PascalCase` | `StudentDashboard`, `CourseCard`, `QuizInterface` |
| Constants | `SCREAMING_SNAKE_CASE` | `JWT_EXPIRY`, `MAX_FILE_SIZE_MB` |
| CSS classes | `kebab-case` (Bootstrap) | `course-card`, `progress-bar-container` |
| Files — React | `PascalCase.jsx` | `StudentDashboard.jsx`, `QuizInterface.jsx` |
| Files — JS utilities | `camelCase.js` | `authService.js`, `jwtHelpers.js` |
| Files — Routes | `camelCase + Routes.js` | `courseRoutes.js`, `adminRoutes.js` |
| Files — Controllers | `camelCase + Controller.js` | `courseController.js` |
| Database tables | `PascalCase` (Prisma default) | `Users`, `Courses`, `QuizAttempts` |
| Database columns | `camelCase` (Prisma default) | `userId`, `passwordHash`, `isPublished` |

#### Boolean Naming

Prefix all boolean variables and props with `is`, `has`, or `can`:

```js
// Correct
const isEnrolled = true;
const hasSubmitted = false;
const canEdit = user.role === 'INSTRUCTOR';

// Incorrect
const enrolled = true;
const submitted = false;
```

#### Comment Standards

All exported functions use **JSDoc** format:

```js
/**
 * Verifies a JWT token and attaches decoded user to req.user
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object
 * @param {Function} next - Express next middleware
 */
const verifyToken = (req, res, next) => { ... };
```

#### React Component Rules

- One component per file; default export for components
- Named exports for hooks, utilities, and constants
- Props destructured in function signature: `function CourseCard({ title, progress, onSelect })`
- No inline styles — use Bootstrap classes; custom CSS in component-scoped `.module.css` file
- `useEffect` cleanup functions included wherever subscriptions or timers are used

#### API Response Format (Backend)

All API responses follow a consistent envelope:

```js
// Success
res.status(200).json({ success: true, data: result });

// Error
res.status(400).json({ success: false, message: "Validation failed", errors: [...] });
```

#### Git Commit Convention

Format: `type(scope): short description`

| Type | When to use |
|---|---|
| `feat` | New feature added |
| `fix` | Bug fix |
| `docs` | Documentation changes only |
| `style` | Formatting, no logic change |
| `refactor` | Code change that is neither fix nor feature |
| `test` | Adding or updating tests |
| `chore` | Build process, dependency updates |

Examples: `feat(quiz): add timer auto-submit on expiry` · `fix(auth): clear password field on failed login`

---

### 5.5 Project Directory Structure

```
daytona-lms/                         ← Repository root
├── client/                          ← React frontend (Vite)
│   ├── public/                      ← Static public assets
│   ├── src/
│   │   ├── assets/                  ← Images, icons, fonts
│   │   ├── components/
│   │   │   ├── common/              ← Navbar, Footer, Spinner, ProtectedRoute
│   │   │   ├── student/             ← StudentDashboard, CourseCard, ProgressBar
│   │   │   ├── instructor/          ← InstructorDashboard, CourseEditor, GradeForm
│   │   │   └── admin/               ← AdminDashboard, UserTable, EnrollForm
│   │   ├── context/
│   │   │   └── AuthContext.jsx      ← JWT state, login(), logout(), user object
│   │   ├── hooks/
│   │   │   └── useAuth.js           ← Custom hook wrapping AuthContext
│   │   ├── pages/
│   │   │   ├── auth/                ← LoginPage.jsx, RegisterPage.jsx
│   │   │   ├── student/             ← CoursePage.jsx, QuizPage.jsx, GradesPage.jsx
│   │   │   ├── instructor/          ← ContentEditorPage.jsx, SubmissionsPage.jsx
│   │   │   └── admin/               ← UsersPage.jsx, EnrollmentsPage.jsx
│   │   ├── services/
│   │   │   ├── api.js               ← Axios instance; JWT interceptor attached here
│   │   │   ├── authService.js       ← login(), register()
│   │   │   ├── courseService.js     ← getCourses(), createCourse(), updateCourse()
│   │   │   ├── moduleService.js     ← getModules(), createModule()
│   │   │   ├── lessonService.js     ← getLessons(), markComplete()
│   │   │   ├── assignmentService.js ← getAssignment(), submitAssignment()
│   │   │   └── quizService.js       ← getQuiz(), submitQuizAttempt()
│   │   ├── utils/
│   │   │   └── helpers.js           ← formatDate(), calcProgress(), truncate()
│   │   ├── App.jsx                  ← React Router setup; role-gated routes
│   │   └── main.jsx                 ← Vite entry; renders <App /> into #root
│   ├── index.html                   ← HTML shell (Vite injects bundle here)
│   └── vite.config.js               ← Proxy: /api → localhost:3001 in dev
│
├── server/                          ← Express.js backend
│   ├── controllers/
│   │   ├── authController.js        ← register(), login()
│   │   ├── courseController.js      ← CRUD for Courses table
│   │   ├── moduleController.js      ← CRUD for Modules table
│   │   ├── lessonController.js      ← CRUD + markComplete() for Lessons
│   │   ├── assignmentController.js  ← CRUD for Assignments + submit()
│   │   ├── submissionController.js  ← gradeSubmission()
│   │   ├── quizController.js        ← CRUD for Quizzes + attemptQuiz()
│   │   └── adminController.js       ← User management + enrollStudent()
│   ├── middleware/
│   │   ├── verifyToken.js           ← Validates JWT; attaches req.user
│   │   ├── requireRole.js           ← Role gate: requireRole('INSTRUCTOR')
│   │   └── validate.js              ← express-validator error aggregator
│   ├── routes/
│   │   ├── authRoutes.js            ← POST /api/auth/register, /login
│   │   ├── courseRoutes.js          ← CRUD /api/courses
│   │   ├── moduleRoutes.js          ← CRUD /api/courses/:id/modules
│   │   ├── lessonRoutes.js          ← CRUD /api/modules/:id/lessons
│   │   ├── assignmentRoutes.js      ← /api/assignments
│   │   ├── submissionRoutes.js      ← /api/submissions/:id/grade
│   │   ├── quizRoutes.js            ← /api/quizzes
│   │   └── adminRoutes.js           ← /api/admin/users, /api/enrollments
│   ├── utils/
│   │   └── jwtHelpers.js            ← signToken(), verifyTokenUtil()
│   └── index.js                     ← App entry: mounts routes, serves /dist
│
├── prisma/
│   ├── schema.prisma                ← 11-table schema (source of truth for DB)
│   ├── migrations/                  ← Auto-generated SQL migration files
│   └── seed.js                      ← Seeds: 1 Admin, 1 Instructor, 3 Students,
│                                       1 Course (Web Systems II), 2 Modules,
│                                       4 Lessons, 1 Assignment, 1 Quiz
│
├── .env                             ← Local secrets — NOT committed to Git
├── .env.example                     ← Template — IS committed; shows required keys
├── .gitignore                       ← Excludes: node_modules, .env, /dist, *.log
├── package.json                     ← Root scripts: dev, build, start, seed
└── README.md                        ← This file — full project documentation
```

#### Root `package.json` Scripts

| Script | Command | Purpose |
|---|---|---|
| `npm run dev` | `concurrently "node server/index.js" "vite --config client/vite.config.js"` | Start both Express (3001) and React (5173) simultaneously |
| `npm run build` | `cd client && npm run build` | Build React for production into `client/dist` |
| `npm start` | `node server/index.js` | Production — Express serves `/dist` as static files |
| `npm run seed` | `npx prisma db seed` | Populate DB with demo data |
| `npm run migrate` | `npx prisma migrate dev` | Apply schema changes locally |

---

### 5.6 Code Modules and Object Overview

#### Object / Model Mapping

Each Prisma model corresponds to a server-side controller, a set of API routes, and one or more React components that consume it.

| Prisma Model | Controller | API Routes File | Primary React Component(s) | Context / State |
|---|---|---|---|---|
| `User` | `authController.js` | `authRoutes.js` | `LoginPage`, `RegisterPage` | `AuthContext` — `user`, `token` |
| `Course` | `courseController.js` | `courseRoutes.js` | `StudentDashboard`, `CourseCard`, `InstructorDashboard` | `courseService.js` |
| `Enrollment` | `adminController.js` | `adminRoutes.js` | `EnrollForm`, `AdminDashboard` | Local state in `UsersPage` |
| `Module` | `moduleController.js` | `moduleRoutes.js` | `ModuleTree`, `ContentEditorPage` | Module array in `CoursePage` |
| `Lesson` | `lessonController.js` | `lessonRoutes.js` | `LessonView`, `ContentEditorPage` | Lesson state in `CoursePage` |
| `Assignment` | `assignmentController.js` | `assignmentRoutes.js` | `AssignmentDetail`, `SubmissionEditor` | Assignment state in `CoursePage` |
| `Submission` | `submissionController.js` | `submissionRoutes.js` | `GradeForm`, `SubmissionsPage` | Submission state in `SubmissionsPage` |
| `Quiz` | `quizController.js` | `quizRoutes.js` | `QuizInterface`, `QuizBuilder` | `quizState` in `QuizPage` |
| `QuizQuestion` | `quizController.js` (nested) | `quizRoutes.js` | `QuizInterface` (renders each question) | `quizState.questions[]` |
| `QuizAttempt` | `quizController.js` | `quizRoutes.js` | `QuizResults` | `quizState.attempt` |
| `LessonProgress` | `lessonController.js` | `lessonRoutes.js` | `ProgressBar`, `ModuleTree` (checkmarks) | Progress in `CoursePage` |

#### JWT Payload Object

The JWT payload (attached to `req.user` after `verifyToken` middleware) contains:

```js
{
  userId: 7,
  email: "jose@email.com",
  role: "STUDENT",      // "ADMIN" | "INSTRUCTOR" | "STUDENT"
  firstName: "Jose",
  lastName: "Melendez",
  iat: 1708300000,       // issued at (Unix timestamp)
  exp: 1708328800        // expires at (8 hours later)
}
```

#### Prisma Client Usage Pattern (all controllers)

```js
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// Example: get all courses for a student
const getCourses = async (req, res) => {
  try {
    const courses = await prisma.course.findMany({
      where: { enrollments: { some: { studentId: req.user.userId } } },
      include: { modules: true }
    });
    res.json({ success: true, data: courses });
  } catch (err) {
    res.status(500).json({ success: false, message: err.message });
  }
};
```

#### ProtectedRoute Component Pattern (React)

All role-gated pages are wrapped in a `ProtectedRoute` component that checks the JWT role:

```jsx
// App.jsx
<Route path="/instructor" element={
  <ProtectedRoute allowedRoles={['INSTRUCTOR', 'ADMIN']}>
    <InstructorDashboard />
  </ProtectedRoute>
} />
```

---

### 5.7 Platform & Hosting — Developer Continuity Guide

> A developer with Node.js and Git experience should be able to have this project running locally in under 30 minutes using these steps. Azure deployment should take approximately 1 additional hour.

#### Prerequisites

| Tool | Version | Install URL |
|---|---|---|
| Node.js | 20 LTS | https://nodejs.org |
| npm | Included with Node | — |
| Git | 2.x | https://git-scm.com |
| VS Code | Latest | https://code.visualstudio.com |
| Azure Data Studio | Latest | https://aka.ms/azuredatastudio |
| SQL Server Express OR Docker | 2022 | https://aka.ms/sqlserver-express OR https://docker.com |

#### Local Setup — Step by Step

```bash
# 1. Clone the repository
git clone https://github.com/Melendja/daytona-lms.git
cd daytona-lms

# 2. Install backend dependencies
npm install

# 3. Install frontend dependencies
cd client && npm install && cd ..

# 4. Create your environment file
cp .env.example .env
# Edit .env and fill in: DATABASE_URL, JWT_SECRET, PORT=3001, NODE_ENV=development

# 5. Start local SQL Server (Docker option)
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=YourStrong@Password"   -p 1433:1433 mcr.microsoft.com/mssql/server:2022-latest

# 6. Run Prisma migrations (creates all 11 tables)
npx prisma migrate dev --name init

# 7. Seed the database with demo data
npx prisma db seed

# 8. Start the development server (Express + React simultaneously)
npm run dev
# Express API: http://localhost:3001
# React app:   http://localhost:5173
```

#### Seed Data Accounts (after step 7)

| Role | Email | Password |
|---|---|---|
| Admin | `admin@daytona.edu` | `Admin@1234` |
| Instructor | `ronald@daytona.edu` | `Instructor@1234` |
| Student | `jose@email.com` | `Student@1234` |

#### Azure Deployment — Step by Step

```bash
# 1. Create Azure Resource Group
az group create --name daytona-lms-rg --location eastus

# 2. Create Azure SQL Server + Database
az sql server create --name daytona-lms-sql --resource-group daytona-lms-rg   --location eastus --admin-user sqladmin --admin-password YourStrong@Password
az sql db create --resource-group daytona-lms-rg --server daytona-lms-sql   --name daytona_lms --service-objective Basic

# 3. Create Azure App Service
az appservice plan create --name daytona-lms-plan --resource-group daytona-lms-rg   --sku B1 --is-linux
az webapp create --resource-group daytona-lms-rg --plan daytona-lms-plan   --name daytona-lms-app --runtime "NODE:20-lts"

# 4. Set environment variables on App Service
az webapp config appsettings set --resource-group daytona-lms-rg   --name daytona-lms-app --settings   DATABASE_URL="sqlserver://..." JWT_SECRET="..." NODE_ENV="production"

# 5. Connect GitHub repo for auto-deploy
# Azure Portal: App Service > Deployment Center > GitHub > main branch
```

#### GitHub Actions CI/CD (`.github/workflows/deploy.yml`)

```yaml
name: Deploy to Azure
on:
  push:
    branches: [main]
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '20'
      - run: npm install
      - run: cd client && npm install && npm run build
      - run: npx prisma migrate deploy
      - uses: azure/webapps-deploy@v2
        with:
          app-name: daytona-lms-app
          publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}
```

#### Ongoing Maintenance Notes

| Task | Command | Frequency |
|---|---|---|
| Apply new DB migrations | `npx prisma migrate deploy` | Each release |
| Update Prisma client | `npx prisma generate` | After schema changes |
| View DB in Azure Data Studio | Connect to Azure SQL endpoint | As needed |
| View app logs | `az webapp log tail --name daytona-lms-app --resource-group daytona-lms-rg` | Debugging |
| Rollback deployment | Git revert + push to main triggers new deploy | As needed |
| Check Azure spend | Azure Portal > Cost Management | Monthly |


---

## 6. UI/UX Design Documentation

> **Context:** All use cases, task analysis, and screen designs use **Web Systems II – 521F SP26 ON** as the working course example. This course runs Spring 2026 (online), taught by Ronald Eaglin, and is the direct audience for this LMS.

---

### 6.1 Use Case Scenarios

Use cases capture the goals of each actor and how they interact with the system to achieve them. Six primary use cases are identified for the Web Systems II context.

---

#### UC-01 — Student Logs In and Views Course Dashboard

| Field | Detail |
|---|---|
| **Use Case ID** | UC-01 |
| **Title** | Student logs in and views their course dashboard |
| **Actor** | Student (e.g., a student enrolled in Web Systems II – 521F SP26 ON) |
| **Precondition** | Student has been enrolled in the course by an Admin. Account credentials exist in the system. |
| **Trigger** | Student navigates to the LMS URL and wants to access their coursework |
| **Main Flow** | 1. Student opens the LMS URL in a browser <br> 2. System displays the Login screen <br> 3. Student enters email and password <br> 4. System validates credentials, issues JWT, redirects to Student Dashboard <br> 5. Dashboard displays enrolled courses, current progress, upcoming assignment due dates, and any unread notifications |
| **Alternate Flow** | 3a. Invalid credentials → System displays inline error "Invalid email or password" — form remains populated, password cleared |
| **Postcondition** | Student is authenticated and sees their personalized dashboard for Web Systems II |
| **Business Rule** | A student can only see courses they are enrolled in. Cross-course data is never exposed. |

---

#### UC-02 — Student Navigates a Module and Completes a Lesson

| Field | Detail |
|---|---|
| **Use Case ID** | UC-02 |
| **Title** | Student navigates to a module and marks a lesson complete |
| **Actor** | Student |
| **Precondition** | Student is authenticated (UC-01 complete). Student is enrolled in Web Systems II. At least one module and lesson exist. |
| **Trigger** | Student clicks on "Web Systems II – 521F SP26 ON" from their dashboard |
| **Main Flow** | 1. Student selects the course from their dashboard <br> 2. System displays the module tree (e.g., Module 1: Full-Stack Foundations, Module 2: React & Express, etc.) <br> 3. Student expands a module and clicks a lesson (e.g., "Lesson 1.3 – Setting Up Prisma") <br> 4. System renders the lesson content (text, embedded video, or downloadable file) <br> 5. Student reads/watches the content <br> 6. Student clicks "Mark as Complete" <br> 7. System records completion in LessonProgress, updates the progress bar on the dashboard |
| **Alternate Flow** | 6a. Student navigates away without marking complete → Progress is NOT saved. Student must return and mark manually. |
| **Postcondition** | LessonProgress record created. Course progress percentage updated. |
| **Business Rule** | Lessons must be completed in order if the instructor has enabled sequential mode. |

---

#### UC-03 — Student Submits an Assignment

| Field | Detail |
|---|---|
| **Use Case ID** | UC-03 |
| **Title** | Student submits an assignment for grading |
| **Actor** | Student |
| **Precondition** | Student is authenticated. Assignment exists within a module. Due date has not passed. |
| **Trigger** | Student sees an overdue or upcoming assignment on their dashboard and clicks it |
| **Main Flow** | 1. Student clicks the assignment link ("Assignment 2 – Project Documentation") <br> 2. System displays assignment description, due date, max score, and submission editor <br> 3. Student writes their response in the rich text editor <br> 4. Optionally attaches a file (base64 encoded in v1.0) <br> 5. Student clicks "Submit" <br> 6. System creates a Submission record, timestamps it, confirms with a success banner <br> 7. Dashboard assignment status changes from "Pending" to "Submitted" |
| **Alternate Flow** | 5a. Due date has passed → Submit button is disabled. Message reads "Submission window closed." <br> 5b. Student tries to re-submit → System shows previous submission with option to overwrite if instructor allows it |
| **Postcondition** | Submission record saved. Instructor notified (future: email). Student submission history updated. |
| **Business Rule** | Only one active submission per student per assignment at any time. |

---

#### UC-04 — Student Takes a Quiz

| Field | Detail |
|---|---|
| **Use Case ID** | UC-04 |
| **Title** | Student attempts a module quiz |
| **Actor** | Student |
| **Precondition** | Student is authenticated. Quiz exists within the module. Student has not exhausted allowed attempts (v1.0: 1 attempt). |
| **Trigger** | Student clicks "Start Quiz" on the module page (e.g., "Module 2 Knowledge Check") |
| **Main Flow** | 1. System displays the quiz intro: title, number of questions, time limit (if set) <br> 2. Student clicks "Begin" — timer starts if applicable <br> 3. System presents questions one at a time, each with multiple-choice options <br> 4. Student selects an answer and clicks "Next" <br> 5. Repeat for all questions <br> 6. Student clicks "Submit Quiz" on the final question <br> 7. System calculates score server-side, creates QuizAttempt record <br> 8. Results screen shows score, percentage, and per-question feedback |
| **Alternate Flow** | Timer expires → System auto-submits with answers provided so far |
| **Postcondition** | QuizAttempt record saved with score. Dashboard updated with quiz result badge. |
| **Business Rule** | Score is always calculated server-side to prevent client-side manipulation. |

---

#### UC-05 — Instructor Creates a Module and Lesson

| Field | Detail |
|---|---|
| **Use Case ID** | UC-05 |
| **Title** | Instructor adds a new module and lesson to Web Systems II |
| **Actor** | Instructor (Ronald Eaglin) |
| **Precondition** | Instructor is authenticated. The course "Web Systems II – 521F SP26 ON" exists and is owned by this instructor. |
| **Trigger** | Instructor wants to publish Module 3 content before the next class session |
| **Main Flow** | 1. Instructor navigates to Course Content Editor for Web Systems II <br> 2. Clicks "Add Module" — enters title ("Module 3: Authentication & Security"), saves <br> 3. Clicks "Add Lesson" within Module 3 — enters lesson title, selects content type (Text/Video/File) <br> 4. Enters lesson content in the rich text editor or pastes a video URL <br> 5. Clicks "Save Lesson" <br> 6. Optionally reorders lessons via drag-and-drop <br> 7. Clicks "Publish Module" to make it visible to students |
| **Alternate Flow** | 7a. Instructor saves without publishing → Module is in Draft state, invisible to students |
| **Postcondition** | Module and lesson records created. Students enrolled in the course can now access the content. |
| **Business Rule** | Instructors can only edit courses they own. Admins can edit any course. |

---

#### UC-06 — Admin Enrolls a Student in a Course

| Field | Detail |
|---|---|
| **Use Case ID** | UC-06 |
| **Title** | Admin enrolls a new student in Web Systems II |
| **Actor** | Admin |
| **Precondition** | Admin is authenticated. Student account exists. Course exists. |
| **Trigger** | A new student registered and needs access to Web Systems II – 521F SP26 ON |
| **Main Flow** | 1. Admin navigates to Admin Dashboard → User Management <br> 2. Locates the student record <br> 3. Clicks "Enroll in Course" <br> 4. Selects "Web Systems II – 521F SP26 ON" from the course dropdown <br> 5. Clicks "Confirm Enrollment" <br> 6. System creates an Enrollment record and associates the student with the course <br> 7. Student's dashboard now shows Web Systems II |
| **Postcondition** | Enrollment record created. Student has immediate access to all published course content. |
| **Business Rule** | A student cannot be enrolled in the same course twice. Duplicate enrollment attempt shows a warning. |

---

### 6.2 Task Analysis

Task analysis breaks down the complete lifecycle of a student through Web Systems II – 521F SP26 ON, identifying the steps, decisions, and system interactions at each phase.

---

#### Phase 1 — Onboarding

**Goal:** Get the student from "new user" to "actively viewing course content"

```
Student receives LMS link
        │
        ▼
  Account exists?
  ┌─────┴─────┐
 NO           YES
  │             │
  ▼             ▼
Register      Login
(email +      (email +
role=Student) password)
  │             │
  └─────┬───────┘
        ▼
  JWT issued → stored in localStorage
        │
        ▼
  Admin enrolls student in
  Web Systems II – 521F SP26 ON
        │
        ▼
  Student Dashboard loads
  showing enrolled course
```

**Subtasks:**
1. Navigate to LMS URL
2. Choose Register or Login
3. Fill in credentials (Register: email, password, first name, last name, role=Student)
4. Receive confirmation and dashboard redirect
5. Verify Web Systems II appears on dashboard

**Cognitive load:** Low — linear flow with minimal decisions. Single form, clear CTA.

---

#### Phase 2 — Content Navigation

**Goal:** Student finds and consumes the right lesson at the right time

```
Student Dashboard
        │
        ▼
  Click "Web Systems II"
        │
        ▼
  Course Page — Module Tree
  ┌─────────────────────┐
  │ ▶ Module 1 (Done ✅) │
  │ ▶ Module 2 (Done ✅) │
  │ ▶ Module 3 (Active) │  ← expanded
  │   └─ Lesson 3.1     │
  │   └─ Lesson 3.2     │  ← current
  │   └─ Lesson 3.3     │
  │ ▶ Module 4 (Locked) │
  └─────────────────────┘
        │
        ▼
  Click lesson → Lesson content renders
        │
        ▼
  Read/Watch content
        │
        ▼
  Click "Mark as Complete"
        │
        ▼
  Progress bar updates → return to module tree
```

**Subtasks:**
1. Identify which module is active
2. Identify which lesson is next (via visual cues: lock icons, check marks)
3. Click lesson to open
4. Consume content (read text, watch video, or download file)
5. Mark lesson complete
6. Decide: continue to next lesson, or exit

**Cognitive load:** Medium — student must track their own position in a multi-level hierarchy (course → module → lesson).

---

#### Phase 3 — Assignment Completion

**Goal:** Submit quality work before the due date

```
Dashboard shows assignment alert
"Assignment 3 due in 2 days"
        │
        ▼
  Click assignment → Assignment detail page
        │
        ▼
  Read description & rubric
        │
        ▼
  Write response in rich text editor
        │
  Attach file? ──Yes──► Upload file
        │
        ▼
  Click "Submit"
        │
  ┌─────┴──────┐
Past due?       On time
  │                │
  ▼                ▼
Blocked      Submission saved
(message)    Success banner shown
                   │
                   ▼
             Status → "Submitted"
             on dashboard
```

**Subtasks:**
1. Locate the assignment from dashboard or module view
2. Read the full prompt and any rubric details
3. Draft response in rich text editor
4. Attach supporting files if required
5. Submit before due date
6. Confirm submission was received (check status)

**Cognitive load:** Medium — student must context-switch between the assignment description and their response editor. Rich text toolbar adds minor complexity.

---

#### Phase 4 — Quiz Attempt

**Goal:** Demonstrate knowledge; receive immediate feedback

```
Module page → "Start Quiz" button
        │
        ▼
  Quiz intro screen
  (title, # questions, time limit)
        │
        ▼
  Click "Begin" → Timer starts
        │
        ▼
  ┌─────────────────────┐
  │  Question 1 of 10   │
  │  ○ Option A         │
  │  ○ Option B         │
  │  ● Option C ← pick  │
  │  ○ Option D         │
  │         [Next →]    │
  └─────────────────────┘
        │ (repeat per question)
        ▼
  Final question → "Submit Quiz"
        │
        ▼
  Score calculated server-side
        │
        ▼
  Results screen: score, pass/fail,
  per-question correct/incorrect
```

**Subtasks:**
1. Locate quiz from module page
2. Read quiz intro and note time limit
3. Answer each question sequentially
4. Submit quiz
5. Review results and identify weak areas

**Cognitive load:** Medium-High during quiz (timed pressure + recall). Low on results screen (passive reading).

---

#### Phase 5 — Grade & Progress Review

**Goal:** Student understands their standing in the course

```
Student Dashboard
        │
        ▼
  Progress bar per course (e.g. 60% complete)
        │
        ▼
  Click "View Grades"
        │
        ▼
  ┌──────────────────────────────────┐
  │ Assignment 1    95/100   Graded  │
  │ Assignment 2    --/100   Pending │
  │ Assignment 3    --/100   Submitted│
  │ Quiz 1          8/10     Done    │
  │ Quiz 2          --/10    Not taken│
  └──────────────────────────────────┘
        │
        ▼
  Click graded item → View instructor feedback
```

**Subtasks:**
1. Navigate to grades view
2. Scan assignment/quiz status
3. Identify missing or low-scoring items
4. Click individual items to read instructor feedback
5. Decide on action (resubmit if allowed, review material)

**Cognitive load:** Low — mostly read-only. Feedback display requires clear visual hierarchy to avoid overwhelm.

---

### 6.3 UI Screen Designs

All screens use Bootstrap 5 responsive layout. The navigation bar is persistent across all authenticated views. The course **Web Systems II – 521F SP26 ON** is used as the working example in all mockups.

> **Legend:**  
> `[Button]` = Clickable button &nbsp;|&nbsp; `(input)` = Text input field &nbsp;|&nbsp; `{dropdown}` = Dropdown select &nbsp;|&nbsp; `[x]` = Checkbox

---

#### Screen 1 — Login / Register

**Full Design**

```
┌──────────────────────────────────────────────────────────────────┐
│                    🎓 Daytona College LMS                        │
│                  Web Systems II – 521F SP26 ON                   │
├──────────────────────────────────────────────────────────────────┤
│                                                                  │
│              ┌─────────────────────────────────┐                │
│              │           Welcome Back           │               │
│              │                                  │               │
│              │  Email                           │               │
│              │  (user@daytonacollege.edu      ) │               │
│              │                                  │               │
│              │  Password                        │               │
│              │  (••••••••••••••••••••          ) │              │
│              │                                  │               │
│              │         [  Log In  ]             │               │
│              │                                  │               │
│              │  ─────────────── or ──────────── │               │
│              │                                  │               │
│              │  Don't have an account?          │               │
│              │  [ Create Account ]              │               │
│              └─────────────────────────────────┘                │
│                                                                  │
│  ⚠ Error state: "Invalid email or password. Please try again."  │
│     (shown inline below password field, red text)               │
│                                                                  │
└──────────────────────────────────────────────────────────────────┘
```

**Register variant (toggled by "Create Account"):**

```
              │  First Name         Last Name        │
              │  (Jose            ) (Melendez       )│
              │  Email                               │
              │  (jose@email.com                   ) │
              │  Password                            │
              │  (••••••••••••••••••••             ) │
              │  Role                               │
              │  { Student ▾ }                      │
              │       [ Create Account ]            │
```

**Data Fields:**

| Field | Type | Validation |
|---|---|---|
| Email | Text / email | Required, valid email format, must exist in DB on login |
| Password | Password (masked) | Required, min 8 chars on register |
| First Name | Text | Required on register only |
| Last Name | Text | Required on register only |
| Role | Dropdown: Student / Instructor | Required on register; defaults to Student |

---

#### Screen 2 — Student Dashboard

**Full Design**

```
┌──────────────────────────────────────────────────────────────────────────┐
│ 🎓 Daytona LMS   [Courses] [Grades] [Profile]          Jose M. [Logout] │
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  Welcome back, Jose!                          📅 Sat, Feb 21, 2026       │
│                                                                          │
│  ╔══════════════════════════════════════════════════════════════╗        │
│  ║  📘 Web Systems II – 521F SP26 ON                            ║        │
│  ║  Instructor: Ronald Eaglin                                   ║        │
│  ║                                                              ║        │
│  ║  Progress: ████████████░░░░░░░░░░  60%                       ║        │
│  ║                                                              ║        │
│  ║  ⚠ Assignment 3 due in 2 days                               ║        │
│  ║  ✅ Quiz 1 — Score: 8/10                                     ║        │
│  ║  🔔 Module 3 content now available                           ║        │
│  ║                                                              ║        │
│  ║              [ Go to Course → ]                              ║        │
│  ╚══════════════════════════════════════════════════════════════╝        │
│                                                                          │
│  ┌──────────────────────┐  ┌──────────────────────┐                     │
│  │  📋 Upcoming          │  │  ✅ Recent Activity   │                    │
│  │  ─────────────────── │  │  ─────────────────── │                    │
│  │  Assignment 3  2 days │  │  Lesson 2.3  Done    │                    │
│  │  Quiz 2       5 days  │  │  Quiz 1      8/10    │                    │
│  │  Assignment 4  2 wks  │  │  Lesson 2.2  Done    │                    │
│  └──────────────────────┘  └──────────────────────┘                     │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘
```

---

#### Screen 3 — Course / Module View

**Full Design**

```
┌──────────────────────────────────────────────────────────────────────────┐
│ 🎓 Daytona LMS   [Courses] [Grades] [Profile]          Jose M. [Logout] │
├─────────────────┬────────────────────────────────────────────────────────┤
│                 │                                                        │
│  MODULE TREE    │  Lesson 3.2 – JWT Authentication Flow                 │
│  ─────────────  │  ─────────────────────────────────────────────────── │
│                 │                                                        │
│  ✅ Module 1    │  In this lesson we examine how JSON Web Tokens are     │
│  ✅ Module 2    │  generated on login, stored client-side, and attached  │
│  ▼ Module 3 🔓  │  to subsequent API requests via the Authorization      │
│    ✅ L3.1      │  header. We will implement verifyToken middleware...   │
│    ▶ L3.2 ←    │                                                        │
│    ○ L3.3      │  [  Video: JWT Explained (12 min)  ▶  ]               │
│    ○ L3.4      │                                                        │
│  🔒 Module 4    │  📎 Download: jwt-middleware-example.js               │
│  🔒 Module 5    │                                                        │
│  🔒 Module 6    │  ─────────────────────────────────────────────────── │
│                 │                                                        │
│                 │     [ ← Previous Lesson ]   [ Mark Complete ✓ ]       │
│                 │                    [ Next Lesson → ]                  │
│                 │                                                        │
├─────────────────┴────────────────────────────────────────────────────────┤
│  Course Progress: ████████████░░░░░░░░░░  60%   Module 3: 1/4 lessons   │
└──────────────────────────────────────────────────────────────────────────┘
```

---

#### Screen 4 — Assignment Submission

**Shortcut Design** (standard data entry screen)

| Field | Type | Notes |
|---|---|---|
| Assignment title | Text (read-only) | e.g., "Assignment 3 – Project Documentation" |
| Description / Prompt | Rich text (read-only) | Instructor-authored rubric |
| Due date | Text (read-only) | e.g., "Feb 28, 2026 11:59 PM" |
| Max score | Text (read-only) | e.g., "100 points" |
| Response body | Rich text editor (react-quill) | Student types or pastes their submission |
| File attachment | File upload input | Optional; base64 encoded in v1.0 |
| Submit button | Button | Disabled if past due date |

**States:** Pending → Submitted → Graded  
**Validation:** Response body must not be empty on submit.

---

#### Screen 5 — Quiz Interface

**Full Design**

```
┌──────────────────────────────────────────────────────────────────────────┐
│ 🎓 Daytona LMS                                         ⏱ 12:43 remaining│
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  Module 3 Knowledge Check                     Question 4 of 10          │
│  ─────────────────────────────────────────────────────────────────────  │
│                                                                          │
│  Which of the following correctly describes the role of Prisma in        │
│  a Node.js / Azure SQL application?                                      │
│                                                                          │
│    ○  A)  Prisma is a CSS framework for styling React components         │
│                                                                          │
│    ○  B)  Prisma is a cloud hosting provider for Node.js apps            │
│                                                                          │
│    ●  C)  Prisma is an ORM that maps database tables to JavaScript       │
│           objects and auto-generates a typed query client                │
│                                                                          │
│    ○  D)  Prisma is a testing library for Express.js routes              │
│                                                                          │
│  ─────────────────────────────────────────────────────────────────────  │
│                                                                          │
│  Progress:  ████████░░░░░░░░░░░░  4 / 10                                │
│                                                                          │
│                        [ ← Back ]   [ Next → ]                          │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘
```

**Results Screen:**

```
┌──────────────────────────────────────────────────────────────────────────┐
│                        Quiz Complete! 🎉                                 │
│                                                                          │
│                    Your Score:  8 / 10  (80%)                           │
│                    ████████████████░░░░  Passed ✅                       │
│                                                                          │
│  Q1  ✅  Q2  ✅  Q3  ❌  Q4  ✅  Q5  ✅                                 │
│  Q6  ✅  Q7  ❌  Q8  ✅  Q9  ✅  Q10 ✅                                 │
│                                                                          │
│             [ Review Answers ]   [ Back to Module ]                     │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘
```

---

#### Screen 6 — Instructor Dashboard

**Full Design**

```
┌──────────────────────────────────────────────────────────────────────────┐
│ 🎓 Daytona LMS   [My Courses] [Submissions] [Profile]  Ronald E. [Logout]│
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  Instructor Dashboard                         📅 Sat, Feb 21, 2026      │
│                                                                          │
│  ┌────────────────────┐ ┌────────────────────┐ ┌────────────────────┐  │
│  │  👥 Enrolled       │ │  📋 Pending Grading │ │  📊 Avg Progress   │  │
│  │       24 Students  │ │      7 Submissions  │ │          63%       │  │
│  └────────────────────┘ └────────────────────┘ └────────────────────┘  │
│                                                                          │
│  My Courses                                    [ + Create New Course ]  │
│  ─────────────────────────────────────────────────────────────────────  │
│                                                                          │
│  ╔═════════════════════════════════════════════════════════════════╗    │
│  ║  📘 Web Systems II – 521F SP26 ON          ● Published         ║    │
│  ║  24 students  |  6 modules  |  18 lessons                      ║    │
│  ║                                                                 ║    │
│  ║  [ Edit Content ]  [ View Submissions ]  [ Quiz Builder ]      ║    │
│  ╚═════════════════════════════════════════════════════════════════╝    │
│                                                                          │
│  Needs Grading                                                          │
│  ─────────────────────────────────────────────────────────────────────  │
│  Jose M.       Assignment 3 – Project Documentation    Submitted 2h ago │
│  Maria R.      Assignment 3 – Project Documentation   Submitted 5h ago  │
│  David K.      Assignment 2 – Stack Selection         Submitted 1d ago  │
│                                       [ View All Submissions → ]        │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘
```

---

#### Screen 7 — Course Content Editor

**Shortcut Design** (management screen)

| Element | Type | Notes |
|---|---|---|
| Module title | Text input | e.g., "Module 3: Authentication & Security" |
| Module order | Number input | Auto-increments; drag to reorder |
| Published toggle | Toggle switch | Controls student visibility |
| Lesson title | Text input | Per-lesson field |
| Lesson content type | Dropdown: Text / Video / File | Determines content editor shown |
| Lesson content body | Rich text editor (Text) OR URL input (Video) OR file upload (File) | Conditional on content type |
| Lesson order | Number / drag handle | Drag-to-reorder within module |
| Save / Discard | Buttons | Draft save vs. discard changes |

---

#### Screen 8 — Assignment & Quiz Builder

**Shortcut Design** (two related forms)

**Assignment Builder:**

| Field | Type | Notes |
|---|---|---|
| Title | Text input | e.g., "Assignment 3 – Project Documentation" |
| Description / Prompt | Rich text editor | Full rubric and instructions |
| Due date | Date-time picker | Deadline for submissions |
| Max score | Number input | e.g., 100 |
| Module | Dropdown | Associates assignment with a module |
| Allow resubmit | Toggle | Enables student overwrite |

**Quiz Builder:**

| Field | Type | Notes |
|---|---|---|
| Quiz title | Text input | e.g., "Module 3 Knowledge Check" |
| Time limit (minutes) | Number input | Leave blank for untimed |
| Module | Dropdown | Associates quiz with a module |
| Question text | Text area (per question) | The question stem |
| Options A–D | Text inputs (×4 per question) | Multiple choice options |
| Correct answer | Radio button (A/B/C/D) | Marks correct option |
| [ + Add Question ] | Button | Appends a new question block |

---

#### Screen 9 — Grading View

**Shortcut Design** (evaluation screen)

| Element | Type | Notes |
|---|---|---|
| Student name | Text (read-only) | e.g., "Jose Melendez" |
| Assignment name | Text (read-only) | e.g., "Assignment 3 – Project Documentation" |
| Submission date | Text (read-only) | Timestamp |
| Submission body | Rich text (read-only) | Student's written response |
| Attached file | Download link | If student attached a file |
| Score | Number input | e.g., 92 (out of 100) |
| Feedback | Text area | Instructor written comments |
| [ Save Grade ] | Button | Saves score and feedback to Submission record |
| [ Next Ungraded → ] | Button | Jumps to next pending submission |

---

#### Screen 10 — Admin Dashboard

**Full Design**

```
┌──────────────────────────────────────────────────────────────────────────┐
│ 🎓 Daytona LMS   [Users] [Courses] [Enrollments] [Reports]  Admin [Logout]│
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  Admin Dashboard                                                         │
│                                                                          │
│  ┌──────────────────┐ ┌──────────────────┐ ┌──────────────────┐        │
│  │  👥 Total Users  │ │  📘 Courses      │ │  📋 Enrollments  │        │
│  │        31        │ │        4         │ │        48        │        │
│  └──────────────────┘ └──────────────────┘ └──────────────────┘        │
│                                                                          │
│  User Management                                    [ + Add User ]      │
│  ─────────────────────────────────────────────────────────────────────  │
│  Name              Email                   Role        Status  Actions  │
│  Jose Melendez     jose@email.com          Student     Active  [Edit]   │
│  Maria Rodriguez   maria@email.com         Student     Active  [Edit]   │
│  Ronald Eaglin     ronald@daytona.edu      Instructor  Active  [Edit]   │
│  David Kim         david@email.com         Student     Active  [Edit]   │
│                                        [ ← Prev ]  Page 1 of 3  [Next →]│
│                                                                          │
│  Course Enrollments                        [ + Enroll Student ]         │
│  ─────────────────────────────────────────────────────────────────────  │
│  Student: { Select student ▾ }   Course: { Select course ▾ }           │
│                                                    [ Enroll ]           │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘
```

---

### 6.4 Cognitive Walkthrough & Heuristic Evaluation

Each screen is evaluated against **Nielsen's 10 Usability Heuristics** and reviewed via **Cognitive Walkthrough** (asking: will the user know what to do? will they know if they did it right?).

**Heuristic Reference:**

| # | Heuristic |
|:---:|---|
| H1 | Visibility of system status |
| H2 | Match between system and real world |
| H3 | User control and freedom |
| H4 | Consistency and standards |
| H5 | Error prevention |
| H6 | Recognition rather than recall |
| H7 | Flexibility and efficiency of use |
| H8 | Aesthetic and minimalist design |
| H9 | Help users recognize, diagnose, and recover from errors |
| H10 | Help and documentation |

---

#### Evaluation — Screen 1: Login / Register

**Cognitive Walkthrough**

| Step | Question | Assessment |
|---|---|---|
| Arrives at login page | Will the user know what to do? | ✅ Yes — email/password fields and "Log In" button are immediately visible and familiar |
| Types wrong password | Will they know something went wrong? | ✅ Yes — inline error message below password field, red text |
| Needs to register | Can they find the path? | ✅ Yes — "Create Account" link is clearly visible below the login button |
| Role selection on register | Will they choose the right role? | ⚠️ Risk — a student might accidentally select Instructor. Mitigation: default to Student, add tooltip explaining roles |

**Heuristic Evaluation**

| Heuristic | Rating | Notes |
|---|:---:|---|
| H1 Visibility of system status | ✅ Pass | JWT login feedback immediate; error state shown inline |
| H2 Match with real world | ✅ Pass | Standard email/password convention; familiar pattern |
| H3 User control and freedom | ✅ Pass | Toggle between Login and Register is frictionless |
| H4 Consistency and standards | ✅ Pass | Follows Bootstrap form conventions |
| H5 Error prevention | ⚠️ Partial | Role default prevents wrong selection; no email format hint on type |
| H6 Recognition vs. recall | ✅ Pass | No memorization required; email is saved by browser autofill |
| H7 Flexibility | ⚠️ Partial | No "Remember me" or SSO in v1.0 |
| H8 Aesthetic and minimalist | ✅ Pass | Single card, no extraneous elements |
| H9 Error recovery | ✅ Pass | Password field clears on failed login; email retained for correction |
| H10 Help and documentation | ⚠️ Partial | No "Forgot password" in v1.0 — future enhancement |

**Severity Issues:** Low. The role selection default resolves the primary risk.

---

#### Evaluation — Screen 2: Student Dashboard

**Cognitive Walkthrough**

| Step | Question | Assessment |
|---|---|---|
| Lands on dashboard | Will student know where they are? | ✅ Yes — "Welcome back, Jose!" header and course card are immediately visible |
| Sees assignment warning | Will they understand urgency? | ✅ Yes — "⚠ Assignment 3 due in 2 days" is highlighted in the course card |
| Wants to start working | Will they know how to navigate to the course? | ✅ Yes — "Go to Course →" CTA button is prominent |
| Multiple courses in future | Will it scale? | ⚠️ Risk — card layout may feel cluttered with 4+ courses; pagination or tabs needed in future |

**Heuristic Evaluation**

| Heuristic | Rating | Notes |
|---|:---:|---|
| H1 Visibility of system status | ✅ Pass | Progress bar, due-date alerts, and recent activity all visible without navigation |
| H2 Match with real world | ✅ Pass | "Dashboard" metaphor aligns with student familiarity from other platforms (Canvas, Blackboard) |
| H3 User control and freedom | ✅ Pass | Student can navigate to any section from the persistent nav bar |
| H4 Consistency and standards | ✅ Pass | Card-based layout consistent with industry LMS patterns |
| H5 Error prevention | ✅ Pass | Due-date warnings proactively surface risk items |
| H6 Recognition vs. recall | ✅ Pass | All key information surfaced on one screen — no memorization needed |
| H7 Flexibility | ⚠️ Partial | No keyboard shortcuts or quick-jump in v1.0 |
| H8 Aesthetic and minimalist | ✅ Pass | Two-column bottom section cleanly separates upcoming vs. activity |
| H9 Error recovery | N/A | Read-only screen — no errors to recover from |
| H10 Help and documentation | ⚠️ Partial | No onboarding tour for first-time users in v1.0 |

**Severity Issues:** Low. Dashboard is information-dense but well-organized.

---

#### Evaluation — Screen 3: Course / Module View

**Cognitive Walkthrough**

| Step | Question | Assessment |
|---|---|---|
| Opens course | Will student understand the module tree? | ✅ Yes — expand/collapse with ✅/🔒 icons makes status clear |
| Navigating lessons | Will they know which lesson is current? | ✅ Yes — highlighted "▶ L3.2" indicates active position |
| Locked modules | Will they understand why Module 4 is locked? | ⚠️ Risk — lock icon is visible but reason is not stated. Tooltip "Complete Module 3 to unlock" needed |
| Marks lesson complete | Will they know it worked? | ✅ Yes — button changes to ✅, progress bar updates, tree item gains checkmark |

**Heuristic Evaluation**

| Heuristic | Rating | Notes |
|---|:---:|---|
| H1 Visibility of system status | ✅ Pass | Progress bar at bottom is always visible; checkmarks in tree are real-time |
| H2 Match with real world | ✅ Pass | Textbook chapter/section metaphor is familiar to students |
| H3 User control and freedom | ✅ Pass | Previous/Next lesson buttons allow non-linear navigation within unlocked modules |
| H4 Consistency and standards | ✅ Pass | Sidebar + main content is a standard documentation/course pattern |
| H5 Error prevention | ✅ Pass | Locked modules prevent accessing content out of sequence |
| H6 Recognition vs. recall | ✅ Pass | Visual icons replace need to remember progress state |
| H7 Flexibility | ⚠️ Partial | No search within course content in v1.0 |
| H8 Aesthetic and minimalist | ✅ Pass | Clean split layout; content area is distraction-free |
| H9 Error recovery | ✅ Pass | "Mark Complete" is reversible in same session |
| H10 Help and documentation | ⚠️ Partial | No tooltip on lock icons explaining unlock condition |

**Severity Issues:** Low-Medium. Lock icon tooltip is a quick win — add in Module 3 sprint.

---

#### Evaluation — Screen 5: Quiz Interface

**Cognitive Walkthrough**

| Step | Question | Assessment |
|---|---|---|
| Starts quiz | Will student understand the rules upfront? | ✅ Yes — intro screen shows question count and time limit before committing |
| During quiz | Will they know where they are? | ✅ Yes — "Question 4 of 10" and progress bar always visible |
| Timer pressure | Will the countdown cause panic errors? | ⚠️ Risk — timer in top-right may be missed. Consider color change at <3 min remaining (yellow → red) |
| Submits quiz | Will they know the quiz is over? | ✅ Yes — results screen with score and per-question feedback is immediate |
| Back navigation | Can they change a previous answer? | ⚠️ Risk — "← Back" button allows it but current implementation must decide: allow change or review only |

**Heuristic Evaluation**

| Heuristic | Rating | Notes |
|---|:---:|---|
| H1 Visibility of system status | ✅ Pass | Timer, question counter, progress bar all visible simultaneously |
| H2 Match with real world | ✅ Pass | Multiple-choice format mirrors physical/Canvas quizzes students know |
| H3 User control and freedom | ⚠️ Partial | Back navigation allowed but "undo after submit" is not — needs clear messaging |
| H4 Consistency and standards | ✅ Pass | Radio button selection is standard; no unexpected UI patterns |
| H5 Error prevention | ✅ Pass | Confirmation dialog before final submit: "Are you sure? You cannot reopen this quiz." |
| H6 Recognition vs. recall | ✅ Pass | All options visible simultaneously — no scrolling per question |
| H7 Flexibility | ⚠️ Partial | No flag-for-review feature in v1.0 |
| H8 Aesthetic and minimalist | ✅ Pass | Single question per screen eliminates cognitive overload from seeing all questions at once |
| H9 Error recovery | ⚠️ Partial | Timer expiry auto-submits — no recovery. Must be clearly disclosed on intro screen |
| H10 Help and documentation | ⚠️ Partial | No instructions for handling a browser crash mid-quiz in v1.0 |

**Severity Issues:** Medium. Timer UX (color change at low time) and auto-submit disclosure are important for student fairness — prioritize in Module 4 sprint.

---

#### Evaluation — Screen 6: Instructor Dashboard

**Cognitive Walkthrough**

| Step | Question | Assessment |
|---|---|---|
| Instructor logs in | Will they see the most urgent task first? | ✅ Yes — "Needs Grading" section surfaces pending submissions immediately |
| Managing courses | Will they find content editing? | ✅ Yes — "Edit Content" CTA is on every course card |
| Stat cards | Will instructors understand what the numbers mean? | ✅ Yes — labeled clearly: "Enrolled," "Pending Grading," "Avg Progress" |
| Multiple courses | Will they distinguish between courses? | ✅ Yes — course name and enrollment count are prominent on each card |

**Heuristic Evaluation**

| Heuristic | Rating | Notes |
|---|:---:|---|
| H1 Visibility of system status | ✅ Pass | Stat cards give immediate snapshot of course health |
| H2 Match with real world | ✅ Pass | "Grade book" and "pending submissions" are familiar instructor concepts |
| H3 User control and freedom | ✅ Pass | Instructor can reach any function from this screen within 2 clicks |
| H4 Consistency and standards | ✅ Pass | Consistent with industry LMS instructor views |
| H5 Error prevention | ✅ Pass | Destructive actions (delete course) not accessible from dashboard — requires deliberate navigation |
| H6 Recognition vs. recall | ✅ Pass | All key actions labeled on visible buttons |
| H7 Flexibility | ✅ Pass | "Next Ungraded →" in grading view enables efficient batch grading workflow |
| H8 Aesthetic and minimalist | ✅ Pass | Stat cards + course card + grading list is dense but well-structured |
| H9 Error recovery | ✅ Pass | Grade saves are confirmed; no accidental submission is possible |
| H10 Help and documentation | ⚠️ Partial | No in-app guide for new instructors setting up a course for the first time |

**Severity Issues:** Low. Dashboard is task-focused and efficient for experienced instructors.

---

#### Evaluation — Screen 10: Admin Dashboard

**Cognitive Walkthrough**

| Step | Question | Assessment |
|---|---|---|
| Admin logs in | Will they orient quickly? | ✅ Yes — stat cards and user table are immediately visible |
| Enrolling a student | Will they find the enrollment form? | ✅ Yes — enrollment section is on the same page with clear dropdowns |
| Editing a user | Will they know how? | ✅ Yes — [Edit] button on each row |
| Paginating users | Will they know there are more? | ✅ Yes — "Page 1 of 3" with Prev/Next is standard pagination |

**Heuristic Evaluation**

| Heuristic | Rating | Notes |
|---|:---:|---|
| H1 Visibility of system status | ✅ Pass | Aggregate stats visible immediately |
| H2 Match with real world | ✅ Pass | User table matches admin panel conventions |
| H3 User control and freedom | ✅ Pass | Admin can navigate between Users, Courses, Enrollments, Reports from nav bar |
| H4 Consistency and standards | ✅ Pass | Tabular data with action buttons follows standard admin UI patterns |
| H5 Error prevention | ✅ Pass | Duplicate enrollment warning prevents accidental double-enrollment |
| H6 Recognition vs. recall | ✅ Pass | All CRUD actions labeled; no hidden menus |
| H7 Flexibility | ⚠️ Partial | No bulk enrollment (e.g., CSV upload) in v1.0 |
| H8 Aesthetic and minimalist | ⚠️ Partial | Admin screens are information-dense — clear column headers are essential |
| H9 Error recovery | ✅ Pass | Deactivate vs. delete user prevents accidental permanent data loss |
| H10 Help and documentation | ⚠️ Partial | No admin onboarding guide in v1.0 |

**Severity Issues:** Low. The bulk enrollment gap may become a pain point for large cohorts — flag for v2.0.

---

#### Overall Heuristic Summary

| Screen | H1 | H2 | H3 | H4 | H5 | H6 | H7 | H8 | H9 | H10 | Priority Issues |
|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|---|
| Login / Register | ✅ | ✅ | ✅ | ✅ | ⚠ | ✅ | ⚠ | ✅ | ✅ | ⚠ | Role default, forgot password |
| Student Dashboard | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠ | ✅ | N/A | ⚠ | Onboarding tour |
| Course/Module View | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠ | ✅ | ✅ | ⚠ | Lock icon tooltip |
| Assignment Submission | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠ | ✅ | ✅ | ⚠ | Resubmit clarity |
| Quiz Interface | ✅ | ✅ | ⚠ | ✅ | ✅ | ✅ | ⚠ | ✅ | ⚠ | ⚠ | Timer UX, auto-submit disclosure |
| Instructor Dashboard | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠ | New instructor guide |
| Admin Dashboard | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠ | ⚠ | ✅ | ⚠ | Bulk enrollment (v2.0) |

> **Legend:** ✅ Pass &nbsp;|&nbsp; ⚠ Partial / Minor Issue &nbsp;|&nbsp; ❌ Fail


---

## 7. Appendix

### 7.1 Glossary

| Term | Definition |
|---|---|
| LMS | Learning Management System – a software platform for creating, delivering, and tracking educational content |
| API | Application Programming Interface – a defined set of endpoints for programs to communicate |
| REST | Representational State Transfer – a stateless HTTP-based API design convention |
| JWT | JSON Web Token – a signed token used to authenticate and authorize API requests |
| CRUD | Create, Read, Update, Delete – the four fundamental database operations |
| ORM | Object-Relational Mapper – translates between database tables and code objects (Prisma here) |
| Prisma | Open-source Node.js ORM with full MS SQL Server / Azure SQL support |
| Vite | Next-generation frontend build tool; replaces Create React App with faster performance |
| RBAC | Role-Based Access Control – permissions determined by assigned role (Admin/Instructor/Student) |
| CI/CD | Continuous Integration / Continuous Deployment – automated test-build-deploy pipeline |
| Azure App Service | Microsoft Azure's fully managed platform for hosting web applications |
| Azure SQL | Microsoft's fully managed cloud SQL Server database service |

### 7.2 Key References and Resources

- [React Documentation](https://react.dev)
- [Vite Documentation](https://vitejs.dev)
- [Express.js Documentation](https://expressjs.com)
- [Prisma Documentation (MS SQL Server)](https://prisma.io/docs/orm/overview/databases/sql-server)
- [Azure App Service](https://docs.microsoft.com/azure/app-service)
- [Azure SQL Database](https://docs.microsoft.com/azure/azure-sql)
- [GitHub Actions for Azure](https://docs.microsoft.com/azure/app-service/deploy-github-actions)
- [Azure Data Studio](https://docs.microsoft.com/sql/azure-data-studio)
- [Bootstrap 5](https://getbootstrap.com/docs/5.3)
- [jsonwebtoken npm](https://npmjs.com/package/jsonwebtoken)
- [bcryptjs npm](https://npmjs.com/package/bcryptjs)

### 7.3 Database ER Diagram

> ⚑ Attach ER diagram here. Recommended free tool: [dbdiagram.io](https://dbdiagram.io) — paste your Prisma schema directly and it generates the diagram automatically. Export as PNG and insert here in Module 2.

_[ ER Diagram — to be added in Module 2 ]_

### 7.4 Architecture Diagram

> ⚑ Add a three-tier architecture diagram showing Client → Express API → Azure SQL. Recommended tools: [draw.io](https://draw.io) (free), Lucidchart, or Miro.

_[ Architecture Diagram — to be added in Module 2 ]_

### 7.5 Live Application URL

> ⚑ Add the live Azure URL after deployment in Module 5.

| Item | Value |
|---|---|
| Live URL | _[ To be added after Module 5 deployment ]_ |
| GitHub Repository | _[ Paste your repo URL here ]_ |
| Deployment Date | _[ To be filled in ]_ |

### 7.6 Revision History

| Version | Date | Author | Changes |
|:---:|:---:|---|---|
| 1.0 | 02/17/2026 | Jose A. Melendez | Initial Module 1 submission – full documentation template, confirmed stack, architecture, DB design, and setup checklist |
| 2.0 | 02/21/2026 | Jose A. Melendez | Assignment 4 – Added Section 6 UI/UX Design Documentation: Use Case Scenarios, Task Analysis, 10 Screen Designs, Cognitive Walkthrough & Heuristic Evaluation |
| 3.0 | 02/21/2026 | Jose A. Melendez | Assignment 5 – Added Section 5 Development Documentation Standards: Purpose & Overview, Full Stack Elements & Connectors, Language & Coding Standards, Code Conventions, Directory Structure, Code Modules & Object Overview, Platform & Hosting Continuity Guide |

---

<div align="center">

**Web Systems II – 521F SP26 ON | Jose A. Melendez | v1.0**

</div>
