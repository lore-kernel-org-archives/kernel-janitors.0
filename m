From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Sat, 07 Apr 2007 08:45:21 +0000
Subject: [KJ] slab.h-kmalloc_node
Message-Id: <1175934801.4223.27.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Can some one please explain the significance of 'int node' in the below
functions?...as they are clearly not being used in the statements inside
the function.

#ifndef CONFIG_NUMA
static inline void *kmalloc_node(size_t size, gfp_t flags, int node)
{
	return kmalloc(size, flags);
}

static inline void *__kmalloc_node(size_t size, gfp_t flags, int node)
{
	return __kmalloc(size, flags);
}
#endif /* !CONFIG_NUMA */



-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
