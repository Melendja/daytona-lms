<div align="center">

# 🎓 Daytona College Class Module LMS

### Full-Stack Learning Management System — Alternative Presentation Platform

![Status](https://img.shields.io/badge/Status-In%20Progress-yellow)
![Module](https://img.shields.io/badge/Module-1%20Complete-green)
![Stack](https://img.shields.io/badge/Stack-React%20%7C%20Node.js%20%7C%20Azure%20SQL-blue)
![Budget](https://img.shields.io/badge/Azure%20Budget-%24100%20Student%20Credit-orange)

**Course:** Web Systems II – 521F SP26 ON  
**Developer:** Jose A. Melendez  
**Instructor:** Ronald Eaglin  
**Version:** 1.0 – Initial Draft  
**Last Updated:** 02/17/2026

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
5. [Appendix](#5-appendix)

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

## 5. Appendix

### 5.1 Glossary

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

### 5.2 Key References and Resources

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

### 5.3 Database ER Diagram

> ⚑ Attach ER diagram here. Recommended free tool: [dbdiagram.io](https://dbdiagram.io) — paste your Prisma schema directly and it generates the diagram automatically. Export as PNG and insert here in Module 2.

_[ ER Diagram — to be added in Module 2 ]_

### 5.4 Architecture Diagram

> ⚑ Add a three-tier architecture diagram showing Client → Express API → Azure SQL. Recommended tools: [draw.io](https://draw.io) (free), Lucidchart, or Miro.

_[ Architecture Diagram — to be added in Module 2 ]_

### 5.5 Live Application URL

> ⚑ Add the live Azure URL after deployment in Module 5.

| Item | Value |
|---|---|
| Live URL | _[ To be added after Module 5 deployment ]_ |
| GitHub Repository | _[ Paste your repo URL here ]_ |
| Deployment Date | _[ To be filled in ]_ |

### 5.6 Revision History

| Version | Date | Author | Changes |
|:---:|:---:|---|---|
| 1.0 | 02/17/2026 | Jose A. Melendez | Initial Module 1 submission – full documentation template completed with confirmed stack, architecture, DB design, and setup checklist |
| 2.0 | _[Module 2]_ | Jose A. Melendez | Update with actual module deadlines, DB schema refinements, ER diagram |
| 3.0 | _[Module 5]_ | Jose A. Melendez | Add live Azure URL, CI/CD configuration, deployment screenshots |

---

<div align="center">

**Web Systems II – 521F SP26 ON | Jose A. Melendez | v1.0**

</div>
