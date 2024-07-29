using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Assessment3.Pages
{
    public class RegisterStudentModel : PageModel
    {
        private readonly StudentServices _studentService;
        public RegisterStudentModel(StudentServices studentService) => _studentService = studentService;

        [BindProperty] public string Name { get; set; }
        [BindProperty] public string Qualification { get; set; }
        [BindProperty] public string Skill { get; set; }
        public string Message { get; set; }

        public void OnPost()
        {
            _studentService.AddStudent(Name, Qualification, Skill);
            Message = "Student registered successfully!";
        }
    }
}
