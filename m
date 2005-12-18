From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 18 Dec 2005 23:07:55 +0000
Subject: Re: [KJ] [Patch 1/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <20051218230755.GO2361@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89923708407486025=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134946371.7394.5.camel@alice>
In-Reply-To: <1134946371.7394.5.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============89923708407486025==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 18, 2005 at 11:52:51PM +0100, Eric Sesterhenn / snakebyte wrote:
> this removes LINUX_VERSION_CODE checks in typhoon.c
> -#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 5, 28)
> -#define typhoon_synchronize_irq(x) synchronize_irq()
> -#else
>  #define typhoon_synchronize_irq(x) synchronize_irq(x)
> -#endif

Probably you should remove typhoon_synchronize_irq altogether.


--===============89923708407486025==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89923708407486025==--
