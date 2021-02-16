From: Lorenzo Colitti <lorenzo@google.com>
Date: Tue, 16 Feb 2021 01:23:52 +0000
Subject: Re: [PATCH] USB: gadget: Fix a configfs return code
Message-Id: <CAKD1Yr3Gpa4KZXzWDMO4-V-+16FCYPb4nUZMLde+cQLk+zRxaQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YCqZ3P53yyIg5cn7@mwanda>
In-Reply-To: <YCqZ3P53yyIg5cn7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nishad Kamdar <nishadkamdar@gmail.com>, David Lechner <david@lechnology.com>, linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Feb 16, 2021 at 12:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>         {                                                               \
>                 struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);  \
> -               int ret;                                                \
> +               int ret = -EINVAL;                                      \
>                 u8 val;                                                 \
>                                                                         \
>                 mutex_lock(&opts->lock);                                \
> -               ret = sscanf(page, "%02hhx", &val);                     \
> -               if (ret > 0) {                                          \
> +               if (sscanf(page, "%02hhx", &val) > 0) {                 \
>                         opts->_n_ = val;                                \
>                         ret = len;                                      \
>                 }                                                       \

Acked-by: Lorenzo Colitti <lorenzo@google.com>
