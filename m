From: Matthew Dobson <colpatch@us.ibm.com>
Date: Tue, 08 Nov 2005 19:10:43 +0000
Subject: Re: [KJ] [PATCH 4/8] Cleanup kmem_cache_create()
Message-Id: <4370F833.30906@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF70D.6040604@us.ibm.com> <20051108150008.GL23749@parisc-linux.org> <Pine.LNX.4.58.0511081710280.26730@sbz-30.cs.Helsinki.FI>
In-Reply-To: <Pine.LNX.4.58.0511081710280.26730@sbz-30.cs.Helsinki.FI>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka J Enberg <penberg@cs.Helsinki.FI>
Cc: Matthew Wilcox <matthew@wil.cx>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

Pekka J Enberg wrote:
> On Tue, 8 Nov 2005, Matthew Wilcox wrote:
> 
>>+/*
>>+ * Calculate size (in pages) of slabs, and the num of objs per slab.  This
>>+ * could be made much more intelligent.  For now, try to avoid using high
>>+ * page-orders for slabs.  When the gfp() funcs are more friendly towards
>>+ * high-order requests, this should be changed.
>>+ */
>>+static size_t find_best_slab_order(kmem_cache_t *cachep, size_t size,
>>+					 size_t align, unsigned long flags)
>>+{
> 
> 
> Looks ok to me. I would prefer this to be called calculate_slab_order() 
> instead though.
> 
> 			Pekka

Agreed.  Will include this in the next version, due out this afternoon.

Thank you both for the review and comments.

-Matt
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
