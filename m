From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 08 Jul 2005 18:48:59 +0000
Subject: Re: [KJ] [PATCH] drivers/net/3c523.c : Use of time_after macro
Message-Id: <20050708184859.GA2596@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============098237950797247287=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <425A4AAB.9060400@feitoza.com.br>
In-Reply-To: <425A4AAB.9060400@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

--===============098237950797247287==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08.07.2005 [15:37:41 -0300], Marcelo Feitoza Parisi wrote:
> Use of the time_after() macro, defined at linux/jiffies.h, which deal
> with wrapping correctly and are nicer to read.
> 
> Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
> 
> --- linux/drivers/net/3c523.c   2005-07-07 19:11:50.000000000 -0300
> +++ linux-kj/drivers/net/3c523.c        2005-07-07 20:32:54.379096144 -0300
> @@ -105,6 +105,7 @@
>  #include <linux/mca-legacy.h>
>  #include <linux/ethtool.h>
>  #include <linux/bitops.h>
> +#include <linux/jiffies.h>
> 
>  #include <asm/uaccess.h>
>  #include <asm/processor.h>
> @@ -658,7 +659,7 @@
> 
>         s = jiffies;            /* warning: only active with interrupts
> on !! */
>         while (!(cfg_cmd->cmd_status & STAT_COMPL)) {
> -               if (jiffies - s > 30*HZ/100)
> +               if (time_after(jiffies, s + 30*HZ/100))

Just personal preference, but it seems like it might be nice to rename
"s" to "stop" and do the addition at initialization, e.g. instead of

s = jiffies;

do

stop = jiffies + msecs_to_jiffies(300);

and then the time_after() call becomes

if (time_after(jiffies, stop))

But your code is fine as is...

-Nish

--===============098237950797247287==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============098237950797247287==--
