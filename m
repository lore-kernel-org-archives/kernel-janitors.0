From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 09 Jan 2006 16:44:34 +0000
Subject: Re: [KJ] 8139too.c
Message-Id: <20060109164433.GB13159@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11964094082833698=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601091104.39196.cneira@srb.cl>
In-Reply-To: <200601091104.39196.cneira@srb.cl>
To: kernel-janitors@vger.kernel.org

--===============11964094082833698==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2006 at 11:04:38AM +0000, carlos neira wrote:
> This patch uses wait_event_interruptible instead of  slep_on_interruptible , 
> compiled ok  , using it right now.
> Please some comments if i messed something up .

> diff -urN /usr/src/linux-2.6.15-rc7/drivers/net/8139too.c /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/net/8139too.c
> --- /usr/src/linux-2.6.15-rc7/drivers/net/8139too.c	2005-12-24 20:47:48.000000000 -0300
> +++ /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/net/8139too.c	2006-01-08 20:57:01.000000000 -0300

Please, read Documentation/SubmittingPatches for the proper format.

>  	while (1) {
>  		timeout = next_tick;
>  		do {
> -			timeout = interruptible_sleep_on_timeout (&tp->thr_wait, timeout);
> -			/* make swsusp happy with our thread */
> -			try_to_freeze();
> -		} while (!signal_pending (current) && (timeout > 0));
> +		  
> +		 gotsignal = wait_event_interruptible(rlq,timeout > 0);	
> +		  
> +		} while (gotsignal != 0  && (timeout > 0));
>  
> +		

I'm sure swsusp won't be happy with this change.


--===============11964094082833698==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11964094082833698==--
