From: Matthew Dobson <colpatch@us.ibm.com>
Date: Fri, 11 Nov 2005 00:05:19 +0000
Subject: [KJ] [PATCH 7/9] Cleanup cache_reap()
Message-Id: <4373E03F.6060302@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060804000903010100010008"
List-Id: <kernel-janitors.vger.kernel.org>
References: <4373DD82.8010606@us.ibm.com>
In-Reply-To: <4373DD82.8010606@us.ibm.com>
To: kernel-janitors@lists.osdl.org
Cc: manfred@colorfullife.com, Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------060804000903010100010008
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

cache_reap() could also use a little love.  Here's a patch to clean it up.

-Matt

--------------060804000903010100010008
Content-Type: text/x-patch;
 name="cache_reap.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cache_reap.patch"

General readability fixes.

* Goto to end of function instead of duplicating code in case of 
     failure to grab cache_chain_sem.
* Replace a list_for_each/list_entry combo with an identical but
     more readable list_for_each_entry loop.
* Move the declaration of a variables not referenced outside of
     certain loops inside those loops.
* Store the numa_node_id() in a local variable.

Signed-off-by: Matthew Dobson <colpatch@us.ibm.com>

Index: linux-2.6.14+slab_cleanup/mm/slab.c
===================================================================
--- linux-2.6.14+slab_cleanup.orig/mm/slab.c	2005-11-10 11:48:47.540627688 -0800
+++ linux-2.6.14+slab_cleanup/mm/slab.c	2005-11-10 11:48:49.384347400 -0800
@@ -3302,45 +3302,32 @@ static void drain_array_locked(kmem_cach
  */
 static void cache_reap(void *unused)
 {
-	struct list_head *walk;
-	struct kmem_list3 *l3;
-
-	if (down_trylock(&cache_chain_sem)) {
-		/* Give up. Setup the next iteration. */
-		schedule_delayed_work(&__get_cpu_var(reap_work),
-				      REAPTIMEOUT_CPUC + smp_processor_id());
-		return;
-	}
+	kmem_cache_t *searchp;
 
-	list_for_each(walk, &cache_chain) {
-		kmem_cache_t *searchp;
-		struct list_head* p;
-		int tofree;
-		struct slab *slabp;
+	if (down_trylock(&cache_chain_sem))
+		goto out;
 
-		searchp = list_entry(walk, kmem_cache_t, next);
+	list_for_each_entry(searchp, &cache_chain, next) {
+		struct kmem_list3 *l3;
+		int tofree, nid = numa_node_id();
 
 		if (searchp->flags & SLAB_NO_REAP)
 			goto next;
 
 		check_irq_on();
-
-		l3 = searchp->nodelists[numa_node_id()];
+		l3 = searchp->nodelists[nid];
 		if (l3->alien)
 			drain_alien_cache(searchp, l3);
 		spin_lock_irq(&l3->list_lock);
 
-		drain_array_locked(searchp, ac_data(searchp), 0,
-				   numa_node_id());
+		drain_array_locked(searchp, ac_data(searchp), 0, nid);
 
 		if (time_after(l3->next_reap, jiffies))
 			goto next_unlock;
-
 		l3->next_reap = jiffies + REAPTIMEOUT_LIST3;
 
 		if (l3->shared)
-			drain_array_locked(searchp, l3->shared, 0,
-					   numa_node_id());
+			drain_array_locked(searchp, l3->shared, 0, nid);
 
 		if (l3->free_touched) {
 			l3->free_touched = 0;
@@ -3350,7 +3337,9 @@ static void cache_reap(void *unused)
 		tofree = 5 * searchp->num;
 		tofree = (l3->free_limit + tofree - 1) / tofree;
 		do {
-			p = l3->slabs_free.next;
+			struct list_head *p = l3->slabs_free.next;
+			struct slab *slabp;
+
 			if (p == &(l3->slabs_free))
 				break;
 
@@ -3377,6 +3366,7 @@ next:
 	check_irq_on();
 	up(&cache_chain_sem);
 	drain_remote_pages();
+out:
 	/* Setup the next iteration */
 	schedule_delayed_work(&__get_cpu_var(reap_work),
 			      REAPTIMEOUT_CPUC + smp_processor_id());

--------------060804000903010100010008
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060804000903010100010008--
