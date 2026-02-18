BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[User] (
    [userId] INT NOT NULL IDENTITY(1,1),
    [email] NVARCHAR(1000) NOT NULL,
    [passwordHash] NVARCHAR(1000) NOT NULL,
    [role] NVARCHAR(1000) NOT NULL CONSTRAINT [User_role_df] DEFAULT 'STUDENT',
    [firstName] NVARCHAR(1000) NOT NULL,
    [lastName] NVARCHAR(1000) NOT NULL,
    [isActive] BIT NOT NULL CONSTRAINT [User_isActive_df] DEFAULT 1,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [User_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT [User_pkey] PRIMARY KEY CLUSTERED ([userId]),
    CONSTRAINT [User_email_key] UNIQUE NONCLUSTERED ([email])
);

-- CreateTable
CREATE TABLE [dbo].[Course] (
    [courseId] INT NOT NULL IDENTITY(1,1),
    [title] NVARCHAR(1000) NOT NULL,
    [description] NVARCHAR(1000) NOT NULL,
    [isPublished] BIT NOT NULL CONSTRAINT [Course_isPublished_df] DEFAULT 0,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Course_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [instructorId] INT NOT NULL,
    CONSTRAINT [Course_pkey] PRIMARY KEY CLUSTERED ([courseId])
);

-- CreateTable
CREATE TABLE [dbo].[Enrollment] (
    [enrollmentId] INT NOT NULL IDENTITY(1,1),
    [enrolledAt] DATETIME2 NOT NULL CONSTRAINT [Enrollment_enrolledAt_df] DEFAULT CURRENT_TIMESTAMP,
    [studentId] INT NOT NULL,
    [courseId] INT NOT NULL,
    CONSTRAINT [Enrollment_pkey] PRIMARY KEY CLUSTERED ([enrollmentId]),
    CONSTRAINT [Enrollment_studentId_courseId_key] UNIQUE NONCLUSTERED ([studentId],[courseId])
);

-- CreateTable
CREATE TABLE [dbo].[Module] (
    [moduleId] INT NOT NULL IDENTITY(1,1),
    [title] NVARCHAR(1000) NOT NULL,
    [description] NVARCHAR(1000) NOT NULL CONSTRAINT [Module_description_df] DEFAULT '',
    [orderIndex] INT NOT NULL CONSTRAINT [Module_orderIndex_df] DEFAULT 0,
    [courseId] INT NOT NULL,
    CONSTRAINT [Module_pkey] PRIMARY KEY CLUSTERED ([moduleId])
);

-- CreateTable
CREATE TABLE [dbo].[Lesson] (
    [lessonId] INT NOT NULL IDENTITY(1,1),
    [title] NVARCHAR(1000) NOT NULL,
    [content] NVARCHAR(1000) NOT NULL,
    [contentType] NVARCHAR(1000) NOT NULL CONSTRAINT [Lesson_contentType_df] DEFAULT 'TEXT',
    [orderIndex] INT NOT NULL CONSTRAINT [Lesson_orderIndex_df] DEFAULT 0,
    [moduleId] INT NOT NULL,
    CONSTRAINT [Lesson_pkey] PRIMARY KEY CLUSTERED ([lessonId])
);

-- CreateTable
CREATE TABLE [dbo].[Assignment] (
    [assignmentId] INT NOT NULL IDENTITY(1,1),
    [title] NVARCHAR(1000) NOT NULL,
    [description] NVARCHAR(1000) NOT NULL,
    [dueDate] DATETIME2 NOT NULL,
    [maxScore] INT NOT NULL CONSTRAINT [Assignment_maxScore_df] DEFAULT 100,
    [moduleId] INT NOT NULL,
    CONSTRAINT [Assignment_pkey] PRIMARY KEY CLUSTERED ([assignmentId])
);

-- CreateTable
CREATE TABLE [dbo].[Submission] (
    [submissionId] INT NOT NULL IDENTITY(1,1),
    [content] NVARCHAR(1000) NOT NULL,
    [submittedAt] DATETIME2 NOT NULL CONSTRAINT [Submission_submittedAt_df] DEFAULT CURRENT_TIMESTAMP,
    [score] INT,
    [feedback] NVARCHAR(1000),
    [assignmentId] INT NOT NULL,
    [studentId] INT NOT NULL,
    CONSTRAINT [Submission_pkey] PRIMARY KEY CLUSTERED ([submissionId])
);

-- CreateTable
CREATE TABLE [dbo].[Quiz] (
    [quizId] INT NOT NULL IDENTITY(1,1),
    [title] NVARCHAR(1000) NOT NULL,
    [timeLimitMinutes] INT,
    [moduleId] INT NOT NULL,
    CONSTRAINT [Quiz_pkey] PRIMARY KEY CLUSTERED ([quizId])
);

-- CreateTable
CREATE TABLE [dbo].[QuizQuestion] (
    [questionId] INT NOT NULL IDENTITY(1,1),
    [questionText] NVARCHAR(1000) NOT NULL,
    [optionsJson] NVARCHAR(1000) NOT NULL,
    [correctAnswer] NVARCHAR(1000) NOT NULL,
    [quizId] INT NOT NULL,
    CONSTRAINT [QuizQuestion_pkey] PRIMARY KEY CLUSTERED ([questionId])
);

-- CreateTable
CREATE TABLE [dbo].[QuizAttempt] (
    [attemptId] INT NOT NULL IDENTITY(1,1),
    [answersJson] NVARCHAR(1000) NOT NULL,
    [score] INT NOT NULL,
    [attemptedAt] DATETIME2 NOT NULL CONSTRAINT [QuizAttempt_attemptedAt_df] DEFAULT CURRENT_TIMESTAMP,
    [quizId] INT NOT NULL,
    [studentId] INT NOT NULL,
    CONSTRAINT [QuizAttempt_pkey] PRIMARY KEY CLUSTERED ([attemptId])
);

-- CreateTable
CREATE TABLE [dbo].[LessonProgress] (
    [progressId] INT NOT NULL IDENTITY(1,1),
    [completedAt] DATETIME2 NOT NULL CONSTRAINT [LessonProgress_completedAt_df] DEFAULT CURRENT_TIMESTAMP,
    [lessonId] INT NOT NULL,
    [studentId] INT NOT NULL,
    CONSTRAINT [LessonProgress_pkey] PRIMARY KEY CLUSTERED ([progressId]),
    CONSTRAINT [LessonProgress_lessonId_studentId_key] UNIQUE NONCLUSTERED ([lessonId],[studentId])
);

-- AddForeignKey
ALTER TABLE [dbo].[Course] ADD CONSTRAINT [Course_instructorId_fkey] FOREIGN KEY ([instructorId]) REFERENCES [dbo].[User]([userId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Enrollment] ADD CONSTRAINT [Enrollment_studentId_fkey] FOREIGN KEY ([studentId]) REFERENCES [dbo].[User]([userId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Enrollment] ADD CONSTRAINT [Enrollment_courseId_fkey] FOREIGN KEY ([courseId]) REFERENCES [dbo].[Course]([courseId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Module] ADD CONSTRAINT [Module_courseId_fkey] FOREIGN KEY ([courseId]) REFERENCES [dbo].[Course]([courseId]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Lesson] ADD CONSTRAINT [Lesson_moduleId_fkey] FOREIGN KEY ([moduleId]) REFERENCES [dbo].[Module]([moduleId]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Assignment] ADD CONSTRAINT [Assignment_moduleId_fkey] FOREIGN KEY ([moduleId]) REFERENCES [dbo].[Module]([moduleId]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Submission] ADD CONSTRAINT [Submission_assignmentId_fkey] FOREIGN KEY ([assignmentId]) REFERENCES [dbo].[Assignment]([assignmentId]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Submission] ADD CONSTRAINT [Submission_studentId_fkey] FOREIGN KEY ([studentId]) REFERENCES [dbo].[User]([userId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Quiz] ADD CONSTRAINT [Quiz_moduleId_fkey] FOREIGN KEY ([moduleId]) REFERENCES [dbo].[Module]([moduleId]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[QuizQuestion] ADD CONSTRAINT [QuizQuestion_quizId_fkey] FOREIGN KEY ([quizId]) REFERENCES [dbo].[Quiz]([quizId]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[QuizAttempt] ADD CONSTRAINT [QuizAttempt_quizId_fkey] FOREIGN KEY ([quizId]) REFERENCES [dbo].[Quiz]([quizId]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[QuizAttempt] ADD CONSTRAINT [QuizAttempt_studentId_fkey] FOREIGN KEY ([studentId]) REFERENCES [dbo].[User]([userId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[LessonProgress] ADD CONSTRAINT [LessonProgress_lessonId_fkey] FOREIGN KEY ([lessonId]) REFERENCES [dbo].[Lesson]([lessonId]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[LessonProgress] ADD CONSTRAINT [LessonProgress_studentId_fkey] FOREIGN KEY ([studentId]) REFERENCES [dbo].[User]([userId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
