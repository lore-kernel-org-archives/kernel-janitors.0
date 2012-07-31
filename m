From: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 31 Jul 2012 19:10:53 +0000
Subject: Re: [next:akpm 121/309] include/linux/page-flags.h:462:2: error: implicit declaration of function 'V
Message-Id: <20120731121053.5baf91ff.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120722163512.GC13376@localhost>
In-Reply-To: <20120722163512.GC13376@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 31 Jul 2012 11:24:06 +0100
Mel Gorman <mgorman@suse.de> wrote:

> Andrew, can you pick this patch up please? It's a fix for the patch
> "mm: sl[au]b: add knowledge of PFMEMALLOC reserve pages". When merged,
> it may collide with the patch immediately after it but the resolution is
> straight-forward and the end result is the same. Thanks.
> 
> ---8<---
> buildfix: mm: sl[au]b: add knowledge of PFMEMALLOC reserve pages

yup, I added this last week.  The -mm code in linux-next is pretty
old.  I can't do much about that because the trees are such a 
ghastly mess during the merge window.
