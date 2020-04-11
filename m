From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 11 Apr 2020 23:11:43 +0000
Subject: Re: [PATCH] media: gspca: remove redundant assignment to variable status
Message-Id: <CAAEAJfB3D7KxruC2TzeEhyeF8qGHOWUa2hKmqcptub5gciSAxQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410141813.29497-1-colin.king@canonical.com>
In-Reply-To: <20200410141813.29497-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, 10 Apr 2020 at 11:18, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable status is being assigned a value that is never read.
> The assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> ---
>  drivers/media/usb/gspca/mr97310a.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/usb/gspca/mr97310a.c b/drivers/media/usb/gspca/mr97310a.c
> index 502fc2eaffe0..464aa61cd914 100644
> --- a/drivers/media/usb/gspca/mr97310a.c
> +++ b/drivers/media/usb/gspca/mr97310a.c
> @@ -287,7 +287,6 @@ static int zero_the_pointer(struct gspca_dev *gspca_dev)
>                         return err_code;
>
>                 err_code = cam_get_response16(gspca_dev, 0x21, 0);
> -               status = data[0];
>                 tries++;
>                 if (err_code < 0)
>                         return err_code;
> --
> 2.25.1
>
