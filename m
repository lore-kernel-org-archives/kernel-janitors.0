From: Jaco Kroon <jaco@kroon.co.za>
Date: Sat, 07 Apr 2007 09:01:55 +0000
Subject: Re: [KJ] slab.h-kmalloc_node
Message-Id: <46175E03.1070200@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1175934801.4223.27.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1175934801.4223.27.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Vignesh Babu BM wrote:
> Can some one please explain the significance of 'int node' in the below
> functions?...as they are clearly not being used in the statements inside
> the function.
> 
> #ifndef CONFIG_NUMA
> static inline void *kmalloc_node(size_t size, gfp_t flags, int node)
> {
> 	return kmalloc(size, flags);
> }
> 
> static inline void *__kmalloc_node(size_t size, gfp_t flags, int node)
> {
> 	return __kmalloc(size, flags);
> }
> #endif /* !CONFIG_NUMA */

These functions are only compiled for non-NUMA systems, as such I would 
wager a guess that the NUMA versions does use the node, and from what I 
understand of NUMA a node would refer to the memory node on which the 
callee would prefer to have the memory allocated.

These functions are thus probably provided simply for convenience, to 
allow NUMA optimized code to still compile on non-NUMA systems.

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
