From: Hans de Goede <hdegoede@redhat.com>
Date: Sun, 09 Sep 2012 21:56:44 +0000
Subject: Re: [PATCH 14/14] drivers/media/usb/gspca/cpia1.c: fix error return code
Message-Id: <504D109C.8000803@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346945041-26676-14-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1346945041-26676-14-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Applied to my gspca tree and included in my pull-req for 3.7 which I just send out.

Thanks,

Hans


On 09/06/2012 05:24 PM, Peter Senna Tschudin wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
>
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret != 0\))
>   { ... return ret; }
> |
> ret@p1 = 0
> )
> ... when != ret = e1
>      when != &ret
> *if(...)
> {
>    ... when != ret = e2
>        when forall
>   return ret;
> }
>
> // </smpl>
>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
>
> ---
>   drivers/media/usb/gspca/cpia1.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
> index 2499a88..b3ba47d 100644
> --- a/drivers/media/usb/gspca/cpia1.c
> +++ b/drivers/media/usb/gspca/cpia1.c
> @@ -751,7 +751,7 @@ static int goto_high_power(struct gspca_dev *gspca_dev)
>   	if (signal_pending(current))
>   		return -EINTR;
>
> -	do_command(gspca_dev, CPIA_COMMAND_GetCameraStatus, 0, 0, 0, 0);
> +	ret = do_command(gspca_dev, CPIA_COMMAND_GetCameraStatus, 0, 0, 0, 0);
>   	if (ret)
>   		return ret;
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
