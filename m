From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 01 Feb 2012 20:46:51 +0000
Subject: Re: [patch] mm: compaction: make compact_control order signed
Message-Id: <20120201124651.9203acde.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120201144101.GA5397@elgon.mountain>
In-Reply-To: <20120201144101.GA5397@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mel Gorman <mel@csn.ul.ie>, Minchan Kim <minchan@kernel.org>, Rik van Riel <riel@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Wed, 1 Feb 2012 17:41:01 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> "order" is -1 when compacting via /proc/sys/vm/compact_memory.  Making
> it unsigned causes a bug in __compact_pgdat() when we test:
> 
> 	if (cc->order < 0 || !compaction_deferred(zone, cc->order))
> 		compact_zone(zone, cc);
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 382831e..5f80a11 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -35,7 +35,7 @@ struct compact_control {
>  	unsigned long migrate_pfn;	/* isolate_migratepages search base */
>  	bool sync;			/* Synchronous migration */
>  
> -	unsigned int order;		/* order a direct compactor needs */
> +	int order;			/* order a direct compactor needs */
>  	int migratetype;		/* MOVABLE, RECLAIMABLE etc */
>  	struct zone *zone;
>  };

One would expect this to significantly change the behaviour of
/proc/sys/vm/compact_memory.  Enfeebled minds want to know: is
the new behaviour better or worse than the old behaviour?
