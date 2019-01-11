From: Andrea Parri <andrea.parri@amarulasolutions.com>
Date: Fri, 11 Jan 2019 23:20:07 +0000
Subject: Re: [PATCH] mm, swap: Potential NULL dereference in get_swap_page_of_type()
Message-Id: <20190111232007.GA27982@andrea>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190111095919.GA1757@kadam>
 <20190111174128.oak64htbntvp7j6y@ca-dmjordan1.us.oracle.com>
In-Reply-To: <20190111174128.oak64htbntvp7j6y@ca-dmjordan1.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Shaohua Li <shli@kernel.org>, Huang Ying <ying.huang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Omar Sandoval <osandov@fb.com>, Tejun Heo <tj@kernel.org>, Andi Kleen <ak@linux.intel.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.ibm.com>, Alan Stern <stern@rowland.harvard.edu>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>

Hi Daniel,

On Fri, Jan 11, 2019 at 09:41:28AM -0800, Daniel Jordan wrote:
> On Fri, Jan 11, 2019 at 12:59:19PM +0300, Dan Carpenter wrote:
> > Smatch complains that the NULL checks on "si" aren't consistent.  This
> > seems like a real bug because we have not ensured that the type is
> > valid and so "si" can be NULL.
> > 
> > Fixes: ec8acf20afb8 ("swap: add per-partition lock for swapfile")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  mm/swapfile.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index f0edf7244256..21e92c757205 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -1048,9 +1048,12 @@ swp_entry_t get_swap_page_of_type(int type)
> >  	struct swap_info_struct *si;
> >  	pgoff_t offset;
> >  
> > +	if (type >= nr_swapfiles)
> > +		goto fail;
> > +
> 
> As long as we're worrying about NULL, I think there should be an smp_rmb here
> to ensure swap_info[type] isn't NULL in case of an (admittedly unlikely) racing
> swapon that increments nr_swapfiles.  See smp_wmb in alloc_swap_info and the
> matching smp_rmb's in the file.  And READ_ONCE's on either side of the barrier
> per LKMM.
> 
> I'm adding Andrea (randomly selected from the many LKMM folks to avoid spamming
> all) who can correct me if I'm wrong about any of this.

This is to confirm that your analysis seems correct to me: the barriers
should guarantee that get_swap_page_of_type() will observe the store to
swap_info[type] performed by alloc_swap_info() (or a "co"-later store),
provided get_swap_page_of_type() observes the increment of nr_swapfiles
performed by the (same instance of) alloc_swap_info().

One clarification about the READ_ONCE() matter: the LKMM cannot handle
plain or unmarked (shared memory) accesses in their generality at the
moment (patches providing support for these accesses are in the making,
but they will take some time); IAC, I'm confident to anticipate that,
for the particular pattern in question (aka, MP), marking the accesses
to nr_swapfiles will be "LKMM-sane" (one way to achieve this would be
to convert nr_swapfiles to an atomic_t type...).

I take the liberty of adding other LKMM folks (so that they can blame
me for "the spam"! ;-) ): I've learnt from experience that four or more
eyes are better than two when it comes to discuss these matters... ;-)

  Andrea


> 
> >  	si = swap_info[type];
> >  	spin_lock(&si->lock);
> > -	if (si && (si->flags & SWP_WRITEOK)) {
> > +	if (si->flags & SWP_WRITEOK) {
> >  		atomic_long_dec(&nr_swap_pages);
> >  		/* This is called for allocating swap entry, not cache */
> >  		offset = scan_swap_map(si, 1);
> > @@ -1061,6 +1064,7 @@ swp_entry_t get_swap_page_of_type(int type)
> >  		atomic_long_inc(&nr_swap_pages);
> >  	}
> >  	spin_unlock(&si->lock);
> > +fail:
> >  	return (swp_entry_t) {0};
> >  }
> >  
> > -- 
> > 2.17.1
> > 
