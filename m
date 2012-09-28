From: Glauber Costa <glommer@parallels.com>
Date: Fri, 28 Sep 2012 08:16:39 +0000
Subject: Re: [glommer-memcg:slab-common/slabinfo 18/21] mm/slab_common.c:196:6: sparse: symbol 'print_slabinf
Message-Id: <50655CE7.8060600@parallels.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 09/28/2012 05:19 AM, Fengguang Wu wrote:
> Hi Glauber,
> 

Fenghuang,


> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git slab-common/slabinfo
> head:   0521160acc51bc8385807752e69dd38d976aef22
> commit: 162166afaaa413f42fc655f3a87140b9a08c0a6e [18/21] move print_slabinfo_header to slab_common.c
> 
> + mm/slab_common.c:196:6: sparse: symbol 'print_slabinfo_header' was not declared. Should it be static?

I fixed that.

> --
> + mm/slub.c:1713:6: sparse: symbol 'init_kmem_cache_cpus' was not declared. Should it be static?
> + mm/slub.c:1938:5: sparse: symbol 'put_cpu_partial' was not declared. Should it be static?
> + mm/slub.c:1068:40: sparse: context imbalance in 'free_debug_processing' - different lock contexts for basic block
> + mm/slub.c:1856:28: sparse: context imbalance in 'deactivate_slab' - unexpected unlock
> + mm/slub.c:1885:44: sparse: context imbalance in 'unfreeze_partials' - unexpected unlock
> + mm/slub.c:2539:31: sparse: context imbalance in '__slab_free' - unexpected unlock
> 

My patch does not touch those functions at all. (I checked in git blame,
and they are in the tree for a while now).

If you want to send a patch fixing this upstream, you can add my Acked-by

(I could do that too, but you deserve the credit!)

