Map<String, dynamic> userNow = {
  "name": "Nguyen Si Truong",
  "avatarUrl":
      "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
  "phoneNumber": "0393191343",
  "mbti": 160,
  "iq": 160,
  "mi": 160,
  "disc": "D"
};
bool isLogin = true;
List<Map<String, dynamic>> listFriend = [
  {
    "name": "Công ti APG",
    "avatar":
        "https://images.glints.com/unsafe/glints-dashboard.s3.amazonaws.com/company-logo/1ccfed7115bf0dff57c32b5820cbd48f.png"
  },
  {
    "name": "Công ti BeeCV",
    "avatar": "https://img.upanh.tv/2022/09/17/beeCV.png"
  },
  {
    "name": "VinGroup",
    "avatar":
        "https://s3-symbol-logo.tradingview.com/vingroup-joint-stock-company--600.png"
  },
  {
    "name": "Công ti EVG",
    "avatar":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/EVG_-_Logo.svg/2560px-EVG_-_Logo.svg.png"
  },
  {
    "name": "Công ti ACS",
    "avatar":
        "https://cachvaytiennganhang.com/wp-content/uploads/2021/09/so-tai-khoan-ngan-hang-acs.jpg"
  },
  {
    "name": "Quốc Anh",
    "avatar":
        "https://image-us.24h.com.vn/upload/4-2020/images/2020-11-20/25-kieu-toc-Mohican-dep-dan-dau-xu-huong-toc-nam-nam-2021-toc-mohican-3-1605844519-867-width600height630.jpg"
  },
  {
    "name": "Thanh Hà",
    "avatar":
        "https://vnn-imgs-f.vgcloud.vn/2021/10/09/16/thanh-ha-hon-nhan-lan-dan-tim-thay-ben-do-o-tuoi-52-3.jpg"
  },
];

List<Map<String, dynamic>> listRequestCandidate = [
  {
    "name": "Nguyễn Lan Anh",
    "listBranch": ["UI-UX Designer", "ETC"],
    "location": "Hà Nội",
    "minSalary": 15,
    "maxSalary": 20,
    "exp": "Từ 2 năm đến 3 năm kinh nghiệm",
    "avatar":
        "https://anh.24h.com.vn//upload/2-2017/images/2017-06-12/1497233715-149700004270405-hoa-phuong-d.jpg"
  },
  {
    "name": "Ngô Hoàng Dũng",
    "listBranch": ["UI-UX Designer", "ETC"],
    "location": "Quận 1, Thành phố Hồ Chí Minh",
    "minSalary": 20,
    "maxSalary": 0,
    "exp": "Từ 4 năm đến 5 năm kinh nghiệm",
    "avatar":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFCUvvBw76w0mdfOdV8NbD88MGh31crnEUJQ&usqp=CAU"
  },
  {
    "name": "Nguyễn Lan Anh",
    "listBranch": ["UI-UX Designer", "ETC"],
    "location": "Hà Nội",
    "minSalary": 15,
    "maxSalary": 20,
    "exp": "Từ 2 năm đến 3 năm kinh nghiệm",
    "avatar":
        "https://anh.24h.com.vn//upload/2-2017/images/2017-06-12/1497233715-149700004270405-hoa-phuong-d.jpg"
  },
  {
    "name": "Ngô Hoàng Dũng",
    "listBranch": ["UI-UX Designer", "ETC"],
    "location": "Quận 1, Thành phố Hồ Chí Minh",
    "minSalary": 20,
    "maxSalary": 0,
    "exp": "Từ 4 năm đến 5 năm kinh nghiệm",
    "avatar":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFCUvvBw76w0mdfOdV8NbD88MGh31crnEUJQ&usqp=CAU"
  },
  {
    "name": "Nguyễn Lan Anh",
    "listBranch": ["UI-UX Designer", "ETC"],
    "location": "Hà Nội",
    "minSalary": 15,
    "maxSalary": 20,
    "exp": "Từ 2 năm đến 3 năm kinh nghiệm",
    "avatar":
        "https://anh.24h.com.vn//upload/2-2017/images/2017-06-12/1497233715-149700004270405-hoa-phuong-d.jpg"
  },
  {
    "name": "Ngô Hoàng Dũng",
    "listBranch": ["UI-UX Designer", "ETC"],
    "location": "Quận 1, Thành phố Hồ Chí Minh",
    "minSalary": 20,
    "maxSalary": 0,
    "exp": "Từ 4 năm đến 5 năm kinh nghiệm",
    "avatar":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFCUvvBw76w0mdfOdV8NbD88MGh31crnEUJQ&usqp=CAU"
  },
  {
    "name": "Nguyễn Lan Anh",
    "listBranch": ["UI-UX Designer", "ETC"],
    "location": "Hà Nội",
    "minSalary": 15,
    "maxSalary": 20,
    "exp": "Từ 2 năm đến 3 năm kinh nghiệm",
    "avatar":
        "https://anh.24h.com.vn//upload/2-2017/images/2017-06-12/1497233715-149700004270405-hoa-phuong-d.jpg"
  },
  {
    "name": "Ngô Hoàng Dũng",
    "listBranch": ["UI-UX Designer", "ETC"],
    "location": "Quận 1, Thành phố Hồ Chí Minh",
    "minSalary": 20,
    "maxSalary": 0,
    "exp": "Từ 4 năm đến 5 năm kinh nghiệm",
    "avatar":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFCUvvBw76w0mdfOdV8NbD88MGh31crnEUJQ&usqp=CAU"
  },
];

