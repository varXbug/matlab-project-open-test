# MATLAB Project open-and-run test case

A minimal MATLAB Project used to observe what happens when a project is opened
through an `Open in MATLAB Online` deep link of the form:

```
matlab.mathworks.com/open/github/v1?repo=<owner>/<repo>&project=PoC.prj
```

`poc_startup.m` is registered as the project's **startup file**, so MATLAB runs
it when the project opens. It appends one line to a marker file and prints the
path it wrote. It makes no network requests, reads no user data and sends
nothing anywhere.

Created for authorised security research under MathWorks' Bugcrowd engagement.
