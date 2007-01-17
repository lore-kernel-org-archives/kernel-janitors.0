From: Adrian Bunk <bunk@stusta.de>
Date: Wed, 17 Jan 2007 16:56:49 +0000
Subject: Re: [KJ] what's the value of "__deprecated_for_modules"?
Message-Id: <20070117165649.GJ3465@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701171108490.1461@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701171108490.1461@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 17, 2007 at 11:11:46AM -0500, Robert P. J. Day wrote:
> 
>   is there really an overwhelming rationale for the following?
> 
> include/linux/compiler.h:
> -------------------------
> ...
> #ifdef MODULE
> #define __deprecated_for_modules __deprecated
> #else
> #define __deprecated_for_modules
> #endif
> ...

This translates to "this EXPORT_SYMBOL will soon cvanish".

> when there's only one usage of that macro in the entire tree?
> 
>   include/linux/pagemap.h:
> 	extern __deprecated_for_modules struct page * find_trylock_page(
> 
> it just seems odd that a "useful" macro would have only one
> application throughout the entire kernel.

This depends on the tree you are looking at.  ;-)

E.g. in 2.6.19 include/linux/crypto.h contained half a dozen additional 
ones.

One point about deprecated code it that it will be removed - which can 
make the number of concurrent users quite low.

> rday

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
