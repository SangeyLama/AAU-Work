# Mini Project Notes

## Properties

### Student
Student-id - Unique - AAU Student number (Strings)  
Name  
Sex - (Male or Female) Strings  
Ethnicity (Country born) - Nationality e.g. "Danish"  
age - Non-negative integer  

Can be represented by a struct or OOP simulated object.

Need:
* Constructor
* predicate
* Selection Functions for a single student

### Group
Set of Student e.g. Semester group  
Group-id (int group number starting at 1)  
A group = a group-id + list of students (Or just student-ids)  

Need:
* Constructor - single group
* predicate
* Selector Function returns list of students in the group
* A selector function that returns the group-id

### Grouping
Essentially a many to many table (Maps a student-id to a group-id)  
e.g. ((1.a) (1.e) (2.b) (2.c) (2.d)) group 1 contains students a+e while group 2 contains students b+c+d  

Population of n students - Given a list of 200 students to take as input at the beginning of the program.

* Function -> returns a group from a grouping.
* Function -> returns the number of groups in the grouping.
* Function -> returns the maximum group size in a grouping.
* Function -> returns minimum group size in a grouping.

Need:
* Predicate function identifies a grouping object.

### Random grouping:
Given a list of students sl and a list of desired group sizes gsl, program a grouping function that forms (length gsl) groups, of the sizes prescribed in gsl. This grouping function should return a grouping. The function should asserts that gsl is a list on positive integers (g1 g2 ... gk), where g1+g2+...+gk = (length sl). The grouping should be recursive, in a straightforward way: Initially, form a group of g1 students (randomly selected with use of a random function), and solve the remaining random grouping problem recursively, for the group size list (g2 ... gk).

### Grouping by counting:
Program a second grouping function which mimics the "manual couting approach" to the formation of k groups. In this approach, the grouping relies somehow on the order of students in the student collection. The counting goes: 1, 2, ..., k, 1, 2, ... k, ... (a total of n times where n is the number of students). This leads to a marking of each student by the allocated group number, and based on the marking, a grouping object should be created.

### Balanced grouping by counting:
As a variant of grouping by counting, program a third grouping function to form k groups from the n students which ensures equal distribution of sex and equal distribution of ethnicality in the constructed groups. As equal as possible in the real world. Please come up with a good, pragmatic and reasonable solution.

### Random grouping with group predicate.
As a variant of random grouping, add a group predicate to the parameter list of grouping function. Do your best to form groups that fulfill the group predicate. If a (random) group is formed, which breaks the group predicate, redo the random pick of the group (up to a limit, such as 1000 times). Program and play with the following group predicates:

* At least N students in a group are A years old, or older.
* All students in the group are female.
* No students in the group are of the same age.

In the 2020 version of the PP1 miniproject, the Random grouping with group predicate is considered as optional.

It is allowed to use a non-pure random function function for random grouping (such as random in Racket). In addition, you are allowed to write non-pure print functions. All other functions in your solution should be pure functions.
