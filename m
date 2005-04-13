From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Wed, 13 Apr 2005 16:12:38 +0000
Subject: Re: [KJ] [PATCH] drivers/net/3c523.c : Use of time_after() macro
Message-Id: <29495f1d050413091255e32786@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <425A4AAB.9060400@feitoza.com.br>
In-Reply-To: <425A4AAB.9060400@feitoza.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/11/05, Marcelo Feitoza Parisi <marcelo@feitoza.com.br> wrote:
> Use of time_after() macro, defined at linux/jiffies.h, which deal with
> wrapping correctly and are nicer to read.
> 
> --
> 
> Marcelo Feitoza Parisi
> marcelo at feitoza.com.br
> http://marcelo.feitoza.com.br/
> 
> Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
> 
> --- linux/drivers/net/3c523.c   2005-03-02 04:38:38.000000000 -0300
> +++ development/drivers/net/3c523.c     2005-04-09 18:37:48.000000000 -0300
> @@ -105,7 +105,8 @@
>  #include <linux/mca-legacy.h>
>  #include <linux/ethtool.h>
>  #include <linux/bitops.h>
> -
> +#include <linux/jiffies.h>
> +
>  #include <asm/uaccess.h>
>  #include <asm/processor.h>
>  #include <asm/io.h>
> @@ -659,7 +660,7 @@ static int init586(struct net_device *de
> 
>         s = jiffies;            /* warning: only active with interrupts on !! */
>         while (!(cfg_cmd->cmd_status & STAT_COMPL)) {
> -               if (jiffies - s > 30*HZ/100)
> +               if (time_after(jiffies, s + 30*HZ/100))

It probably makes sense to change "s" to "end_jiffies" and then instead of
s=jiffies;
do
end_jiffies = jiffies + 30 * HZ/100;
Then, the if-conditional becomes
if (time_after(jiffies, end_jiffies))

Same with the others (as long as "s" isn't used for anything else, of course).

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
