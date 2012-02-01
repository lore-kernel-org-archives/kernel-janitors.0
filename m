From: Rik van Riel <riel@redhat.com>
Date: Wed, 01 Feb 2012 14:59:10 +0000
Subject: Re: [patch] mm: compaction: make compact_control order signed
Message-Id: <4F29533E.2030704@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120201144101.GA5397@elgon.mountain>
In-Reply-To: <20120201144101.GA5397@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mel@csn.ul.ie>, Minchan Kim <minchan@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On 02/01/2012 09:41 AM, Dan Carpenter wrote:
> "order" is -1 when compacting via /proc/sys/vm/compact_memory.  Making
> it unsigned causes a bug in __compact_pgdat() when we test:
>
> 	if (cc->order<  0 || !compaction_deferred(zone, cc->order))
> 		compact_zone(zone, cc);

Good catch!  I had not even thought to check whether
order was signed in struct compact_control, when I
saw code using -1 as an order in various places :)

> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>

Reviewed-by: Rik van Riel <riel@redhat.com>

-- 
All rights reversed
