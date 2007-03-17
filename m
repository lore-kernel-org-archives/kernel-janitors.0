From: Adrian Bunk <bunk@stusta.de>
Date: Sat, 17 Mar 2007 21:24:08 +0000
Subject: Re: [KJ] is there a kernel standard for assertions?
Message-Id: <20070317212408.GF752@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703171550100.8121@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703171550100.8121@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Mar 17, 2007 at 02:39:25PM -0600, Matthew Wilcox wrote:
> On Sat, Mar 17, 2007 at 03:51:49PM -0400, Robert P. J. Day wrote:
> >   it seems like lots of kernel code is re-inventing the idea of an
> > assertion.  is there no single basic standard for assertions in the
> > kernel?
> 
> BUG_ON().

Or WARN_ON() if it's considered non-fatal.

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
