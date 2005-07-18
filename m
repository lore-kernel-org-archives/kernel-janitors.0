From: Domen Puncer <domen@coderock.org>
Date: Mon, 18 Jul 2005 16:18:23 +0000
Subject: Re: [KJ] [PATCH] drivers/net/ne2k-pci.c : Use of the time_after()
Message-Id: <20050718161823.GE2457@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64777354973415235=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <425F030B.5000008@feitoza.com.br>
In-Reply-To: <425F030B.5000008@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

--===============64777354973415235==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16/07/05 04:17 -0300, Marcelo Feitoza Parisi wrote:

> Use of the time_after() macro, defined at linux/jiffies.h, which deal
> with wrapping correctly and are nicer to read.
> 
> Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
> 
> --- linux/drivers/net/ne2k-pci.c	2005-07-13 17:53:29.000000000 -0300
> +++ linux-kj/drivers/net/ne2k-pci.c	2005-07-15 22:21:44.302017824 -0300
> @@ -280,7 +280,7 @@
>  		*/
>  		while ((inb(ioaddr + EN0_ISR) & ENISR_RESET) == 0)
>  			/* Limit wait: '2' avoids jiffy roll-over. */

We can get rid of the comment.

> -			if (jiffies - reset_start_time > 2) {

> +			if (time_after(jiffies, reset_start_time + 2)) {

And use just "> 1", as it still guarantees 1 jiffie.

> +		if (time_after(jiffies, reset_start_time + 2)) {

> +		if (time_after(jiffies, dma_start + 2)) {	/* Avoid clock roll-over. */


Also, HZ and/or whitespace issues with:
drivers/net/eexpress.c
drivers/net/eth16i.c
drivers/atm/iphase.c

OK, whitespace I can fix quickly, but for HZ figure out what is
intended, and resend with that in description. Thanks.

--===============64777354973415235==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64777354973415235==--
