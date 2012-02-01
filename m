From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 01 Feb 2012 21:24:15 +0000
Subject: Re: [patch] mm: compaction: make compact_control order signed
Message-Id: <20120201132415.b09d8710.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120201144101.GA5397@elgon.mountain>
	<20120201124651.9203acde.akpm@linux-foundation.org>
	<4F29ABD6.70704@redhat.com>
In-Reply-To: <4F29ABD6.70704@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Mel Gorman <mel@csn.ul.ie>, Minchan Kim <minchan@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Wed, 01 Feb 2012 16:17:10 -0500
Rik van Riel <riel@redhat.com> wrote:

> >> @@ -35,7 +35,7 @@ struct compact_control {
> >>   	unsigned long migrate_pfn;	/* isolate_migratepages search base */
> >>   	bool sync;			/* Synchronous migration */
> >>
> >> -	unsigned int order;		/* order a direct compactor needs */
> >> +	int order;			/* order a direct compactor needs */
> >>   	int migratetype;		/* MOVABLE, RECLAIMABLE etc */
> >>   	struct zone *zone;
> >>   };
> >
> > One would expect this to significantly change the behaviour of
> > /proc/sys/vm/compact_memory.  Enfeebled minds want to know: is
> > the new behaviour better or worse than the old behaviour?
> 
> The old behaviour and the behaviour post Dan's fix are the
> same.
> 
> My patch temporarily broke things, by testing for order < 0,
> instead of the explicit cc->order = -1 used elsewhere in
> the code.
> 
> I did not notice it in my own testing because I tested on
> 3.2.0 and sent you patches against 3.3-current. It looks
> like this line of code is the one difference between both
> trees I was working on :(
> 
> In my test tree, I had (cc->sync || !compaction_deferred(zone, cc->order)).
> 
> Arguably, testing for cc->order = -1 (or cc->order < 0) is
> better anyway.

I suppose it would be nicer to make the code in __compact_pgdat() match
all the other places whcih do this:

--- a/mm/compaction.c~mm-compaction-make-compact_control-order-signed-fix
+++ a/mm/compaction.c
@@ -686,7 +686,7 @@ static int __compact_pgdat(pg_data_t *pg
 		INIT_LIST_HEAD(&cc->freepages);
 		INIT_LIST_HEAD(&cc->migratepages);
 
-		if (cc->order < 0 || !compaction_deferred(zone, cc->order))
+		if (cc->order = -1 || !compaction_deferred(zone, cc->order))
 			compact_zone(zone, cc);
 
 		if (cc->order > 0) {
_

