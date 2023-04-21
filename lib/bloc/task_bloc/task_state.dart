abstract class TaskState {}

class TaskInitial extends TaskState {}

//add
class TaskAddLoading extends TaskState {}

class TaskAddSucces extends TaskState {}

//delete
class TaskDeleteLoading extends TaskState {}

class TaskDeleteSucces extends TaskState {}

//update
class TaskUpdateLoading extends TaskState {}

class TaskUpdateSucces extends TaskState {}
