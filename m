From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 07 Jun 2007 17:10:54 +0000
Subject: Re: [KJ] remove all content specific to GCC < 3.2??
Message-Id: <20070607171054.GO5500@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706071212280.29467@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706071212280.29467@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jun 07, 2007 at 12:17:42PM -0400, Robert P. J. Day wrote:
> 
>   is it relatively safe to strip the kernel tree of any content that
> is conditional upon unacceptably old versions of GCC?
> 
>   the header file linux/compiler.h already rejects the use of old gnu
> compilers:
>...
> so clearly any gcc < 3.2 is dead in the water, which suggests that any
> content dependent on that can be tossed as well.  as a starting point,
> one can search for the macro __GNUC_MINOR__ to find:
>...
>   seems like a lot of that can be removed.  anyone want to deal with
> that if it seems like a viable project?

None of the lines you have quoted could be removed because they'd deal 
with gcc < 3.2 (the compiler.h and init/main.c #error's should stay).

I already removed all #ifdef's dealing with gcc < 3.2 when the gcc 
requirement was raised to 3.2

> rday
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
