From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 11 Apr 2020 23:11:01 +0000
Subject: Re: [PATCH] media: pwc-ctl: remove redundant assignment to variable ret
Message-Id: <CAAEAJfA2PQOUWbKu=CLPaA-bx2T3MWGpsviq7DBaJ9DxOqCTbg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410135014.26396-1-colin.king@canonical.com>
In-Reply-To: <20200410135014.26396-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, 10 Apr 2020 at 10:50, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> ---
>  drivers/media/usb/pwc/pwc-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/pwc/pwc-ctrl.c b/drivers/media/usb/pwc/pwc-ctrl.c
> index 315c55927f5c..cff64d872058 100644
> --- a/drivers/media/usb/pwc/pwc-ctrl.c
> +++ b/drivers/media/usb/pwc/pwc-ctrl.c
> @@ -523,7 +523,7 @@ int pwc_set_leds(struct pwc_device *pdev, int on_value, int off_value)
>  #ifdef CONFIG_USB_PWC_DEBUG
>  int pwc_get_cmos_sensor(struct pwc_device *pdev, int *sensor)
>  {
> -       int ret = -1, request;
> +       int ret, request;
>
>         if (pdev->type < 675)
>                 request = SENSOR_TYPE_FORMATTER1;
> --
> 2.25.1
>
