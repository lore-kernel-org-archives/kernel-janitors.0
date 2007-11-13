From: David Chinner <dgc@sgi.com>
Date: Tue, 13 Nov 2007 21:30:13 +0000
Subject: Re: [xfs-masters] Re: [PATCH] fs/xfs: remove duplicated defines
Message-Id: <20071113213013.GZ995458@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071111134351.106efb98@lucky.kitzblitz>
In-Reply-To: <20071111134351.106efb98@lucky.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Nov 13, 2007 at 04:35:40PM +1100, Timothy Shimmin wrote:
> David Chinner wrote:
> > Perhaps we should look at cleaning up the cusers of offtoc, offtoct, etc
> > and killing BPCSHIFT altogether....
> > 
> Yeah, I had a quick look before, but I will look closer again ;-)
> 
>  > egrep -Ir 'offtoc|ctoooff' . | egrep -v "anot|tag"
> ./linux-2.6/xfs_lrw.c:                                  ctooff(offtoct(*offset)),
> ./linux-2.6/xfs_lrw.c:                                  ctooff(offtoct(pos)), -1);
> ./linux-2.6/xfs_lrw.c:                                  ctooff(offtoct(pos)),
> ./linux-2.6/xfs_linux.h:#define offtoc(x)       (((__uint64_t)(x)+(NBPC-1))>>BPCSHIFT)
> ./linux-2.6/xfs_linux.h:#define offtoct(x)      ((xfs_off_t)(x)>>BPCSHIFT)
> ./xfs_vnodeops.c:                               ctooff(offtoct(ioffset)), -1);
> ./xfs_vnodeops.c:                               ctooff(offtoct(ioffset)),
> 
> So we basically just use:
> 
> ctooff(offtoct(pos))
> 
> where
> #define	ctooff(x)	((xfs_off_t)(x)<<BPCSHIFT)
> #define offtoct(x)      ((xfs_off_t)(x)>>BPCSHIFT)
> #define BPCSHIFT        PAGE_SHIFT      /* LOG2(NBPC) if exact */
> 
> seems basically to be a:
> 
> #define round_down_page(x) ((x) & ~(PAGE_SIZE - 1))
> 
> or just use a
> round_down(x, PAGE_SIZE)
> and
> define the round_down for size which is power of 2.
> 
> Like in asm-x86_64/proto.h
> #define round_up(x,y) (((x) + (y) - 1) & ~((y)-1))
> #define round_down(x,y) ((x) & ~((y)-1))
> 
> What way do you reckon?

Neither ;)

Just replace them with (val & PAGE_CACHE_MASK)

Actually, the code in xfs_vnodeops.c culd probably just be removed; the
ioffset variable is already rounded to a multiple of page size....

Cheers,

dave.
-- 
Dave Chinner
Principal Engineer
SGI Australian Software Group
