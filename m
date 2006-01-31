From: Adrian Bunk <bunk@stusta.de>
Date: Tue, 31 Jan 2006 13:45:17 +0000
Subject: Re: [KJ] [Patch 7/7] BUG_ON() Conversion in mm/vmalloc.c
Message-Id: <20060131134517.GJ3655@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41477746638677648=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138712609.11570.21.camel@alice>
In-Reply-To: <1138712609.11570.21.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============41477746638677648==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 31, 2006 at 02:03:29PM +0100, Eric Sesterhenn / snakebyte wrote:
> hi,  
> 
> this changes if() BUG(); constructs to BUG_ON() which is
> cleaner, contains unlikely() and can better optimized away.
> 
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
> 
> --- linux-2.6.16-rc1-git4/mm/vmalloc.c.orig	2006-01-30 22:26:02.000000000 +0100
> +++ linux-2.6.16-rc1-git4/mm/vmalloc.c	2006-01-30 22:26:56.000000000 +0100
> @@ -321,8 +321,7 @@ void __vunmap(void *addr, int deallocate
>  		int i;
>  
>  		for (i = 0; i < area->nr_pages; i++) {
> -			if (unlikely(!area->pages[i]))
> -				BUG();
> +			BUG_ON(unlikely(!area->pages[i]));
>...

You can drop the unlikely.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============41477746638677648==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41477746638677648==--
