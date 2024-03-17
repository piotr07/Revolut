# Attention!
I know that in [OppCalculator_Service](/force-app/main/default/classes/OppCalculator_Service.cls) calculating max discount would
be calculated in another way (for example via record-triggered flow) but I prepared that solution to demonstrate trigger
best practices, using repository pattern and single responsibility principle.
I didn't want to focus on complex business logic. I have prepared only one test class
[User_Service_TEST](/force-app/main/default/classes/User_Service_TEST.cls) to not put additional effort and time into it.
I have tested only that [User_Service](/force-app/main/default/classes/User_Service.cls) class to underline benefits of
using a repository pattern that I'm a big fan of.