List<Map<String, dynamic>> listMess = [
  {
    "user1": {
      "name": "Công ti APG",
      "avatar":
          "https://images.glints.com/unsafe/glints-dashboard.s3.amazonaws.com/company-logo/1ccfed7115bf0dff57c32b5820cbd48f.png"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "Công ti APG",
        "avatar":
            "https://images.glints.com/unsafe/glints-dashboard.s3.amazonaws.com/company-logo/1ccfed7115bf0dff57c32b5820cbd48f.png",
        "timeSend": "2021-09-22 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2021-09-22 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "Công ti APG",
        "avatar":
            "https://images.glints.com/unsafe/glints-dashboard.s3.amazonaws.com/company-logo/1ccfed7115bf0dff57c32b5820cbd48f.png",
        "timeSend": "2021-09-22 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2021-09-22 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "Công ti BeeCV",
      "avatar": "https://img.upanh.tv/2022/09/17/beeCV.png"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "Công ti BeeCV",
        "avatar": "https://img.upanh.tv/2022/09/17/beeCV.png",
        "timeSend": "2022-08-20 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-08-20 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "Công ti BeeCV",
        "avatar": "https://img.upanh.tv/2022/09/17/beeCV.png",
        "timeSend": "2022-08-20 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-08-20 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "VinGroup",
      "avatar":
          "https://s3-symbol-logo.tradingview.com/vingroup-joint-stock-company--600.png"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "VinGroup",
        "avatar":
            "https://s3-symbol-logo.tradingview.com/vingroup-joint-stock-company--600.png",
        "timeSend": "2022-09-19 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-19 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "VinGroup",
        "avatar":
            "https://s3-symbol-logo.tradingview.com/vingroup-joint-stock-company--600.png",
        "timeSend": "2022-09-19 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-19 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "Công ti EVG",
      "avatar":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/EVG_-_Logo.svg/2560px-EVG_-_Logo.svg.png"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "Công ti EVG",
        "avatar":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/EVG_-_Logo.svg/2560px-EVG_-_Logo.svg.png",
        "timeSend": "2022-06-20 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-06-20 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "Công ti EVG",
        "avatar":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/EVG_-_Logo.svg/2560px-EVG_-_Logo.svg.png",
        "timeSend": "2022-06-20 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-06-20 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "Công ti ACS",
      "avatar":
          "https://cachvaytiennganhang.com/wp-content/uploads/2021/09/so-tai-khoan-ngan-hang-acs.jpg"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "Công ti ACS",
        "avatar":
            "https://cachvaytiennganhang.com/wp-content/uploads/2021/09/so-tai-khoan-ngan-hang-acs.jpg",
        "timeSend": "2022-09-22 10:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-22 10:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "Công ti ACS",
        "avatar":
            "https://cachvaytiennganhang.com/wp-content/uploads/2021/09/so-tai-khoan-ngan-hang-acs.jpg",
        "timeSend": "2022-09-22 10:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-22 10:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "Vietcombank",
      "avatar":
          "https://admin.tamlyvietphap.vn/uploaded/Images/Original/2020/10/16/logo_vietcombank_1610091313.jpg"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "Vietcombank",
        "avatar":
            "https://admin.tamlyvietphap.vn/uploaded/Images/Original/2020/10/16/logo_vietcombank_1610091313.jpg",
        "timeSend": "2022-09-20 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "Vietcombank",
        "avatar":
            "https://admin.tamlyvietphap.vn/uploaded/Images/Original/2020/10/16/logo_vietcombank_1610091313.jpg",
        "timeSend": "2022-09-20 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "Techcombank",
      "avatar":
          "https://dcdesign.vn/image/data/DC%20Design/BAI%20VIET%20CHUYEN%20NGANH/Logo%20dep/logo-ngan-hang%203_resize.png"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "Techcombank",
        "avatar":
            "https://dcdesign.vn/image/data/DC%20Design/BAI%20VIET%20CHUYEN%20NGANH/Logo%20dep/logo-ngan-hang%203_resize.png",
        "timeSend": "2022-09-20 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "Techcombank",
        "avatar":
            "https://dcdesign.vn/image/data/DC%20Design/BAI%20VIET%20CHUYEN%20NGANH/Logo%20dep/logo-ngan-hang%203_resize.png",
        "timeSend": "2022-09-20 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "NICE",
      "avatar":
          "https://suno.vn/blog/wp-content/uploads/2014/12/nike-lich-su-thiet-ke-logo.jpg"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "NICE",
        "avatar":
            "https://suno.vn/blog/wp-content/uploads/2014/12/nike-lich-su-thiet-ke-logo.jpg",
        "timeSend": "2022-09-20 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "NICE",
        "avatar":
            "https://suno.vn/blog/wp-content/uploads/2014/12/nike-lich-su-thiet-ke-logo.jpg",
        "timeSend": "2022-09-20 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "Google",
      "avatar":
          "https://1757140519.rsc.cdn77.org/blog/wp-content/uploads/sites/16/2018/05/1-google-logo.png"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "Google",
        "avatar":
            "https://1757140519.rsc.cdn77.org/blog/wp-content/uploads/sites/16/2018/05/1-google-logo.png",
        "timeSend": "2022-09-20 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "Google",
        "avatar":
            "https://1757140519.rsc.cdn77.org/blog/wp-content/uploads/sites/16/2018/05/1-google-logo.png",
        "timeSend": "2022-09-20 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "Facebook",
      "avatar": "https://www.facebook.com/images/fb_icon_325x325.png"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "Facebook",
        "avatar": "https://www.facebook.com/images/fb_icon_325x325.png",
        "timeSend": "2022-09-20 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "Facebook",
        "avatar": "https://www.facebook.com/images/fb_icon_325x325.png",
        "timeSend": "2022-09-20 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "Amazon",
      "avatar": "https://znews-stc.zdn.vn/static/topic/company/amazon.png"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "Amazon",
        "avatar": "https://znews-stc.zdn.vn/static/topic/company/amazon.png",
        "timeSend": "2022-09-20 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "Amazon",
        "avatar": "https://znews-stc.zdn.vn/static/topic/company/amazon.png",
        "timeSend": "2022-09-20 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "Beauty Spa",
      "avatar":
          "https://khangviet.net/media/7UF7HqhXPfhDq1r_KDtxnIHH7ABD4QKl4StzLS8CrOQlr4Ea4PI_beniCvt3aHlH.png"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "Beauty Spa",
        "avatar":
            "https://khangviet.net/media/7UF7HqhXPfhDq1r_KDtxnIHH7ABD4QKl4StzLS8CrOQlr4Ea4PI_beniCvt3aHlH.png",
        "timeSend": "2022-09-20 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "Beauty Spa",
        "avatar":
            "https://khangviet.net/media/7UF7HqhXPfhDq1r_KDtxnIHH7ABD4QKl4StzLS8CrOQlr4Ea4PI_beniCvt3aHlH.png",
        "timeSend": "2022-09-20 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
  {
    "user1": {
      "name": "Quốc Anh",
      "avatar":
          "https://image-us.24h.com.vn/upload/4-2020/images/2020-11-20/25-kieu-toc-Mohican-dep-dan-dau-xu-huong-toc-nam-nam-2021-toc-mohican-3-1605844519-867-width600height630.jpg"
    },
    "user2": {
      "name": "Nguyen Si Truong",
      "avatar":
          "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg"
    },
    "mess": [
      {
        "sender": "Quốc Anh",
        "avatar":
            "https://image-us.24h.com.vn/upload/4-2020/images/2020-11-20/25-kieu-toc-Mohican-dep-dan-dau-xu-huong-toc-nam-nam-2021-toc-mohican-3-1605844519-867-width600height630.jpg",
        "timeSend": "2022-09-20 09:14:47.059",
        "contend":
            "Ai cũng mong muốn có một làn da trắng ngắn mịn màng có sức sống nhưng đâu phải ai cũng may mắn có được một làn da như vậy.",
        "status": "read"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:15:42.883",
        "contend": "Chào bạn chúng tôi giúp được gì cho bạn.",
        "status": "read"
      },
      {
        "sender": "Quốc Anh",
        "avatar":
            "https://image-us.24h.com.vn/upload/4-2020/images/2020-11-20/25-kieu-toc-Mohican-dep-dan-dau-xu-huong-toc-nam-nam-2021-toc-mohican-3-1605844519-867-width600height630.jpg",
        "timeSend": "2022-09-20 09:15:55.738",
        "contend": "Tôi muốn thực hiện một số dịch vụ về làm tóc.",
        "status": "unread"
      },
      {
        "sender": "Nguyen Si Truong",
        "avatar":
            "https://info-imgs.vgcloud.vn/2020/07/27/15/nu-sinh-truong-y-dep-hut-hon-trong-hoang-hon-bo-bien-cua-lo-9.jpg",
        "timeSend": "2022-09-20 09:16:12.554",
        "contend":
            "Hiện nay chúng tôi có rất nhiều dịch vụ về làm tóc, mong quý khách chọn một trong số những dịch vụ của chúng tôi ở dưới đây",
        "status": "unread"
      },
    ]
  },
];
List<String> listLanguage = [
  "Tiếng Anh",
  "Tiếng Nhật",
  "Tiếng Hàn",
  "Tiếng Đức",
  "Tiếng Trung",
  "Tiếng Nga"
];
List<String> listFieldWorking = [
  "IT",
  "Designer",
  "Artis",
  "Medical",
  "Security"
];
List<String> listExpWorking = [
  "Dưới 1 năm kinh nghiệm",
  "Từ 1 năm đến 2 năm kinh nghiệm",
  "Từ 2 năm đến 3 năm kinh nghiệm",
  "Từ 3 năm đến 4 năm kinh nghiệm",
  "Từ 4 năm đến 5 năm kinh nghiệm",
  "Trên 5 năm kinh nghiệm"
];
List<String> listCountry = [
  "An Giang",
  "Bà Rịa-Vũng Tàu",
  "Bạc Liêu",
  "Bắc Kạn",
  "Bắc Giang",
  "Bắc Ninh",
  "Bến Tre",
  "Bình Dương",
  "Bình Định",
  "Bình Phước",
  "Bình Thuận",
  "Cà Mau",
  "Cao Bằng",
  "Cần Thơ (TP)",
  "Đà Nẵng(TP)",
  "Đắk Lắk",
  "Đắk Nông",
  "Điện Biên",
  "Đồng Nai",
  "Đồng Tháp",
  "Gia Lai",
  "Hà Giang",
  "Hà Nam",
  "Hà Nội(TP)",
  "Hà Tây",
  "Hà Tĩnh",
  "Hải Dương",
  "Hải Phòng(TP)",
  "Hòa Bình",
  "Hồ Chí Minh(TP)",
  "Hậu Giang",
  "Hưng Yên",
  "Khánh Hòa",
  "Kiên Giang",
  "Kon Tum",
  "Lai Châu",
  "Lào Cai",
  "Lạng Sơn",
  "Lâm Đồng",
  "Long An",
  "Nam Định",
  "Nghệ An",
  "Ninh Bình",
  "Ninh Thuận",
  "Phú Thọ",
  "Phú Yên",
  "Quảng Bình",
  "Quảng Nam",
  "Quảng Ngãi",
  "Quảng Ninh",
  "Quảng Trị",
  "Sóc Trăng",
  "Sơn La",
  "Tây Ninh",
  "Thái Bình",
  "Thái Nguyên",
  "Thanh Hóa",
  "Thừa Thiên – Huế",
  "Tiền Giang",
  "Trà Vinh",
  "Tuyên Quang",
  "Vĩnh Long",
  "Vĩnh Phúc",
  "Yên Bái"
];
