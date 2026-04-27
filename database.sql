-- Settings table
CREATE TABLE `settings` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `key_name` VARCHAR(100) NOT NULL UNIQUE,
    `value` TEXT NOT NULL
) ENGINE=InnoDB;

INSERT INTO `settings` (`key_name`, `value`) VALUES
('bot_status', 'on'),
('reward_per_task', '5.00'),
('min_withdraw', '100.00'),
('referral_bonus', '10.00'),
('daily_bonus', '2.00'),
('currency', 'BDT'),
('support_username', '@admin'),
('admin_password', 'admin123'),
('bot_token', 'YOUR_BOT_TOKEN_HERE'),
('bot_username', 'YourBotUsername');

-- Channels
CREATE TABLE `channels` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `username` VARCHAR(100) NOT NULL,
    `active` TINYINT(1) DEFAULT 1,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Users
CREATE TABLE `users` (
    `id` BIGINT PRIMARY KEY,
    `first_name` VARCHAR(255) DEFAULT '',
    `username` VARCHAR(100) DEFAULT '',
    `balance` DECIMAL(10,2) DEFAULT 0.00,
    `total_earned` DECIMAL(10,2) DEFAULT 0.00,
    `banned` TINYINT(1) DEFAULT 0,
    `joined` TINYINT(1) DEFAULT 0,
    `refer_by` BIGINT DEFAULT NULL,
    `last_bonus` DATE DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tasks
CREATE TABLE `tasks` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `url` TEXT NOT NULL,
    `duration` INT DEFAULT 10,
    `reward` DECIMAL(10,2) DEFAULT 0.00,
    `total_limit` INT DEFAULT 100,
    `completed` INT DEFAULT 0,
    `status` TINYINT(1) DEFAULT 1,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Task logs
CREATE TABLE `task_logs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `task_id` INT NOT NULL,
    `status` ENUM('started','completed') DEFAULT 'started',
    `started_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `completed_at` TIMESTAMP NULL,
    INDEX (`user_id`, `task_id`)
) ENGINE=InnoDB;

-- Withdrawals
CREATE TABLE `withdrawals` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `method` VARCHAR(50) NOT NULL,
    `number` VARCHAR(50) NOT NULL,
    `status` ENUM('pending','approved','rejected') DEFAULT 'pending',
    `admin_note` TEXT DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Broadcast logs
CREATE TABLE `broadcast_logs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `message` TEXT NOT NULL,
    `total_sent` INT DEFAULT 0,
    `total_failed` INT DEFAULT 0,
    `status` ENUM('pending','running','completed') DEFAULT 'pending',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
