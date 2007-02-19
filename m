From: "Andrew Schwimmer" <andrew.schwimmer@gmail.com>
Date: Mon, 19 Feb 2007 07:57:15 +0000
Subject: Re: [KJ] [PATCH] is_power_of_2 in rtc
Message-Id: <33dd4f670702182357i6c0ab5ecr62d105f92d508837@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1171865627.6127.32.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1171865627.6127.32.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/19/07, Vignesh Babu BM <vignesh.babu@wipro.com> wrote:
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2
>
> Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
> ---
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index f406a2b..212ec32 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -20,6 +20,7 @@
>  #include <linux/rtc.h>
>  #include <linux/bcd.h>
>  #include <linux/clk.h>
> +#include <linux/log2.h>
>
>  #include <asm/hardware.h>
>  #include <asm/uaccess.h>
> @@ -311,7 +312,7 @@ static int s3c_rtc_ioctl(struct device *dev,
>         case RTC_IRQP_SET:
>                 /* check for power of 2 */
>
> -               if ((arg & (arg-1)) != 0 || arg < 1) {
> +               if (!arg || !is_power_of_2(arg)) {
>                         ret = -EINVAL;
>                         goto exit;
>                 }

Isn't the !arg here redundant because is_power_of_2() is defined as

	return (n != 0 && ((n & (n - 1)) = 0));

with the n != 0 already in it?

>
> --
> Regards,
> Vignesh Babu BM


-- 
-A.

What is this talk of 'release'? Klingons do not make software
'releases'. Our software 'escapes' leaving a bloody trail of designers
and quality assurance people in its wake.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
