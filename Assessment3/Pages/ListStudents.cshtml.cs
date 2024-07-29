using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Assessment3.Pages
{
    public class ListStudentsModel : PageModel
    {
        private readonly StudentServices _studentService;
        public ListStudentsModel(StudentServices studentService) => _studentService = studentService;

        public List<Student> Students { get; private set; }

        public void OnGet() => Students = _studentService.GetAllStudents();
    }
}
