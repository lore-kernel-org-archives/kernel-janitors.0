From: walter harms <wharms@bfs.de>
Date: Fri, 21 Jan 2005 09:10:39 +0000
Subject: Re: [KJ] [PATCH] gcc-4.0 allyesconfig fixes
Message-Id: <41F0C70F.7080804@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72947768473197661=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120220402.GB22673@ens-lyon.fr>
In-Reply-To: <20050120220402.GB22673@ens-lyon.fr>
To: kernel-janitors@vger.kernel.org

--===============72947768473197661==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Benoit,
i do not think this will work. Numbers are int and i already got some 
strange effects because of that (perhaps gcc 4.0 will handle this better
but dont count on it).  please use: ret= ret << 32L;

on the other side: does readl() return long() ? perhaps it can return
a real 64bit value on a 64bit box ? then whole code is broken.

re,
walter



Benoit Boissinot wrote:
> Hi,
> 
> the following patch (against latest -mm), correct compilation errors with
> gcc-4.0 (snapshot 20050116).
> 
> please correct me if i did something wrong, this is my first patch
> with the linux kernel.
> 
> Benoit
> 
> diff -Naurp --exclude=ctags linux-clean/drivers/char/generic_serial.c linux-2.6-mm-test/drivers/char/generic_serial.c
> --- linux-clean/drivers/char/generic_serial.c	2005-01-20 22:12:57.000000000 +0100
> +++ linux-2.6-mm-test/drivers/char/generic_serial.c	2005-01-20 21:27:11.000000000 +0100
> @@ -36,7 +36,7 @@
>  static char *                  tmp_buf; 
>  static DECLARE_MUTEX(tmp_buf_sem);
>  
> -static int gs_debug;
> +int gs_debug;
>  
>  #ifdef DEBUG
>  #define gs_dprintk(f, str...) if (gs_debug & f) printk (str)
> diff -Naurp --exclude=ctags linux-clean/drivers/net/s2io.h linux-2.6-mm-test/drivers/net/s2io.h
> --- linux-clean/drivers/net/s2io.h	2005-01-20 22:13:01.000000000 +0100
> +++ linux-2.6-mm-test/drivers/net/s2io.h	2005-01-20 21:47:30.000000000 +0100
> @@ -739,8 +739,8 @@ typedef struct s2io_nic {
>  static inline u64 readq(void __iomem *addr)
>  {
>  	u64 ret = readl(addr + 4);
> -	(u64) ret <<= 32;
> -	(u64) ret |= readl(addr);
> +	ret = ret << 32;
> +	ret = ret | readl(addr);
>  
>  	return ret;
>  }
> 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72947768473197661==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72947768473197661==--
