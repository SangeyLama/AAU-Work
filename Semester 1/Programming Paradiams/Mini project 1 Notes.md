Properties

Student
Student-id - Unique - AAU Student number (Strings)
Name
Sex - (Male or Female) Strings
Ethnicity (Country born) - Nationality e.g. "Danish"
age - Non-negative integer

Can be represented by a struct or OOP simulated object.

Group
Set of Student e.g. Semester group
Group-id - int group number starting at 1
A group = a group-id + list of students (Or just student-ids)

Grouping
Essentially a many to many table (Maps a student-id to a group-id)

Population of n students
