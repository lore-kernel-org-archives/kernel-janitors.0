From: walter harms <wharms@bfs.de>
Date: Wed, 24 Nov 2004 17:25:46 +0000
Subject: Re: [KJ] [patch 5/8] ifdef typos: drivers_net_wireless_wavelan_cs.c
Message-Id: <41A4C41A.4070407@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88966502686995175=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041124153319.GE14789@nd47.coderock.org>
In-Reply-To: <20041124153319.GE14789@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============88966502686995175==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Domen,
nice work :) i never noticed that there are some much typos.

To avoid namespace polution: IMHO its better to define:
wavelan_cd_DEBUG_CONFIG_ERRORS (you get the idea)
stupid long but would avoid conflics with possible other drivers/kernel 
debug defines.

re,
walter

Domen Puncer wrote:
> wavelan.p.h defines *_ERROR
> wavelan_cs.p.h defines *_ERRORS
> Since only second one is included, change #ifdefs
> 
> Signed-off-by: Domen Puncer <domen@coderock.org>
> 
> --- c/drivers/net/wireless/wavelan_cs.c	2004-11-15 13:42:13.000000000 +0100
> +++ str2/drivers/net/wireless/wavelan_cs.c	2004-11-24 15:05:57.000000000 +0100
> @@ -950,7 +950,7 @@ wv_diag(struct net_device *	dev)
>  		  OP0_DIAGNOSE, SR0_DIAGNOSE_PASSED))
>      ret = TRUE;
>  
> -#ifdef DEBUG_CONFIG_ERROR
> +#ifdef DEBUG_CONFIG_ERRORS
>    printk(KERN_INFO "wavelan_cs: i82593 Self Test failed!\n");
>  #endif
>    return(ret);
> @@ -3463,7 +3463,7 @@ wv_ru_stop(struct net_device *	dev)
>    /* If there was a problem */
>    if(spin <= 0)
>      {
> -#ifdef DEBUG_CONFIG_ERROR
> +#ifdef DEBUG_CONFIG_ERRORS
>        printk(KERN_INFO "%s: wv_ru_stop(): The chip doesn't want to stop...\n",
>  	     dev->name);
>  #endif
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88966502686995175==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88966502686995175==--
