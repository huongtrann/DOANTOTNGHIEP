

using System;
using System.ComponentModel.DataAnnotations;

namespace tranthihuong_cdtt.ViewModels
{
    public class UserProfileViewModel :ViewModelBase
    {
        public int ID { get; set; }

        [Required(ErrorMessage = ErrorMessageRequired)]
        [Display(Name = "Tên người dùng")]
        [StringLength(100, MinimumLength = 2, ErrorMessage = ErrorMessageStringLength)]
        public string Name { get; set; }

        [Required(ErrorMessage = ErrorMessageRequired)]
        [Display(Name = "Email")]
        [DataType(DataType.EmailAddress)]
        [EmailAddress(ErrorMessage = "Email không hợp lệ")]
        [StringLength(100, MinimumLength = 2, ErrorMessage = ErrorMessageStringLength)]
        public string Email { get; set; }
        public string Captcha { get; set; }
        public Nullable<bool> IsConfirm { get; set; }

        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [Display(Name = "Số điện thoại")]
        [Required(ErrorMessage = ErrorMessageRequired)]
        [RegularExpression(@"^(\d{10})$", ErrorMessage = "Số điện thoại không hợp lệ")]
        [StringLength(10, MinimumLength = 2, ErrorMessage = ErrorMessageStringLength)]
        public string Phone { get; set; }
        public Nullable<int> UserTypeID { get; set; }

        [Required(ErrorMessage = ErrorMessageRequired)]
        [StringLength(100, MinimumLength = 6, ErrorMessage = ErrorMessageStringLength)]
        [DataType(DataType.Password)]
        [Display(Name = "Mật khẩu")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Xác nhận mật khẩu")]
        [Compare("Password", ErrorMessage = "Mật khẩu xác nhận không trùng")]
        public string ConfirmPassword { get; set; }
        public string Avatar { get; set; }
    }
}