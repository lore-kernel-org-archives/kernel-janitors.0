From: Domen Puncer <domen@coderock.org>
Date: Fri, 29 Jul 2005 09:42:54 +0000
Subject: Re: [KJ] [PATCH] drivers/net/es3210.c : Use of the time_after() macro
Message-Id: <20050729094254.GA25129@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59987828913494123=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D8B301.3090100@feitoza.com.br>
In-Reply-To: <42D8B301.3090100@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

--===============59987828913494123==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16/07/05 04:10 -0300, Marcelo Feitoza Parisi wrote:
> 

> Use of the time_after() macro, defined at linux/jiffies.h, which deal
> with wrapping correctly and are nicer to read.
> 
> Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
> 
> --- linux/drivers/net/es3210.c	2005-07-13 17:52:19.000000000 -0300
> +++ linux-kj/drivers/net/es3210.c	2005-07-15 23:58:12.537072344 -0300
> @@ -56,6 +56,7 @@
>  #include <linux/init.h>
>  #include <linux/netdevice.h>
>  #include <linux/etherdevice.h>
> +#include <linux/jiffies.h>
>  
>  #include <asm/io.h>
>  #include <asm/system.h>
> @@ -331,7 +332,7 @@
>  	if (ei_debug > 1) printk("%s: resetting the ES3210...", dev->name);
>  
>  	end = jiffies + 2*HZ/100;
> -        while ((signed)(end - jiffies) > 0) continue;
> +        while (time_after(end, jiffies)) continue;

Seems like I missed this on the first review...
msleep(20) should be much better here.

>  
>  	ei_status.txing = 0;
>  	outb(0x01, ioaddr + ES_RESET_PORT);

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============59987828913494123==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59987828913494123==--
