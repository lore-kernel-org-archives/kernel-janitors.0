From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Sun, 16 Jan 2005 21:11:00 +0000
Subject: [KJ] Re: [PATCH 4/13] ftape: remove cli()/sti() in
Message-Id: <1105908349.12201.11.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92483083895276952=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050116135223.30109.26479.55757@localhost.localdomain>
	 <20050116135250.30109.31739.53624@localhost.localdomain>
In-Reply-To: <20050116135250.30109.31739.53624@localhost.localdomain>
To: James Nelson <james4765@cwazy.co.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@lists.osdl.org, akpm@osdl.org

--===============92483083895276952==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sul, 2005-01-16 at 13:52, James Nelson wrote:
> Signed-off-by: James Nelson <james4765@gmail.com>
> 
> diff -urN --exclude='*~' linux-2.6.11-rc1-mm1-original/drivers/char/ftape/lowlevel/ftape-io.c linux-2.6.11-rc1-mm1/drivers/char/ftape/lowlevel/ftape-io.c
> --- linux-2.6.11-rc1-mm1-original/drivers/char/ftape/lowlevel/ftape-io.c	2005-01-16 07:17:19.000000000 -0500
> +++ linux-2.6.11-rc1-mm1/drivers/char/ftape/lowlevel/ftape-io.c	2005-01-16 07:32:19.293557207 -0500
> @@ -95,15 +95,15 @@
>  
>  		TRACE(ft_t_any, "%d msec, %d ticks", time/1000, ticks);
>  		timeout = ticks;
> -		save_flags(flags);
> -		sti();
> +		local_save_flags(flags);
> +		local_irq_enable();
>  		msleep_interruptible(jiffies_to_msecs(timeout));

This doesn't deal with SMP - please reject


--===============92483083895276952==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92483083895276952==--
