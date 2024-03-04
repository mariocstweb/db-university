-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `S`.`id` AS `student_id`, `S`.`name`, `S`.`surname`, `D`.`name` AS `course_name`
FROM `students` AS `S`
JOIN `degrees` AS `D`
ON `S`.`degree_id` = `D`.`id`
WHERE `D`.`name` = 'Corso di Laurea in Economia';
-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT *
FROM `degrees` AS DEG
JOIN `departments` AS DEP
ON `DEG`.`department_id` = `DEP`.`id`
WHERE `DEP`.`id` = 7;
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT C.`name` AS 'nome corso', C.`description` AS 'descrizione corso', T.`name` AS 'nome insegnante', T.`surname` AS 'cognome insegnante', T.`id`
FROM `course_teacher` AS CT
JOIN `courses` AS C
ON CT.`course_id` = C.`id`
JOIN `teachers` AS T
ON CT.`teacher_id` = T.`id`
WHERE T.`surname` = 'Amato'
AND T.`name` = 'Fulvio';
-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
-- relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT S.*, DEG.name AS degree_name, DEP.name AS department_name
FROM `degrees`AS `DEG`
JOIN `students` AS `S`
ON `DEG`.id = `S`.`degree_id`
JOIN `courses` AS `C`
ON `DEG`.id = `C`.`degree_id`
JOIN `departments` AS `DEP`
ON `DEP`.id = `DEG`.`department_id`
ORDER BY S.surname, S.name;
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT DEG.`name` AS `nome_corso_laurea` , C.`name` AS `nome_corso`, T.`name` AS `nome_insegnante`, T.`surname` AS `cognome_insegnante`
FROM `degrees` AS DEG
JOIN `courses` as C
ON `DEG`.id = `C`.`degree_id`
JOIN `course_teacher` AS `CT`
ON `C`.id = `CT`.`course_id`
JOIN `teachers` AS `T`
ON `T`.`id` = `CT`.`teacher_id`;
-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT T.`id`, T.`surname` AS 'cognome_professore', T.`name` AS 'nome_professopre', DEP.`name` AS 'nome_dipartimento'
FROM `course_teacher` AS `CT`
JOIN `teachers` AS `T`
ON CT.`teacher_id` = T.`id`
JOIN `courses` AS `C`
ON `CT`.`course_id` = `C`.`id`
JOIN `degrees` AS `DEG`
ON `C`.`degree_id` = `DEG`.`id`
JOIN `departments` AS DEP
ON DEG.`department_id` = DEP.`id`
WHERE DEP.`name` = 'Dipartimento di Matematica'
ORDER BY T.`surname`, T.`name`;
-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
-- superare ciascuno dei suoi esami