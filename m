From: Domen Puncer <domen@coderock.org>
Date: Tue, 24 May 2005 05:59:48 +0000
Subject: Re: [KJ] [PATCH] - pxafb should use msleep
Message-Id: <20050524055948.GA30046@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76466333016403598=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42925981.7020501@gmail.com>
In-Reply-To: <42925981.7020501@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============76466333016403598==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 23/05/05 18:30 -0400, Chuck Short wrote:
> Hi,
> 
> This patch changes pxafb to use msleep.
> 
> Signed-of-by: Chuck Short <zulcss@gmail.com>
> 

> diff -Naur linux-source-2.6.12-2.6.11.92.orig/drivers/video/pxafb.c linux-source-2.6.12-2.6.11.92/drivers/video/pxafb.c
> --- linux-source-2.6.12-2.6.11.92.orig/drivers/video/pxafb.c	2005-04-21 06:39:57.000000000 -0400
> +++ linux-source-2.6.12-2.6.11.92/drivers/video/pxafb.c	2005-05-18 12:39:56.942489336 -0400
> @@ -740,14 +740,13 @@
>  
>  	DPRINTK("Disabling LCD controller\n");
>  
> -	set_current_state(TASK_UNINTERRUPTIBLE);
>  	add_wait_queue(&fbi->ctrlr_wait, &wait);
>  
>  	LCSR = 0xffffffff;	/* Clear LCD Status Register */
>  	LCCR0 &= ~LCCR0_LDM;	/* Enable LCD Disable Done Interrupt */
>  	LCCR0 |= LCCR0_DIS;	/* Disable LCD Controller */
>  
> -	schedule_timeout(20 * HZ / 1000);
> +	msleep(20);
>  	remove_wait_queue(&fbi->ctrlr_wait, &wait);

Sorry, but msleep() in not waitqueue friendly, it won't wake_up().


	Domen

--===============76466333016403598==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76466333016403598==--
