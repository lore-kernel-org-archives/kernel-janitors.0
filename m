From: Hugh Dickins <hughd@google.com>
Date: Mon, 04 Feb 2019 21:37:00 +0000
Subject: Re: About swapoff race patch  (was Re: [PATCH] mm, swap: bounds check swap_info accesses to avoid NU
Message-Id: <alpine.LSU.2.11.1902041257390.4682@eggly.anvils>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114222529.43zay6r242ipw5jb@ca-dmjordan1.us.oracle.com> <20190115002305.15402-1-daniel.m.jordan@oracle.com> <20190129222622.440a6c3af63c57f0aa5c09ca@linux-foundation.org> <87tvhpy22q.fsf_-_@yhuang-dev.intel.com>
 <20190131124655.96af1eb7e2f7bb0905527872@linux-foundation.org>
In-Reply-To: <20190131124655.96af1eb7e2f7bb0905527872@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Huang, Ying" <ying.huang@intel.com>, Daniel Jordan <daniel.m.jordan@oracle.com>, dan.carpenter@oracle.com, andrea.parri@amarulasolutions.com, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, osandov@fb.com, tj@kernel.org, ak@linux.intel.com, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, paulmck@linux.ibm.com, stern@rowland.harvard.edu, peterz@infradead.org, willy@infradead.org, will.deacon@arm.com, hughd@google.com

On Thu, 31 Jan 2019, Andrew Morton wrote:
> On Thu, 31 Jan 2019 10:48:29 +0800 "Huang\, Ying" <ying.huang@intel.com> wrote:
> > Andrew Morton <akpm@linux-foundation.org> writes:
> > > mm-swap-fix-race-between-swapoff-and-some-swap-operations.patch is very
> > > stuck so can you please redo this against mainline?
> > 
> > Allow me to be off topic, this patch has been in mm tree for quite some
> > time, what can I do to help this be merged upstream?

Wow, yes, it's about a year old.

> 
> I have no evidence that it has been reviewed, for a start.  I've asked
> Hugh to look at it.

I tried at the weekend.  Usual story: I don't like it at all, the
ever-increasing complexity there, but certainly understand the need
for that fix, and have not managed to think up anything better -
and now I need to switch away, sorry.

The multiple dynamically allocated and freed swapper address spaces
have indeed broken what used to make it safe.  If those imaginary
address spaces did not have to be virtually contiguous, I'd say
cache them and reuse them, instead of freeing.  But I don't see
how to do that as it stands.

find_get_page(swapper_address_space(entry), swp_offset(entry)) has
become an unsafe construct, where it used to be safe against corrupted
page tables.  Maybe we don't care so much about crashing on corrupted
page tables nowadays (I haven't heard recent complaints), and I think
Huang is correct that lookup_swap_cache() and __read_swap_cache_async()
happen to be the only instances that need to be guarded against swapoff
(the others are working with page table locked).

The array of arrays of swapper spaces is all just to get a separate
lock for separate extents of the swapfile: I wonder whether Matthew has
anything in mind for that in XArray (I think Peter once got it working
in radix-tree, but the overhead not so good).

(I was originally horrified by the stop_machine() added in swapon and
swapoff, but perhaps I'm remembering a distant past of really stopping
the machine: stop_machine() today looked reasonable, something to avoid
generally like lru_add_drain_all(), but not as shameful as I thought.)

Hugh
