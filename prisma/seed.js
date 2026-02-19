const { PrismaClient } = require('@prisma/client');
const bcrypt = require('bcryptjs');

const prisma = new PrismaClient();

async function main() {
  console.log('Seeding database...');

  // ── Users ──────────────────────────────────────────
  const adminHash      = await bcrypt.hash('Admin1234!', 12);
  const instructorHash = await bcrypt.hash('Instructor1234!', 12);
  const student1Hash   = await bcrypt.hash('Student1234!', 12);
  const student2Hash   = await bcrypt.hash('Student1234!', 12);

  const instructor = await prisma.user.upsert({
    where:  { email: 'instructor@daytona.edu' },
    update: {},
    create: {
      email:        'instructor@daytona.edu',
      passwordHash: instructorHash,
      firstName:    'Ronald',
      lastName:     'Eaglin',
      role:         'INSTRUCTOR'
    }
  });

  const student1 = await prisma.user.upsert({
    where:  { email: 'student1@daytona.edu' },
    update: {},
    create: {
      email:        'student1@daytona.edu',
      passwordHash: student1Hash,
      firstName:    'Maria',
      lastName:     'Rodriguez',
      role:         'STUDENT'
    }
  });

  const student2 = await prisma.user.upsert({
    where:  { email: 'student2@daytona.edu' },
    update: {},
    create: {
      email:        'student2@daytona.edu',
      passwordHash: student2Hash,
      firstName:    'James',
      lastName:     'Wilson',
      role:         'STUDENT'
    }
  });

  console.log('✔ Users created');

  // ── Course ─────────────────────────────────────────
  const course = await prisma.course.upsert({
    where:  { courseId: 1 },
    update: {},
    create: {
      title:        'Web Systems II',
      description:  'Full-stack web development with cloud deployment. Build and deploy a database-driven client-server web application.',
      isPublished:  true,
      instructorId: instructor.userId
    }
  });

  console.log('✔ Course created');

  // ── Modules ────────────────────────────────────────
  const module1 = await prisma.module.create({
    data: {
      title:       'Module 1: Environment Setup & Documentation',
      description: 'Configure your development environment and document your project architecture.',
      orderIndex:  1,
      courseId:    course.courseId
    }
  });

  const module2 = await prisma.module.create({
    data: {
      title:       'Module 2: Database Design & Backend',
      description: 'Design your database schema, set up Prisma ORM, and build your Express API.',
      orderIndex:  2,
      courseId:    course.courseId
    }
  });

  console.log('✔ Modules created');

  // ── Lessons ────────────────────────────────────────
  await prisma.lesson.createMany({
    data: [
      { title: 'Choosing Your Tech Stack',           content: 'Overview of full-stack technology options and selection criteria.', contentType: 'TEXT', orderIndex: 1, moduleId: module1.moduleId },
      { title: 'Setting Up VS Code & Node.js',       content: 'Install and configure your development environment step by step.', contentType: 'TEXT', orderIndex: 2, moduleId: module1.moduleId },
      { title: 'Git & GitHub Fundamentals',          content: 'Version control basics: init, commit, push, pull, branching.', contentType: 'TEXT', orderIndex: 3, moduleId: module1.moduleId },
      { title: 'Database Schema Design',             content: 'Entity-relationship modeling and translating to Prisma schema.', contentType: 'TEXT', orderIndex: 1, moduleId: module2.moduleId },
      { title: 'Prisma ORM & Migrations',            content: 'Define models, run migrations, and query data with Prisma Client.', contentType: 'TEXT', orderIndex: 2, moduleId: module2.moduleId },
      { title: 'Building REST API with Express',     content: 'Create RESTful endpoints with authentication and role-based access.', contentType: 'TEXT', orderIndex: 3, moduleId: module2.moduleId },
    ]
  });

  console.log('✔ Lessons created');

  // ── Assignment ─────────────────────────────────────
  await prisma.assignment.create({
    data: {
      title:       'Module 1 Documentation Submission',
      description: 'Submit your completed project documentation including executive summary, system architecture, and tech stack.',
      dueDate:     new Date('2026-02-17'),
      maxScore:    100,
      moduleId:    module1.moduleId
    }
  });

  console.log('✔ Assignment created');

  // ── Quiz ───────────────────────────────────────────
  const quiz = await prisma.quiz.create({
    data: {
      title:           'Module 1 Knowledge Check',
      timeLimitMinutes: 15,
      moduleId:        module1.moduleId
    }
  });

  await prisma.quizQuestion.createMany({
    data: [
      {
        questionText:  'Which tool is used to manage database schema and migrations in this project?',
        optionsJson:   JSON.stringify(['Sequelize', 'Prisma', 'TypeORM', 'Mongoose']),
        correctAnswer: 'Prisma',
        quizId:        quiz.quizId
      },
      {
        questionText:  'What does JWT stand for?',
        optionsJson:   JSON.stringify(['Java Web Token', 'JSON Web Token', 'JavaScript Web Transfer', 'JSON Web Transfer']),
        correctAnswer: 'JSON Web Token',
        quizId:        quiz.quizId
      },
      {
        questionText:  'Which Azure service hosts the Node.js backend in this project?',
        optionsJson:   JSON.stringify(['Azure Functions', 'Azure VM', 'Azure App Service', 'Azure Container Apps']),
        correctAnswer: 'Azure App Service',
        quizId:        quiz.quizId
      }
    ]
  });

  console.log('✔ Quiz and questions created');

  // ── Enrollments ────────────────────────────────────
await prisma.enrollment.upsert({
  where:  { studentId_courseId: { studentId: student1.userId, courseId: course.courseId } },
  update: {},
  create: { studentId: student1.userId, courseId: course.courseId }
});

await prisma.enrollment.upsert({
  where:  { studentId_courseId: { studentId: student2.userId, courseId: course.courseId } },
  update: {},
  create: { studentId: student2.userId, courseId: course.courseId }
});

  console.log('✔ Enrollments created');
  console.log('\n✅ Seed complete! Demo accounts:');
  console.log('   Admin:      jose@test.com        / Test1234!');
  console.log('   Instructor: instructor@daytona.edu / Instructor1234!');
  console.log('   Student 1:  student1@daytona.edu   / Student1234!');
  console.log('   Student 2:  student2@daytona.edu   / Student1234!');
}

main()
  .catch(e => { console.error(e); process.exit(1); })
  .finally(() => prisma.$disconnect());