From: David Rientjes <rientjes@google.com>
Date: Wed, 26 Sep 2012 04:18:02 +0000
Subject: Re: [PATCH] mm/slab: Fix kmem_cache_alloc_node_trace() declaration
Message-Id: <alpine.DEB.2.00.1209252115000.28360@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348571229-844-1-git-send-email-elezegarcia@gmail.com> <1348571229-844-2-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1348571229-844-2-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ezequiel Garcia <elezegarcia@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-mm@kvack.org, fengguang.wu@intel.com, Pekka Enberg <penberg@kernel.org>

On Tue, 25 Sep 2012, Ezequiel Garcia wrote:

> The bug was introduced in commit 4052147c0afa
> "mm, slab: Match SLAB and SLUB kmem_cache_alloc_xxx_trace() prototype".
> 

This isn't a candidate for kernel-janitors@vger.kernel.org, these are 
patches that are one of Pekka's branches and would never make it to Linus' 
tree in this form.

> Cc: Pekka Enberg <penberg@kernel.org>
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>

Acked-by: David Rientjes <rientjes@google.com>

So now we have this for SLAB:

extern void *kmem_cache_alloc_node_trace(size_t size,
					 struct kmem_cache *cachep,
					 gfp_t flags,
					 int nodeid);

and this for SLUB:

extern void *kmem_cache_alloc_node_trace(struct kmem_cache *s,
					 gfp_t gfpflags,
					 int node, size_t size);

Would you like to send a follow-up patch to make these the same?  (My 
opinion is that the SLUB variant is the correct order.)
