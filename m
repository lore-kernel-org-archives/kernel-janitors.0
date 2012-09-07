From: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 07 Sep 2012 08:07:30 +0000
Subject: Re: [next:akpm 72/246] mm/vmscan.c:1787:10: error: 'struct zone' has no member named 'compact_order_
Message-Id: <20120907010730.09495427.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120907075535.GA18981@localhost>
In-Reply-To: <20120907075535.GA18981@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 7 Sep 2012 15:55:35 +0800 Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hi Mel,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> head:   d28e1f373a79e532eecbe6b17beeb4d2052c1a52
> commit: 038b615836d456496d321156271e47881469c8fd [72/246] mm: vmscan: scale number of pages reclaimed by reclaim/compaction based on failures
> config: i386-randconfig-k925 (attached as .config)
> 
> All related error/warning messages:
> 
> mm/vmscan.c: In function 'should_continue_reclaim':
> mm/vmscan.c:1787:10: error: 'struct zone' has no member named 'compact_order_failed'
> mm/vmscan.c:1788:32: error: 'struct zone' has no member named 'compact_defer_shift'

hm, Does that tree not include
http://ozlabs.org/~akpm/mmotm/broken-out/mm-vmscan-scale-number-of-pages-reclaimed-by-reclaim-compaction-based-on-failures-fix.patch
? 

Perhaps that linux-next is using the previous mm - I did a new release
earlier today.  
