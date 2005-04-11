From: Domen Puncer <domen@coderock.org>
Date: Mon, 11 Apr 2005 08:42:48 +0000
Subject: Re: [KJ] ioremap() / iounmap() balancing problem in scoop_probe() ?
Message-Id: <20050411084247.GA3958@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99716040208626411=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.61.0504102318150.15064@s1.ckr-solutions.com>
In-Reply-To: <Pine.LNX.4.61.0504102318150.15064@s1.ckr-solutions.com>
To: kernel-janitors@vger.kernel.org

--===============99716040208626411==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/04/05 23:23 +0200, Olivier Kaloudoff wrote:
> Hi,
> 
> 
> 	following the advice of Bertl, I'm trying my first error
> report about the scoop device driver for arm, kernel 2.6.11.5;

Great!

> 
> 	I found that scoop_io_base is only used in scoop.c (once),
> so after use, the memory area should be freed;

Code seems different now (2.6.12-rc2).

> 
> 
> root@nec:/usr/src/linux/arch/arm/common# diff -Naur scoop.c.orig scoop.c
> --- scoop.c.orig        2005-04-10 23:17:06.000000000 +0200
> +++ scoop.c     2005-04-10 23:17:28.000000000 +0200

patch -p1 appliable patches please.

> @@ -107,6 +107,7 @@
>         scoop_io_base = ioremap(mem->start, 0x1000);

Tabs converted to spaces. (copy & paste? try "insert file" or similar)

>         if (!scoop_io_base)
>                 return -ENOMEM;
> +       iounmap(scoop_io_base);

I think the right usage is as it is in -rc2 (code seems a bit changed),
iounmap in remove() after we stop using it.

> 
>         SCOOP_REG(SCOOP_MCR) = 0x0140;
> 
> 
> 	Am I right ?
> 
> 
> Olivier

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============99716040208626411==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99716040208626411==--
