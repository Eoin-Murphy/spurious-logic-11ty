---
title: "This is why we have switch statements"
date: "2012-11-02"
tags: 
  - "dev"
---

[![](/assets/img/train-switch.jpg "train-switch")](http://spurious-logic.net/this-is-why-we-have-switch-statements)

I came across a head-slappingly dumb bug earlier with a generic method. Which only occurred for Task types A or B. If you spot it, give yourself a "my isn't that obvious" cookie.

public List<T> GetUserTasks<T>(int userId) where T : Task { IEnumerable<T> result = null; if (typeof(Task\_A) == typeof(T)) { result = (IEnumerable<T>)this.taskRepository.GetTask\_A(participantId, clientId); } else if (typeof(Task\_B) == typeof(T)) { result = (IEnumerable<T>)this.taskRepository.GetTask\_B(participantId, clientId); } if (typeof(Task\_C) == typeof(T)) { result = (IEnumerable<T>)this.taskRepository.GetTask\_C( participantId, clientId); } else if (typeof(Task\_D) == typeof(T)) { result = (IEnumerable<T>)this.taskRepository.GetTask\_D(participantId, clientId); } else { throw new ApplicationException("Unknown task type requested : " + typeof(T).ToString()); } return result.ToList(); }

Yes I know this is not the ideal way to handle generics but as some point, different stored procedures must be called for different classes and I think it's better to make that distinction in the service rather than the repository layer. You're repositories should just be calling stored procs and handling the returning values.

Of course you can't use a switch statement here because switch statements require constant values... So the only fix here was to add in that missing `else` and update the unit tests to cover the method correctly.
