From: Adrian Bunk <bunk@stusta.de>
Date: Mon, 30 May 2005 00:03:27 +0000
Subject: Re: [KJ] [PATCH] Fix misleading gcc4 warning,
Message-Id: <20050530000327.GG10441@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14136567217676599=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42966B18.6020802@cs.pdx.edu>
In-Reply-To: <42966B18.6020802@cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============14136567217676599==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 26, 2005 at 08:52:14PM -0700, randy_dunlap wrote:
> On Thu, 26 May 2005 17:34:32 -0700 Jesse Millan wrote:
> 
> | 
> | This warning is a false alarm.
> | 
> | This patch eliminates the warning that addr may be used uninitialized in
> | the function it87_find. addr is not used uninitialized.
> 
> It's 'address', not 'addr'.
> 
> 
> --- linux-2.6.12-rc5/drivers/i2c/chips/it87.c~	2005-05-26 16:35:24.852065714 -0700
> +++ linux-2.6.12-rc5/drivers/i2c/chips/it87.c	2005-05-26 17:20:31.311097793 -0700
> @@ -718,6 +718,10 @@ static int it87_find(int *address)
>  {
>  	int err = -ENODEV;
> 
> +	/* Suppress misleading GCC warning:
> +	 * 'address' may be used uninitialized in this function. */
> +	*address = 0;
> +
> 
> Lose the comments.  Just use patch comments (saved in the SCM) for such
> comments, not source files.
> 
> If I knew enough about compilers, I would just blame this on the compiler
> and not fix it in the Linux source code (which just covers up the
> compiler bug IMO).

I'm not seeing this warning.

Which gcc version are you using?

> ~Randy

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============14136567217676599==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14136567217676599==--
