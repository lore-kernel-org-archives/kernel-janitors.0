From: wfg@linux.intel.com
Date: Fri, 06 Jul 2012 08:02:29 +0000
Subject: [infiniband:for-next 13/14] drivers/infiniband/hw/qib/qib_keys.c:64:23: sparse: incompatible types i
Message-Id: <20120706080229.GB28650@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="dc+cDN39EJAMEtIO"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/roland/infiniband.git for-next
head:   04c83d3ce5bbb85f81744b51104522f657fd4ecf
commit: e12deda1747e1cc479ea219c5907fd92d0158566 [13/14] IB/qib: RCU locking for MR validation

All sparse warnings:

+ drivers/infiniband/hw/qib/qib_keys.c:64:23: sparse: incompatible types in comparison expression (different address spaces)
  drivers/infiniband/hw/qib/qib_keys.c:168:22: sparse: incompatible types in comparison expression (different address spaces)
  drivers/infiniband/hw/qib/qib_keys.c:183:14: sparse: incompatible types in comparison expression (different address spaces)
  drivers/infiniband/hw/qib/qib_keys.c:266:22: sparse: incompatible types in comparison expression (different address spaces)
  drivers/infiniband/hw/qib/qib_keys.c:282:14: sparse: incompatible types in comparison expression (different address spaces)
  drivers/infiniband/hw/qib/qib_verbs.c:2010:9: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_verbs.c:2010:9:    expected struct qib_qp *qp0
  drivers/infiniband/hw/qib/qib_verbs.c:2010:9:    got void [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_verbs.c:2011:9: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_verbs.c:2011:9:    expected struct qib_qp *qp1
  drivers/infiniband/hw/qib/qib_verbs.c:2011:9:    got void [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_verbs.c:2036:17: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_verbs.c:2036:17:    expected struct qib_qp *<noident>
  drivers/infiniband/hw/qib/qib_verbs.c:2036:17:    got void [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_verbs.c:2069:9: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_verbs.c:2069:9:    expected struct qib_mregion *dma_mr
  drivers/infiniband/hw/qib/qib_verbs.c:2069:9:    got void [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_verbs.c:2071:17: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_verbs.c:2071:17:    expected struct qib_mregion *<noident>
  drivers/infiniband/hw/qib/qib_verbs.c:2071:17:    got void [noderef] <asn:4>*<noident>

vim +64 drivers/infiniband/hw/qib/qib_keys.c
    61		if (dma_region) {
    62			struct qib_mregion *tmr;
    63	
  > 64			tmr = rcu_dereference(dev->dma_mr);
    65			if (!tmr) {
    66				qib_get_mr(mr);
    67				rcu_assign_pointer(dev->dma_mr, mr);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--dc+cDN39EJAMEtIO
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-IB-qib-RCU-locking-for-MR-validation.patch"

From e12deda1747e1cc479ea219c5907fd92d0158566 Mon Sep 17 00:00:00 2001
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Wed, 27 Jun 2012 18:33:19 -0400
Subject: [PATCH] IB/qib: RCU locking for MR validation

Profiling indicates that MR validation locking is expensive.  The MR
table is largely read-only and is a suitable candidate for RCU locking.

The patch uses RCU locking during validation to eliminate one
lock/unlock during that validation.

Reviewed-by: Mike Heinz <michael.william.heinz@intel.com>
Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
Signed-off-by: Roland Dreier <roland@purestorage.com>
---
 drivers/infiniband/hw/qib/qib_keys.c  |   98 +++++++++++++++++----------------
 drivers/infiniband/hw/qib/qib_mr.c    |    7 +++
 drivers/infiniband/hw/qib/qib_verbs.c |    4 +-
 drivers/infiniband/hw/qib/qib_verbs.h |    7 ++-
 4 files changed, 66 insertions(+), 50 deletions(-)

diff --git a/drivers/infiniband/hw/qib/qib_keys.c b/drivers/infiniband/hw/qib/qib_keys.c
index 8b5ee3a..970165b 100644
--- a/drivers/infiniband/hw/qib/qib_keys.c
+++ b/drivers/infiniband/hw/qib/qib_keys.c
@@ -34,42 +34,43 @@
 #include "qib.h"
 
 /**
  * qib_alloc_lkey - allocate an lkey
  * @mr: memory region that this lkey protects
  * @dma_region: 0->normal key, 1->restricted DMA key
  *
  * Returns 0 if successful, otherwise returns -errno.
  *
- * Increments mr reference count and sets published
- * as required.
+ * Increments mr reference count as required.
  *
  * Sets the lkey field mr for non-dma regions.
  *
  */
 
 int qib_alloc_lkey(struct qib_mregion *mr, int dma_region)
 {
 	unsigned long flags;
 	u32 r;
 	u32 n;
 	int ret = 0;
 	struct qib_ibdev *dev = to_idev(mr->pd->device);
 	struct qib_lkey_table *rkt = &dev->lk_table;
 
 	spin_lock_irqsave(&rkt->lock, flags);
 
 	/* special case for dma_mr lkey == 0 */
 	if (dma_region) {
-		/* should the dma_mr be relative to the pd? */
-		if (!dev->dma_mr) {
+		struct qib_mregion *tmr;
+
+		tmr = rcu_dereference(dev->dma_mr);
+		if (!tmr) {
 			qib_get_mr(mr);
-			dev->dma_mr = mr;
+			rcu_assign_pointer(dev->dma_mr, mr);
 			mr->lkey_published = 1;
 		}
 		goto success;
 	}
 
 	/* Find the next available LKEY */
 	r = rkt->next;
 	n = r;
 	for (;;) {
@@ -87,19 +88,19 @@ int qib_alloc_lkey(struct qib_mregion *mr, int dma_region)
 	rkt->gen++;
 	mr->lkey = (r << (32 - ib_qib_lkey_table_size)) |
 		((((1 << (24 - ib_qib_lkey_table_size)) - 1) & rkt->gen)
 		 << 8);
 	if (mr->lkey == 0) {
 		mr->lkey |= 1 << 8;
 		rkt->gen++;
 	}
 	qib_get_mr(mr);
-	rkt->table[r] = mr;
+	rcu_assign_pointer(rkt->table[r], mr);
 	mr->lkey_published = 1;
 success:
 	spin_unlock_irqrestore(&rkt->lock, flags);
 out:
 	return ret;
 bail:
 	spin_unlock_irqrestore(&rkt->lock, flags);
 	ret = -ENOMEM;
 	goto out;
@@ -114,91 +115,89 @@ void qib_free_lkey(struct qib_mregion *mr)
 	unsigned long flags;
 	u32 lkey = mr->lkey;
 	u32 r;
 	struct qib_ibdev *dev = to_idev(mr->pd->device);
 	struct qib_lkey_table *rkt = &dev->lk_table;
 
 	spin_lock_irqsave(&rkt->lock, flags);
 	if (!mr->lkey_published)
 		goto out;
-	mr->lkey_published = 0;
-
-
-	spin_lock_irqsave(&dev->lk_table.lock, flags);
-	if (lkey == 0) {
-		if (dev->dma_mr && dev->dma_mr == mr) {
-			qib_put_mr(dev->dma_mr);
-			dev->dma_mr = NULL;
-		}
-	} else {
+	if (lkey == 0)
+		rcu_assign_pointer(dev->dma_mr, NULL);
+	else {
 		r = lkey >> (32 - ib_qib_lkey_table_size);
-		qib_put_mr(dev->dma_mr);
-		rkt->table[r] = NULL;
+		rcu_assign_pointer(rkt->table[r], NULL);
 	}
+	qib_put_mr(mr);
+	mr->lkey_published = 0;
 out:
-	spin_unlock_irqrestore(&dev->lk_table.lock, flags);
+	spin_unlock_irqrestore(&rkt->lock, flags);
 }
 
 /**
  * qib_lkey_ok - check IB SGE for validity and initialize
  * @rkt: table containing lkey to check SGE against
+ * @pd: protection domain
  * @isge: outgoing internal SGE
  * @sge: SGE to check
  * @acc: access flags
  *
  * Return 1 if valid and successful, otherwise returns 0.
  *
+ * increments the reference count upon success
+ *
  * Check the IB SGE for validity and initialize our internal version
  * of it.
  */
 int qib_lkey_ok(struct qib_lkey_table *rkt, struct qib_pd *pd,
 		struct qib_sge *isge, struct ib_sge *sge, int acc)
 {
 	struct qib_mregion *mr;
 	unsigned n, m;
 	size_t off;
-	unsigned long flags;
 
 	/*
 	 * We use LKEY == zero for kernel virtual addresses
 	 * (see qib_get_dma_mr and qib_dma.c).
 	 */
-	spin_lock_irqsave(&rkt->lock, flags);
+	rcu_read_lock();
 	if (sge->lkey == 0) {
 		struct qib_ibdev *dev = to_idev(pd->ibpd.device);
 
 		if (pd->user)
 			goto bail;
-		if (!dev->dma_mr)
+		mr = rcu_dereference(dev->dma_mr);
+		if (!mr)
+			goto bail;
+		if (unlikely(!atomic_inc_not_zero(&mr->refcount)))
 			goto bail;
-		qib_get_mr(dev->dma_mr);
-		spin_unlock_irqrestore(&rkt->lock, flags);
+		rcu_read_unlock();
 
-		isge->mr = dev->dma_mr;
+		isge->mr = mr;
 		isge->vaddr = (void *) sge->addr;
 		isge->length = sge->length;
 		isge->sge_length = sge->length;
 		isge->m = 0;
 		isge->n = 0;
 		goto ok;
 	}
-	mr = rkt->table[(sge->lkey >> (32 - ib_qib_lkey_table_size))];
-	if (unlikely(mr == NULL || mr->lkey != sge->lkey ||
-		     mr->pd != &pd->ibpd))
+	mr = rcu_dereference(
+		rkt->table[(sge->lkey >> (32 - ib_qib_lkey_table_size))]);
+	if (unlikely(!mr || mr->lkey != sge->lkey || mr->pd != &pd->ibpd))
 		goto bail;
 
 	off = sge->addr - mr->user_base;
-	if (unlikely(sge->addr < mr->user_base ||
-		     off + sge->length > mr->length ||
-		     (mr->access_flags & acc) != acc))
+	if (unlikely(sge->addr < mr->iova || off + sge->length > mr->length ||
+		     (mr->access_flags & acc) == 0))
 		goto bail;
-	qib_get_mr(mr);
-	spin_unlock_irqrestore(&rkt->lock, flags);
+	if (unlikely(!atomic_inc_not_zero(&mr->refcount)))
+		goto bail;
+	rcu_read_unlock();
 
 	off += mr->offset;
 	if (mr->page_shift) {
 		/*
 		page sizes are uniform power of 2 so no loop is necessary
 		entries_spanned_by_off is the number of times the loop below
 		would have executed.
 		*/
 		size_t entries_spanned_by_off;
@@ -222,77 +221,82 @@ int qib_lkey_ok(struct qib_lkey_table *rkt, struct qib_pd *pd,
 	isge->mr = mr;
 	isge->vaddr = mr->map[m]->segs[n].vaddr + off;
 	isge->length = mr->map[m]->segs[n].length - off;
 	isge->sge_length = sge->length;
 	isge->m = m;
 	isge->n = n;
 ok:
 	return 1;
 bail:
-	spin_unlock_irqrestore(&rkt->lock, flags);
+	rcu_read_unlock();
 	return 0;
 }
 
 /**
  * qib_rkey_ok - check the IB virtual address, length, and RKEY
- * @dev: infiniband device
- * @ss: SGE state
+ * @qp: qp for validation
+ * @sge: SGE state
  * @len: length of data
  * @vaddr: virtual address to place data
  * @rkey: rkey to check
  * @acc: access flags
  *
  * Return 1 if successful, otherwise 0.
+ *
+ * increments the reference count upon success
  */
 int qib_rkey_ok(struct qib_qp *qp, struct qib_sge *sge,
 		u32 len, u64 vaddr, u32 rkey, int acc)
 {
 	struct qib_lkey_table *rkt = &to_idev(qp->ibqp.device)->lk_table;
 	struct qib_mregion *mr;
 	unsigned n, m;
 	size_t off;
-	unsigned long flags;
 
 	/*
 	 * We use RKEY == zero for kernel virtual addresses
 	 * (see qib_get_dma_mr and qib_dma.c).
 	 */
-	spin_lock_irqsave(&rkt->lock, flags);
+	rcu_read_lock();
 	if (rkey == 0) {
 		struct qib_pd *pd = to_ipd(qp->ibqp.pd);
 		struct qib_ibdev *dev = to_idev(pd->ibpd.device);
 
 		if (pd->user)
 			goto bail;
-		if (!dev->dma_mr)
+		mr = rcu_dereference(dev->dma_mr);
+		if (!mr)
 			goto bail;
-		qib_get_mr(dev->dma_mr);
-		spin_unlock_irqrestore(&rkt->lock, flags);
+		if (unlikely(!atomic_inc_not_zero(&mr->refcount)))
+			goto bail;
+		rcu_read_unlock();
 
-		sge->mr = dev->dma_mr;
+		sge->mr = mr;
 		sge->vaddr = (void *) vaddr;
 		sge->length = len;
 		sge->sge_length = len;
 		sge->m = 0;
 		sge->n = 0;
 		goto ok;
 	}
 
-	mr = rkt->table[(rkey >> (32 - ib_qib_lkey_table_size))];
-	if (unlikely(mr == NULL || mr->lkey != rkey || qp->ibqp.pd != mr->pd))
+	mr = rcu_dereference(
+		rkt->table[(rkey >> (32 - ib_qib_lkey_table_size))]);
+	if (unlikely(!mr || mr->lkey != rkey || qp->ibqp.pd != mr->pd))
 		goto bail;
 
 	off = vaddr - mr->iova;
 	if (unlikely(vaddr < mr->iova || off + len > mr->length ||
 		     (mr->access_flags & acc) == 0))
 		goto bail;
-	qib_get_mr(mr);
-	spin_unlock_irqrestore(&rkt->lock, flags);
+	if (unlikely(!atomic_inc_not_zero(&mr->refcount)))
+		goto bail;
+	rcu_read_unlock();
 
 	off += mr->offset;
 	if (mr->page_shift) {
 		/*
 		page sizes are uniform power of 2 so no loop is necessary
 		entries_spanned_by_off is the number of times the loop below
 		would have executed.
 		*/
 		size_t entries_spanned_by_off;
@@ -316,19 +320,19 @@ int qib_rkey_ok(struct qib_qp *qp, struct qib_sge *sge,
 	sge->mr = mr;
 	sge->vaddr = mr->map[m]->segs[n].vaddr + off;
 	sge->length = mr->map[m]->segs[n].length - off;
 	sge->sge_length = len;
 	sge->m = m;
 	sge->n = n;
 ok:
 	return 1;
 bail:
-	spin_unlock_irqrestore(&rkt->lock, flags);
+	rcu_read_unlock();
 	return 0;
 }
 
 /*
  * Initialize the memory region specified by the work reqeust.
  */
 int qib_fast_reg_mr(struct qib_qp *qp, struct ib_send_wr *wr)
 {
 	struct qib_lkey_table *rkt = &to_idev(qp->ibqp.device)->lk_table;
diff --git a/drivers/infiniband/hw/qib/qib_mr.c b/drivers/infiniband/hw/qib/qib_mr.c
index 6a2028a..e6687de 100644
--- a/drivers/infiniband/hw/qib/qib_mr.c
+++ b/drivers/infiniband/hw/qib/qib_mr.c
@@ -521,9 +521,16 @@ int qib_dealloc_fmr(struct ib_fmr *ibfmr)
 		qib_get_mr(&fmr->mr);
 		ret = -EBUSY;
 		goto out;
 	}
 	deinit_qib_mregion(&fmr->mr);
 	kfree(fmr);
 out:
 	return ret;
 }
+
+void mr_rcu_callback(struct rcu_head *list)
+{
+	struct qib_mregion *mr = container_of(list, struct qib_mregion, list);
+
+	complete(&mr->comp);
+}
diff --git a/drivers/infiniband/hw/qib/qib_verbs.c b/drivers/infiniband/hw/qib/qib_verbs.c
index 76d7ce8..59cdea3 100644
--- a/drivers/infiniband/hw/qib/qib_verbs.c
+++ b/drivers/infiniband/hw/qib/qib_verbs.c
@@ -2060,19 +2060,21 @@ int qib_register_ib_device(struct qib_devdata *dd)
 	spin_lock_init(&dev->lk_table.lock);
 	dev->lk_table.max = 1 << ib_qib_lkey_table_size;
 	lk_tab_size = dev->lk_table.max * sizeof(*dev->lk_table.table);
 	dev->lk_table.table = (struct qib_mregion **)
 		__get_free_pages(GFP_KERNEL, get_order(lk_tab_size));
 	if (dev->lk_table.table == NULL) {
 		ret = -ENOMEM;
 		goto err_lk;
 	}
-	memset(dev->lk_table.table, 0, lk_tab_size);
+	RCU_INIT_POINTER(dev->dma_mr, NULL);
+	for (i = 0; i < dev->lk_table.max; i++)
+		RCU_INIT_POINTER(dev->lk_table.table[i], NULL);
 	INIT_LIST_HEAD(&dev->pending_mmaps);
 	spin_lock_init(&dev->pending_lock);
 	dev->mmap_offset = PAGE_SIZE;
 	spin_lock_init(&dev->mmap_offset_lock);
 	INIT_LIST_HEAD(&dev->piowait);
 	INIT_LIST_HEAD(&dev->dmawait);
 	INIT_LIST_HEAD(&dev->txwait);
 	INIT_LIST_HEAD(&dev->memwait);
 	INIT_LIST_HEAD(&dev->txreq_free);
diff --git a/drivers/infiniband/hw/qib/qib_verbs.h b/drivers/infiniband/hw/qib/qib_verbs.h
index 4a2277b..85751fd 100644
--- a/drivers/infiniband/hw/qib/qib_verbs.h
+++ b/drivers/infiniband/hw/qib/qib_verbs.h
@@ -297,20 +297,21 @@ struct qib_mregion {
 	u64 user_base;          /* User's address for this region */
 	u64 iova;               /* IB start address of this region */
 	size_t length;
 	u32 lkey;
 	u32 offset;             /* offset (bytes) to start of region */
 	int access_flags;
 	u32 max_segs;           /* number of qib_segs in all the arrays */
 	u32 mapsz;              /* size of the map array */
 	u8  page_shift;         /* 0 - non unform/non powerof2 sizes */
-	u8  lkey_published;	/* in global table */
+	u8  lkey_published;     /* in global table */
 	struct completion comp; /* complete when refcount goes to zero */
+	struct rcu_head list;
 	atomic_t refcount;
 	struct qib_segarray *map[0];    /* the segments */
 };
 
 /*
  * These keep track of the copy progress within a memory region.
  * Used by the verbs layer.
  */
 struct qib_sge {
@@ -1016,22 +1017,24 @@ int qib_map_phys_fmr(struct ib_fmr *ibfmr, u64 *page_list,
 int qib_unmap_fmr(struct list_head *fmr_list);
 
 int qib_dealloc_fmr(struct ib_fmr *ibfmr);
 
 static inline void qib_get_mr(struct qib_mregion *mr)
 {
 	atomic_inc(&mr->refcount);
 }
 
+void mr_rcu_callback(struct rcu_head *list);
+
 static inline void qib_put_mr(struct qib_mregion *mr)
 {
 	if (unlikely(atomic_dec_and_test(&mr->refcount)))
-		complete(&mr->comp);
+		call_rcu(&mr->list, mr_rcu_callback);
 }
 
 static inline void qib_put_ss(struct qib_sge_state *ss)
 {
 	while (ss->num_sge) {
 		qib_put_mr(ss->sge.mr);
 		if (--ss->num_sge)
 			ss->sge = *ss->sg_list++;
 	}
-- 
1.7.10


--dc+cDN39EJAMEtIO--
