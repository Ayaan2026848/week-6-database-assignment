-- Week 6 Database Assignment
-- Topic: Database Backup, Point-in-Time Recovery (PITR),
-- and Streaming Replication
-- Database: bootcamp
-- PostgreSQL Version: 18.6

-- Question 1: Verify the students table.
SELECT * FROM students ORDER BY id;

-- Question 2: Check WAL configuration.
SHOW wal_level;
SHOW archive_mode;
SHOW archive_command;

-- Question 3: Check WAL archiving statistics.
SELECT
archived_count,
last_archived_wal,
failed_count
FROM pg_stat_archiver;

-- Question 4: Verify the logical database backup.
-- Backup file: ~/backups/bootcamp_final.dump
-- Backup format: PostgreSQL custom format.
-- Backup contents were inspected using pg_restore -l.

-- Command used:
-- pg_restore -l ~/backups/bootcamp_final.dump

-- Question 5: Verify restored data.
-- The backup was restored into bootcamp_restore_test.
-- The restored student records were verified successfully.
-- Connect to bootcamp_restore_test before running this query:
-- SELECT * FROM students ORDER BY id;

-- Question 6: Point-in-Time Recovery (PITR).
-- A physical base backup was created using pg_basebackup.
-- WAL archiving was enabled to support recovery.
-- Recovery requires a separate copy of the base backup,
-- a restore_command, a recovery_target_time, and recovery.signal.
-- Verify the restored records after recovery.

-- Question 7: Streaming Replication.
-- Configure wal_level = replica.
-- Create a dedicated replication user.
-- Configure pg_hba.conf to allow replication connections.
-- Create a standby server using pg_basebackup with -R.
-- Verify replication using pg_stat_replication on the primary.

-- Note:
-- PITR and streaming replication must be executed and verified
-- separately before reporting them as completed.
