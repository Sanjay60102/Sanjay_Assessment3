namespace Assessment3
{
    public class StudentServices
    {
        private readonly List<Student> _students = new();
        private int _nextId = 1;

        public void AddStudent(string name, string qualification, string skill)
        {
            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(qualification) || string.IsNullOrWhiteSpace(skill))
            {
                throw new ArgumentException("All student details must be provided.");
            }

            var student = new Student
            {
                StudentId = _nextId++,
                Name = name,
                Qualification = qualification,
                Skill = skill
            };

            _students.Add(student);
        }

        public List<Student> GetAllStudents()
        {
            return _students;
        }
    }
}
