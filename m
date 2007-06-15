From: Ben Dooks <ben@trinity.fluff.org>
Date: Fri, 15 Jun 2007 17:34:14 +0000
Subject: [KJ] Re: [PATCH]is_power_of_2-rtc/rtc-s3c.c
Message-Id: <20070615173414.GH601@trinity.fluff.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jun 12, 2007 at 10:54:28AM +0530, vignesh babu wrote:
> 
> 
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2
> 
> Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> --- 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 54b6130..e20bd6f 100644
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
>  	case RTC_IRQP_SET:
>  		/* check for power of 2 */
>  
> -		if ((arg & (arg-1)) != 0 || arg < 1) {
> +		if (!is_power_of_2(arg)) {
>  			ret = -EINVAL;
>  			goto exit;
>  		}
> 
> -- 
> Vignesh Babu BM 
> _____________________________________________________________ 
> "Why is it that every time I'm with you, makes me believe in magic?"
> 
> 
> 
> The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments. 
> 
> WARNING: Computer viruses can be transmitted via email. The recipient should check this email and any attachments for the presence of viruses. The company accepts no liability for any damage caused by any virus transmitted by this email.
>  
> www.wipro.com

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
