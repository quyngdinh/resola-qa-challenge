
# Robot Framework User Guide

## 1. Introduction
Robot Framework is a Python-based, extensible keyword-driven automation framework for acceptance testing, acceptance test driven development (ATDD), 
behavior driven development (BDD) and robotic process automation (RPA). It can be used in distributed, heterogeneous environments, 
where automation requires using different technologies and interfaces.

Robot Framework is implemented using Python, and a precondition to install it is having Python or its alternative implementation PyPy installed. 
Another recommended precondition is having the pip package manager available.

## 2. Installation
List of libraries need to install (Refer requirements.txt)


## 3. Executed suites and test cases
Run test case with command: 
```
robot -d ../Reports ./test_suites/pathname_of_test_suite(e.g.resola_api_test.robot)
```

Explanation:

- robot: Keyword to run robot framework

- -d ./Reports: Command option of Directory to get the report (if leave it blank, the report will show in the root)

- /pathname_of_test_suite(e.g.resola_api_test.robot) (Leave ./test_suites if want to run all test suites)