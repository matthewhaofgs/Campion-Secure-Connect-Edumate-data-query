SELECT distinct
student.student_id AS CODE,
contact.FIRSTNAME AS FIRSTNAME,
contact.OTHER_NAME AS MIDDLENAME,
contact.SURNAME AS SURNAME,
form.SHORT_NAME AS YEARLEVEL,
house.HOUSE AS HOUSE,
contact.EMAIL_ADDRESS AS EMAIL

FROM 

STUDENT
INNER JOIN edumate.view_student_start_exit_dates ON student.student_id = edumate.view_student_start_exit_dates.student_id
INNER JOIN contact ON student.contact_id = contact.contact_id
INNER JOIN student_form_run ON student_form_run.student_id = student.student_id
INNER JOIN form_run ON student_form_run.form_run_id = form_run.form_run_id
INNER JOIN form ON form_run.form_id = form.form_id
INNER JOIN stu_school ON student.student_id = stu_school.student_id
LEFT JOIN house ON student.HOUSE_ID = house.HOUSE_ID

WHERE 

CURRENT_DATE BETWEEN (edumate.view_student_start_exit_dates.start_date - 90 days) AND edumate.view_student_start_exit_dates.exit_date
AND CURRENT_DATE BETWEEN (student_form_run.START_DATE - 30 days) AND student_form_run.END_DATE