From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 10 Sep 2012 11:16:38 +0000
Subject: [glommer-memcg:kmemcg-slab 53/62] mm/memcontrol.c:755:6: sparse: symbol 'memcg_flush_cache_create_qu
Message-Id: <20120910111638.GC9660@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+xNpyl7Qekk2NvDX"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Glauber,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git kmemcg-slab
head:   b20a4abf14992a969b761691f8978a28cacdecb4
commit: db85c41ae676eb65f37b31a59111f2b9b56621ed [53/62] memcg: infrastructure to match an allocation to the right cache

All sparse warnings:

  mm/memcontrol.c:585:12: sparse: symbol 'cache_types' was not declared. Should it be static?
+ mm/memcontrol.c:755:6: sparse: symbol 'memcg_flush_cache_create_queue' was not declared. Should it be static?
  include/linux/cgroup.h:559:16: sparse: cast removes address space of expression
  include/linux/cgroup.h:559:16: sparse: incompatible types in comparison expression (different address spaces)
  include/linux/cgroup.h:559:16: sparse: incompatible types in comparison expression (different address spaces)
  mm/memcontrol.c:4763:21: sparse: incompatible types in comparison expression (different address spaces)
  mm/memcontrol.c:4765:21: sparse: incompatible types in comparison expression (different address spaces)
  mm/memcontrol.c:5946:31: sparse: incompatible types in comparison expression (different address spaces)

vim +755 mm/memcontrol.c

   748	/*
   749	 * Flush the queue of kmem_caches to create, because we're creating a cgroup.
   750	 *
   751	 * We might end up flushing other cgroups' creation requests as well, but
   752	 * they will just get queued again next time someone tries to make a slab
   753	 * allocation for them.
   754	 */
 > 755	void memcg_flush_cache_create_queue(void)
   756	{
   757		struct create_work *cw, *tmp;
   758		unsigned long flags;
   759	
   760		spin_lock_irqsave(&cache_queue_lock, flags);
   761		list_for_each_entry_safe(cw, tmp, &create_queue, list) {
   762			list_del(&cw->list);
   763			kfree(cw);
   764		}
   765		spin_unlock_irqrestore(&cache_queue_lock, flags);
   766	}

Please consider folding the attached diff and ignore conflicts with
the previous one :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--+xNpyl7Qekk2NvDX
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-db85c41.diff"

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index b85814a..fb7f1ca 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -582,7 +582,7 @@ static struct kmem_cache *kmem_cache_dup(struct mem_cgroup *memcg,
 	return new;
 }
 
-struct ida cache_types;
+static struct ida cache_types;
 
 void memcg_register_cache(struct mem_cgroup *memcg, struct kmem_cache *cachep)
 {
@@ -752,7 +752,7 @@ static LIST_HEAD(create_queue);
  * they will just get queued again next time someone tries to make a slab
  * allocation for them.
  */
-void memcg_flush_cache_create_queue(void)
+static void memcg_flush_cache_create_queue(void)
 {
 	struct create_work *cw, *tmp;
 	unsigned long flags;

--+xNpyl7Qekk2NvDX--
