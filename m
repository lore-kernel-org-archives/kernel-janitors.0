From: walter harms <wharms@bfs.de>
Date: Sat, 03 Nov 2012 12:11:36 +0000
Subject: Re: [PATCH 11/16] drivers/misc/kgdbts.c: use WARN
Message-Id: <509509F8.2010407@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr> <1351940317-14812-12-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-12-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org



Am 03.11.2012 11:58, schrieb Julia Lawall:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Use WARN rather than printk followed by WARN_ON(1), for conciseness.
> 
> A simplified version of the semantic patch that makes this transformation
> is as follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression list es;
> @@
> 
> -printk(
> +WARN(1,
>   es);
> -WARN_ON(1);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/misc/kgdbts.c |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
> index 3aa9a96..8b367db 100644
> --- a/drivers/misc/kgdbts.c
> +++ b/drivers/misc/kgdbts.c
> @@ -114,9 +114,8 @@
>  		touch_nmi_watchdog();	\
>  	} while (0)
>  #define eprintk(a...) do { \
> -		printk(KERN_ERR a); \
> -		WARN_ON(1); \
> -	} while (0)
> +		WARN(1, KERN_ERR a); \
> +		} while (0)
>  #define MAX_CONFIG_LEN		40
>  

A macro calling a macro ?
Is it possible to replace eprintk() ?

re,
 wh
