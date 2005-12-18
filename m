From: Adrian Bunk <bunk@stusta.de>
Date: Sun, 18 Dec 2005 23:22:14 +0000
Subject: Re: [KJ] [Patch 1/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <20051218232214.GP23349@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55855641150246993=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134946371.7394.5.camel@alice>
In-Reply-To: <1134946371.7394.5.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============55855641150246993==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 18, 2005 at 11:52:51PM +0100, Eric Sesterhenn / snakebyte wrote:
> hi,
> 
> this removes LINUX_VERSION_CODE checks in typhoon.c
> 
> Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>
> 
> --- linux-2.6.15-rc5-git5/drivers/net/typhoon.c.orig	2005-12-18 23:42:15.000000000 +0100
> +++ linux-2.6.15-rc5-git5/drivers/net/typhoon.c	2005-12-18 23:44:37.000000000 +0100
> @@ -333,11 +333,7 @@ enum state_values {
>  #define TYPHOON_RESET_TIMEOUT_NOSLEEP	((6 * 1000000) / TYPHOON_UDELAY)
>  #define TYPHOON_WAIT_TIMEOUT		((1000000 / 2) / TYPHOON_UDELAY)
>  
> -#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 5, 28)
> -#define typhoon_synchronize_irq(x) synchronize_irq()
> -#else
>  #define typhoon_synchronize_irq(x) synchronize_irq(x)
> -#endif
>...

Two comments:
- please Cc subsystem maintainers and driver authors of the code you 
  touch; e.g. sometimes this kind of patches is rejected because the
  driver maintainer does actually support both kernel 2.4 and 2.6 in
  one file
- in this case, you should do an 
  s/typhoon_synchronize_irq/synchronize_irq/g throughout the whole
  file

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============55855641150246993==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55855641150246993==--
