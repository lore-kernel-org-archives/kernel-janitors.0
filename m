From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 10 Sep 2012 11:15:20 +0000
Subject: [glommer-memcg:kmemcg-slab 52/62] mm/memcontrol.c:542:12: sparse: symbol 'cache_types' was not decla
Message-Id: <20120910111520.GB9660@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mxv5cy4qt+RJ9ypb"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Glauber,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git kmemcg-slab
head:   b20a4abf14992a969b761691f8978a28cacdecb4
commit: f6f83ba0017f1e745a244e822e4ac97ce5b575d0 [52/62] consider a memcg parameter in kmem_create_cache

All sparse warnings:

+ mm/memcontrol.c:542:12: sparse: symbol 'cache_types' was not declared. Should it be static?
  include/linux/cgroup.h:559:16: sparse: cast removes address space of expression
  include/linux/cgroup.h:559:16: sparse: incompatible types in comparison expression (different address spaces)
  include/linux/cgroup.h:559:16: sparse: incompatible types in comparison expression (different address spaces)
  mm/memcontrol.c:4556:21: sparse: incompatible types in comparison expression (different address spaces)
  mm/memcontrol.c:4558:21: sparse: incompatible types in comparison expression (different address spaces)
  mm/memcontrol.c:5739:31: sparse: incompatible types in comparison expression (different address spaces)

vim +542 mm/memcontrol.c
   522		}
   523	}
   524	
   525	#ifdef CONFIG_INET
   526	struct cg_proto *tcp_proto_cgroup(struct mem_cgroup *memcg)
   527	{
   528		if (!memcg || mem_cgroup_is_root(memcg))
   529			return NULL;
   530	
   531		return &memcg->tcp_mem.cg_proto;
   532	}
   533	EXPORT_SYMBOL(tcp_proto_cgroup);
   534	#endif /* CONFIG_INET */
   535	
   536	static inline bool memcg_can_account_kmem(struct mem_cgroup *memcg)
   537	{
   538		return !mem_cgroup_disabled() && !mem_cgroup_is_root(memcg) &&
   539			 (memcg->kmem_accounted & (KMEM_ACCOUNTED_MASK));
   540	}
   541	
 > 542	struct ida cache_types;
   543	
   544	void memcg_register_cache(struct mem_cgroup *memcg, struct kmem_cache *cachep)
   545	{
   546		int id = -1;
   547	
   548		if (!memcg)
   549			id = ida_simple_get(&cache_types, 0, MAX_KMEM_CACHE_TYPES,
   550					    GFP_KERNEL);
   551		cachep->memcg_params.id = id;
   552	}
   553	
   554	void memcg_release_cache(struct kmem_cache *cachep)
   555	{
   556		if (cachep->memcg_params.id != -1)
   557			ida_simple_remove(&cache_types, cachep->memcg_params.id);
   558	}
   559	
   560	/*
   561	 * We need to verify if the allocation against current->mm->owner's memcg is
   562	 * possible for the given order. But the page is not allocated yet, so we'll

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--mxv5cy4qt+RJ9ypb
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-f6f83ba.diff"

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 9972df4..1aa1737 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -539,7 +539,7 @@ static inline bool memcg_can_account_kmem(struct mem_cgroup *memcg)
 		 (memcg->kmem_accounted & (KMEM_ACCOUNTED_MASK));
 }
 
-struct ida cache_types;
+static struct ida cache_types;
 
 void memcg_register_cache(struct mem_cgroup *memcg, struct kmem_cache *cachep)
 {
diff --git a/mm/slub.c b/mm/slub.c
index 63f096e..db5d41e 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1706,7 +1706,7 @@ static inline void note_cmpxchg_failure(const char *n,
 	stat(s, CMPXCHG_DOUBLE_CPU_FAIL);
 }
 
-void init_kmem_cache_cpus(struct kmem_cache *s)
+static void init_kmem_cache_cpus(struct kmem_cache *s)
 {
 	int cpu;
 
@@ -1931,7 +1931,7 @@ static void unfreeze_partials(struct kmem_cache *s)
  * If we did not find a slot then simply move all the partials to the
  * per node partial list.
  */
-int put_cpu_partial(struct kmem_cache *s, struct page *page, int drain)
+static int put_cpu_partial(struct kmem_cache *s, struct page *page, int drain)
 {
 	struct page *oldpage;
 	int pages;

--mxv5cy4qt+RJ9ypb--
