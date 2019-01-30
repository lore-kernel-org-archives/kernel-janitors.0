From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 30 Jan 2019 06:26:22 +0000
Subject: Re: [PATCH] mm, swap: bounds check swap_info accesses to avoid NULL derefs
Message-Id: <20190129222622.440a6c3af63c57f0aa5c09ca@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114222529.43zay6r242ipw5jb@ca-dmjordan1.us.oracle.com>
	<20190115002305.15402-1-daniel.m.jordan@oracle.com>
In-Reply-To: <20190115002305.15402-1-daniel.m.jordan@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: dan.carpenter@oracle.com, andrea.parri@amarulasolutions.com, shli@kernel.org, ying.huang@intel.com, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, osandov@fb.com, tj@kernel.org, ak@linux.intel.com, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, paulmck@linux.ibm.com, stern@rowland.harvard.edu, peterz@infradead.org, will.deacon@arm.com

On Mon, 14 Jan 2019 19:23:05 -0500 Daniel Jordan <daniel.m.jordan@oracle.com> wrote:

> Dan Carpenter reports a potential NULL dereference in
> get_swap_page_of_type:
> 
>   Smatch complains that the NULL checks on "si" aren't consistent.  This
>   seems like a real bug because we have not ensured that the type is
>   valid and so "si" can be NULL.
> 
> Add the missing check for NULL, taking care to use a read barrier to
> ensure CPU1 observes CPU0's updates in the correct order:
> 
>         CPU0                           CPU1
>         alloc_swap_info()              if (type >= nr_swapfiles)
>           swap_info[type] = p              /* handle invalid entry */
>           smp_wmb()                    smp_rmb()
>           ++nr_swapfiles               p = swap_info[type]
> 
> Without smp_rmb, CPU1 might observe CPU0's write to nr_swapfiles before
> CPU0's write to swap_info[type] and read NULL from swap_info[type].
> 
> Ying Huang noticed that other places don't order these reads properly.
> Introduce swap_type_to_swap_info to encourage correct usage.
> 
> Use READ_ONCE and WRITE_ONCE to follow the Linux Kernel Memory Model
> (see tools/memory-model/Documentation/explanation.txt).
> 
> This ordering need not be enforced in places where swap_lock is held
> (e.g. si_swapinfo) because swap_lock serializes updates to nr_swapfiles
> and the swap_info array.
> 
> This is a theoretical problem, no actual reports of it exist.
> 

LGTM, but like most people I'm afraid to ack it ;)

mm-swap-fix-race-between-swapoff-and-some-swap-operations.patch is very
stuck so can you please redo this against mainline?
