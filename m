From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 05 Oct 2020 06:58:53 +0000
Subject: Re: [PATCH] mm/vmscan: drop unneeded assignment in kswapd()
Message-Id: <alpine.DEB.2.21.2010050831010.6202@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201004125827.17679-1-lukas.bulwahn@gmail.com> <20201004192437.GF3227@techsingularity.net>
In-Reply-To: <20201004192437.GF3227@techsingularity.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech



On Sun, 4 Oct 2020, Mel Gorman wrote:

> On Sun, Oct 04, 2020 at 02:58:27PM +0200, Lukas Bulwahn wrote:
> > The refactoring to kswapd() in commit e716f2eb24de ("mm, vmscan: prevent
> > kswapd sleeping prematurely due to mismatched classzone_idx") turned an
> > assignment to reclaim_order into a dead store, as in all further paths,
> > reclaim_order will be assigned again before it is used.
> > 
> > make clang-analyzer on x86_64 tinyconfig caught my attention with:
> > 
> >   mm/vmscan.c: warning: Although the value stored to 'reclaim_order' is
> >   used in the enclosing expression, the value is never actually read from
> >   'reclaim_order' [clang-analyzer-deadcode.DeadStores]
> > 
> > Compilers will detect this unneeded assignment and optimize this anyway.
> > So, the resulting binary is identical before and after this change.
> > 
> > Simplify the code and remove unneeded assignment to make clang-analyzer
> > happy.
> > 
> > No functional change. No change in binary code.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> I'm not really keen on this. With the patch, reclaim_order can be passed
> uninitialised to kswapd_try_to_sleep. While a sufficiently smart
> compiler might be able to optimise how reclaim_order is used, it's not
> guaranteed either. Similarly, a change in kswapd_try_to_sleep and its
> called functions could rely on reclaim_order being a valid value and
> then introduce a subtle bug.
>

Just for my own understanding:

How would you see reclaim_order being passed unitialised to 
kswapd_try_to_sleep?

From kswapd() entry, any path must reach the line

  alloc_order = reclaim_order = READ_ONCE(pgdat->kswapd_order);

before kswap_try_to_sleep(...).

Then it reads back the order into alloc_order and reclaim_order
and resets pgdat->kswapd to 0.
I argue that the second store to reclaim_order is not used.

Path kthread_should_stop() is true:
Then, it either exits and does not use those temporary values, 
reclaim_order and alloc_order, at all.

Path try_to_freeze() is true:
It goes back to the beginning of the loop and repeats reading alloc_order 
and reclaim_order after the reset to 0, and then passes that to 
kswapd_try_to_sleep(...). Previous reclaim_order is not used.

So, the previous store to alloc_order and reclaim_order is lost.
(Is that intentional?) 

Path try_to_freeze() is false:
We call trace_mm_vmscan_kswapd_wake with alloc_order but not with 
reclaim_order. reclaim_order is set by the return of balance_pgdat(...);
So, the previous reclaim_order is again not used.

The diff in the patch might be a bit small, but we are looking at the 
second assignment after kswapd_try_to_sleep(...), not the first assignment 
that just looks the same.


Lukas
