From: wfg@linux.intel.com
Date: Fri, 06 Jul 2012 08:01:59 +0000
Subject: [infiniband:for-next 12/14] drivers/infiniband/hw/qib/qib_keys.c:138:31: sparse: context imbalance i
Message-Id: <20120706080159.GA28650@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="n8g4imXOkfNTN/H1"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/roland/infiniband.git for-next
head:   04c83d3ce5bbb85f81744b51104522f657fd4ecf
commit: b9c68a92f8171acc43b1207799ccec7d790fd114 [12/14] IB/qib: Avoid returning EBUSY from MR deregister

All sparse warnings:

+ drivers/infiniband/hw/qib/qib_keys.c:138:31: sparse: context imbalance in 'qib_free_lkey' - wrong count at exit
  drivers/infiniband/hw/qib/qib_qp.c:229:17: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_qp.c:229:17:    expected struct qib_qp *qp0
  drivers/infiniband/hw/qib/qib_qp.c:229:17:    got struct qib_qp [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_qp.c:231:17: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_qp.c:231:17:    expected struct qib_qp *qp1
  drivers/infiniband/hw/qib/qib_qp.c:231:17:    got struct qib_qp [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_qp.c:234:17: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_qp.c:234:17:    expected struct qib_qp *<noident>
  drivers/infiniband/hw/qib/qib_qp.c:234:17:    got struct qib_qp [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_qp.c:255:17: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_qp.c:255:17:    expected struct qib_qp *qp0
  drivers/infiniband/hw/qib/qib_qp.c:255:17:    got void [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_qp.c:258:17: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_qp.c:258:17:    expected struct qib_qp *qp1
  drivers/infiniband/hw/qib/qib_qp.c:258:17:    got void [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_qp.c:266:33: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_qp.c:266:33:    expected struct qib_qp *<noident>
  drivers/infiniband/hw/qib/qib_qp.c:266:33:    got struct qib_qp [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_qp.c:296:21: sparse: incompatible types in comparison expression (different address spaces)
  drivers/infiniband/hw/qib/qib_qp.c:298:21: sparse: incompatible types in comparison expression (different address spaces)
  drivers/infiniband/hw/qib/qib_qp.c:332:30: sparse: incompatible types in comparison expression (different address spaces)
  drivers/infiniband/hw/qib/qib_qp.c:334:30: sparse: incompatible types in comparison expression (different address spaces)
  drivers/infiniband/hw/qib/qib_qp.c:340:45: sparse: incompatible types in comparison expression (different address spaces)
  drivers/infiniband/hw/qib/qib_verbs.c:2010:9: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_verbs.c:2010:9:    expected struct qib_qp *qp0
  drivers/infiniband/hw/qib/qib_verbs.c:2010:9:    got void [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_verbs.c:2011:9: sparse: incorrect type in assignment (different address spaces)
  drivers/infiniband/hw/qib/qib_verbs.c:2011:9:    expected struct qib_qp *qp1
  drivers/infiniband/hw/qib/qib_verbs.c:2011:9:    got void [noderef] <asn:4>*<noident>
  drivers/infiniband/hw/qib/qib_verbs.c:2036:17: sparse: incorrect type in assignment (different address spaces)

vim +138 drivers/infiniband/hw/qib/qib_keys.c
   135			rkt->table[r] = NULL;
   136		}
   137	out:
 > 138		spin_unlock_irqrestore(&dev->lk_table.lock, flags);
   139	}
   140	
   141	/**

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--n8g4imXOkfNTN/H1
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-IB-qib-Avoid-returning-EBUSY-from-MR-deregister.patch"

From b9c68a92f8171acc43b1207799ccec7d790fd114 Mon Sep 17 00:00:00 2001
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Wed, 27 Jun 2012 18:33:12 -0400
Subject: [PATCH] IB/qib: Avoid returning EBUSY from MR deregister

A timing issue can occur where qib_mr_dereg can return -EBUSY if the
MR use count is not zero.

This can occur if the MR is de-registered while RDMA read response
packets are being progressed from the SDMA ring.  The suspicion is
that the peer sent an RDMA read request, which has already been copied
across to the peer.  The peer sees the completion of his request and
then communicates to the responder that the MR is not needed any
longer.  The responder tries to de-register the MR, catching some
responses remaining in the SDMA ring holding the MR use count.

The code now uses a get/put paradigm to track MR use counts and
coordinates with the MR de-registration process using a completion
when the count has reached zero.  A timeout on the delay is in place
to catch other EBUSY issues.

The reference count protocol is as follows:
- The return to the user counts as 1
- A reference from the lk_table or the qib_ibdev counts as 1.
- Transient I/O operations increase/decrease as necessary

A lot of code duplication has been folded into the new routines
init_qib_mregion() and deinit_qib_mregion().  Additionally, explicit
initialization of fields to zero is now handled by kzalloc().

Also, duplicated code 'while.*num_sge' that decrements reference
counts have been consolidated in qib_put_ss().

Reviewed-by: Ramkrishna Vepa <ramkrishna.vepa@intel.com>
Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
Signed-off-by: Roland Dreier <roland@purestorage.com>
---
 drivers/infiniband/hw/qib/qib_keys.c  |   84 +++++++-----
 drivers/infiniband/hw/qib/qib_mr.c    |  242 ++++++++++++++++++---------------
 drivers/infiniband/hw/qib/qib_qp.c    |   21 +--
 drivers/infiniband/hw/qib/qib_rc.c    |   24 ++--
 drivers/infiniband/hw/qib/qib_ruc.c   |   14 +-
 drivers/infiniband/hw/qib/qib_uc.c    |   33 +----
 drivers/infiniband/hw/qib/qib_ud.c    |   12 +-
 drivers/infiniband/hw/qib/qib_verbs.c |   10 +-
 drivers/infiniband/hw/qib/qib_verbs.h |   28 +++-
 9 files changed, 244 insertions(+), 224 deletions(-)

diff --git a/drivers/infiniband/hw/qib/qib_keys.c b/drivers/infiniband/hw/qib/qib_keys.c
index 8fd19a4..8b5ee3a 100644
--- a/drivers/infiniband/hw/qib/qib_keys.c
+++ b/drivers/infiniband/hw/qib/qib_keys.c
@@ -29,99 +29,119 @@
  * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  */
 
 #include "qib.h"
 
 /**
  * qib_alloc_lkey - allocate an lkey
- * @rkt: lkey table in which to allocate the lkey
  * @mr: memory region that this lkey protects
+ * @dma_region: 0->normal key, 1->restricted DMA key
+ *
+ * Returns 0 if successful, otherwise returns -errno.
+ *
+ * Increments mr reference count and sets published
+ * as required.
+ *
+ * Sets the lkey field mr for non-dma regions.
  *
- * Returns 1 if successful, otherwise returns 0.
  */
 
-int qib_alloc_lkey(struct qib_lkey_table *rkt, struct qib_mregion *mr)
+int qib_alloc_lkey(struct qib_mregion *mr, int dma_region)
 {
 	unsigned long flags;
 	u32 r;
 	u32 n;
-	int ret;
+	int ret = 0;
+	struct qib_ibdev *dev = to_idev(mr->pd->device);
+	struct qib_lkey_table *rkt = &dev->lk_table;
 
 	spin_lock_irqsave(&rkt->lock, flags);
 
+	/* special case for dma_mr lkey == 0 */
+	if (dma_region) {
+		/* should the dma_mr be relative to the pd? */
+		if (!dev->dma_mr) {
+			qib_get_mr(mr);
+			dev->dma_mr = mr;
+			mr->lkey_published = 1;
+		}
+		goto success;
+	}
+
 	/* Find the next available LKEY */
 	r = rkt->next;
 	n = r;
 	for (;;) {
 		if (rkt->table[r] == NULL)
 			break;
 		r = (r + 1) & (rkt->max - 1);
-		if (r == n) {
-			spin_unlock_irqrestore(&rkt->lock, flags);
-			ret = 0;
+		if (r == n)
 			goto bail;
-		}
 	}
 	rkt->next = (r + 1) & (rkt->max - 1);
 	/*
 	 * Make sure lkey is never zero which is reserved to indicate an
 	 * unrestricted LKEY.
 	 */
 	rkt->gen++;
 	mr->lkey = (r << (32 - ib_qib_lkey_table_size)) |
 		((((1 << (24 - ib_qib_lkey_table_size)) - 1) & rkt->gen)
 		 << 8);
 	if (mr->lkey == 0) {
 		mr->lkey |= 1 << 8;
 		rkt->gen++;
 	}
+	qib_get_mr(mr);
 	rkt->table[r] = mr;
+	mr->lkey_published = 1;
+success:
 	spin_unlock_irqrestore(&rkt->lock, flags);
-
-	ret = 1;
-
-bail:
+out:
 	return ret;
+bail:
+	spin_unlock_irqrestore(&rkt->lock, flags);
+	ret = -ENOMEM;
+	goto out;
 }
 
 /**
  * qib_free_lkey - free an lkey
- * @rkt: table from which to free the lkey
- * @lkey: lkey id to free
+ * @mr: mr to free from tables
  */
-int qib_free_lkey(struct qib_ibdev *dev, struct qib_mregion *mr)
+void qib_free_lkey(struct qib_mregion *mr)
 {
 	unsigned long flags;
 	u32 lkey = mr->lkey;
 	u32 r;
-	int ret;
+	struct qib_ibdev *dev = to_idev(mr->pd->device);
+	struct qib_lkey_table *rkt = &dev->lk_table;
+
+	spin_lock_irqsave(&rkt->lock, flags);
+	if (!mr->lkey_published)
+		goto out;
+	mr->lkey_published = 0;
+
 
 	spin_lock_irqsave(&dev->lk_table.lock, flags);
 	if (lkey == 0) {
 		if (dev->dma_mr && dev->dma_mr == mr) {
-			ret = atomic_read(&dev->dma_mr->refcount);
-			if (!ret)
-				dev->dma_mr = NULL;
-		} else
-			ret = 0;
+			qib_put_mr(dev->dma_mr);
+			dev->dma_mr = NULL;
+		}
 	} else {
 		r = lkey >> (32 - ib_qib_lkey_table_size);
-		ret = atomic_read(&dev->lk_table.table[r]->refcount);
-		if (!ret)
-			dev->lk_table.table[r] = NULL;
+		qib_put_mr(dev->dma_mr);
+		rkt->table[r] = NULL;
 	}
+out:
 	spin_unlock_irqrestore(&dev->lk_table.lock, flags);
-
-	if (ret)
-		ret = -EBUSY;
-	return ret;
 }
 
 /**
  * qib_lkey_ok - check IB SGE for validity and initialize
  * @rkt: table containing lkey to check SGE against
  * @isge: outgoing internal SGE
  * @sge: SGE to check
  * @acc: access flags
  *
@@ -144,19 +164,19 @@ int qib_lkey_ok(struct qib_lkey_table *rkt, struct qib_pd *pd,
 	 */
 	spin_lock_irqsave(&rkt->lock, flags);
 	if (sge->lkey == 0) {
 		struct qib_ibdev *dev = to_idev(pd->ibpd.device);
 
 		if (pd->user)
 			goto bail;
 		if (!dev->dma_mr)
 			goto bail;
-		atomic_inc(&dev->dma_mr->refcount);
+		qib_get_mr(dev->dma_mr);
 		spin_unlock_irqrestore(&rkt->lock, flags);
 
 		isge->mr = dev->dma_mr;
 		isge->vaddr = (void *) sge->addr;
 		isge->length = sge->length;
 		isge->sge_length = sge->length;
 		isge->m = 0;
 		isge->n = 0;
 		goto ok;
@@ -165,19 +185,19 @@ int qib_lkey_ok(struct qib_lkey_table *rkt, struct qib_pd *pd,
 	if (unlikely(mr == NULL || mr->lkey != sge->lkey ||
 		     mr->pd != &pd->ibpd))
 		goto bail;
 
 	off = sge->addr - mr->user_base;
 	if (unlikely(sge->addr < mr->user_base ||
 		     off + sge->length > mr->length ||
 		     (mr->access_flags & acc) != acc))
 		goto bail;
-	atomic_inc(&mr->refcount);
+	qib_get_mr(mr);
 	spin_unlock_irqrestore(&rkt->lock, flags);
 
 	off += mr->offset;
 	if (mr->page_shift) {
 		/*
 		page sizes are uniform power of 2 so no loop is necessary
 		entries_spanned_by_off is the number of times the loop below
 		would have executed.
 		*/
@@ -239,19 +259,19 @@ int qib_rkey_ok(struct qib_qp *qp, struct qib_sge *sge,
 	spin_lock_irqsave(&rkt->lock, flags);
 	if (rkey == 0) {
 		struct qib_pd *pd = to_ipd(qp->ibqp.pd);
 		struct qib_ibdev *dev = to_idev(pd->ibpd.device);
 
 		if (pd->user)
 			goto bail;
 		if (!dev->dma_mr)
 			goto bail;
-		atomic_inc(&dev->dma_mr->refcount);
+		qib_get_mr(dev->dma_mr);
 		spin_unlock_irqrestore(&rkt->lock, flags);
 
 		sge->mr = dev->dma_mr;
 		sge->vaddr = (void *) vaddr;
 		sge->length = len;
 		sge->sge_length = len;
 		sge->m = 0;
 		sge->n = 0;
 		goto ok;
@@ -259,19 +279,19 @@ int qib_rkey_ok(struct qib_qp *qp, struct qib_sge *sge,
 
 	mr = rkt->table[(rkey >> (32 - ib_qib_lkey_table_size))];
 	if (unlikely(mr == NULL || mr->lkey != rkey || qp->ibqp.pd != mr->pd))
 		goto bail;
 
 	off = vaddr - mr->iova;
 	if (unlikely(vaddr < mr->iova || off + len > mr->length ||
 		     (mr->access_flags & acc) == 0))
 		goto bail;
-	atomic_inc(&mr->refcount);
+	qib_get_mr(mr);
 	spin_unlock_irqrestore(&rkt->lock, flags);
 
 	off += mr->offset;
 	if (mr->page_shift) {
 		/*
 		page sizes are uniform power of 2 so no loop is necessary
 		entries_spanned_by_off is the number of times the loop below
 		would have executed.
 		*/
diff --git a/drivers/infiniband/hw/qib/qib_mr.c b/drivers/infiniband/hw/qib/qib_mr.c
index 08944e2..6a2028a 100644
--- a/drivers/infiniband/hw/qib/qib_mr.c
+++ b/drivers/infiniband/hw/qib/qib_mr.c
@@ -41,100 +41,139 @@ struct qib_fmr {
 	struct ib_fmr ibfmr;
 	struct qib_mregion mr;        /* must be last */
 };
 
 static inline struct qib_fmr *to_ifmr(struct ib_fmr *ibfmr)
 {
 	return container_of(ibfmr, struct qib_fmr, ibfmr);
 }
 
+static int init_qib_mregion(struct qib_mregion *mr, struct ib_pd *pd,
+	int count)
+{
+	int m, i = 0;
+	int rval = 0;
+
+	m = (count + QIB_SEGSZ - 1) / QIB_SEGSZ;
+	for (; i < m; i++) {
+		mr->map[i] = kzalloc(sizeof *mr->map[0], GFP_KERNEL);
+		if (!mr->map[i])
+			goto bail;
+	}
+	mr->mapsz = m;
+	init_completion(&mr->comp);
+	/* count returning the ptr to user */
+	atomic_set(&mr->refcount, 1);
+	mr->pd = pd;
+	mr->max_segs = count;
+out:
+	return rval;
+bail:
+	while (i)
+		kfree(mr->map[--i]);
+	rval = -ENOMEM;
+	goto out;
+}
+
+static void deinit_qib_mregion(struct qib_mregion *mr)
+{
+	int i = mr->mapsz;
+
+	mr->mapsz = 0;
+	while (i)
+		kfree(mr->map[--i]);
+}
+
+
 /**
  * qib_get_dma_mr - get a DMA memory region
  * @pd: protection domain for this memory region
  * @acc: access flags
  *
  * Returns the memory region on success, otherwise returns an errno.
  * Note that all DMA addresses should be created via the
  * struct ib_dma_mapping_ops functions (see qib_dma.c).
  */
 struct ib_mr *qib_get_dma_mr(struct ib_pd *pd, int acc)
 {
-	struct qib_ibdev *dev = to_idev(pd->device);
-	struct qib_mr *mr;
+	struct qib_mr *mr = NULL;
 	struct ib_mr *ret;
-	unsigned long flags;
+	int rval;
 
 	if (to_ipd(pd)->user) {
 		ret = ERR_PTR(-EPERM);
 		goto bail;
 	}
 
 	mr = kzalloc(sizeof *mr, GFP_KERNEL);
 	if (!mr) {
 		ret = ERR_PTR(-ENOMEM);
 		goto bail;
 	}
 
-	mr->mr.access_flags = acc;
-	atomic_set(&mr->mr.refcount, 0);
+	rval = init_qib_mregion(&mr->mr, pd, 0);
+	if (rval) {
+		ret = ERR_PTR(rval);
+		goto bail;
+	}
 
-	spin_lock_irqsave(&dev->lk_table.lock, flags);
-	if (!dev->dma_mr)
-		dev->dma_mr = &mr->mr;
-	spin_unlock_irqrestore(&dev->lk_table.lock, flags);
 
+	rval = qib_alloc_lkey(&mr->mr, 1);
+	if (rval) {
+		ret = ERR_PTR(rval);
+		goto bail_mregion;
+	}
+
+	mr->mr.access_flags = acc;
 	ret = &mr->ibmr;
+done:
+	return ret;
 
+bail_mregion:
+	deinit_qib_mregion(&mr->mr);
 bail:
-	return ret;
+	kfree(mr);
+	goto done;
 }
 
-static struct qib_mr *alloc_mr(int count, struct qib_lkey_table *lk_table)
+static struct qib_mr *alloc_mr(int count, struct ib_pd *pd)
 {
 	struct qib_mr *mr;
-	int m, i = 0;
+	int rval = -ENOMEM;
+	int m;
 
 	/* Allocate struct plus pointers to first level page tables. */
 	m = (count + QIB_SEGSZ - 1) / QIB_SEGSZ;
-	mr = kmalloc(sizeof *mr + m * sizeof mr->mr.map[0], GFP_KERNEL);
+	mr = kzalloc(sizeof *mr + m * sizeof mr->mr.map[0], GFP_KERNEL);
 	if (!mr)
-		goto done;
-
-	/* Allocate first level page tables. */
-	for (; i < m; i++) {
-		mr->mr.map[i] = kmalloc(sizeof *mr->mr.map[0], GFP_KERNEL);
-		if (!mr->mr.map[i])
-			goto bail;
-	}
-	mr->mr.mapsz = m;
-	mr->mr.page_shift = 0;
-	mr->mr.max_segs = count;
+		goto bail;
 
+	rval = init_qib_mregion(&mr->mr, pd, count);
+	if (rval)
+		goto bail;
 	/*
 	 * ib_reg_phys_mr() will initialize mr->ibmr except for
 	 * lkey and rkey.
 	 */
-	if (!qib_alloc_lkey(lk_table, &mr->mr))
-		goto bail;
+	rval = qib_alloc_lkey(&mr->mr, 0);
+	if (rval)
+		goto bail_mregion;
 	mr->ibmr.lkey = mr->mr.lkey;
 	mr->ibmr.rkey = mr->mr.lkey;
+done:
+	return mr;
 
-	atomic_set(&mr->mr.refcount, 0);
-	goto done;
-
+bail_mregion:
+	deinit_qib_mregion(&mr->mr);
 bail:
-	while (i)
-		kfree(mr->mr.map[--i]);
 	kfree(mr);
-	mr = NULL;
-
-done:
-	return mr;
+	mr = ERR_PTR(rval);
+	goto done;
 }
 
 /**
  * qib_reg_phys_mr - register a physical memory region
  * @pd: protection domain for this memory region
  * @buffer_list: pointer to the list of physical buffers to register
  * @num_phys_buf: the number of physical buffers to register
  * @iova_start: the starting address passed over IB which maps to this MR
  *
@@ -142,31 +181,27 @@ done:
  */
 struct ib_mr *qib_reg_phys_mr(struct ib_pd *pd,
 			      struct ib_phys_buf *buffer_list,
 			      int num_phys_buf, int acc, u64 *iova_start)
 {
 	struct qib_mr *mr;
 	int n, m, i;
 	struct ib_mr *ret;
 
-	mr = alloc_mr(num_phys_buf, &to_idev(pd->device)->lk_table);
-	if (mr == NULL) {
-		ret = ERR_PTR(-ENOMEM);
+	mr = alloc_mr(num_phys_buf, pd);
+	if (IS_ERR(mr)) {
+		ret = (struct ib_mr *)mr;
 		goto bail;
 	}
 
-	mr->mr.pd = pd;
 	mr->mr.user_base = *iova_start;
 	mr->mr.iova = *iova_start;
-	mr->mr.length = 0;
-	mr->mr.offset = 0;
 	mr->mr.access_flags = acc;
-	mr->umem = NULL;
 
 	m = 0;
 	n = 0;
 	for (i = 0; i < num_phys_buf; i++) {
 		mr->mr.map[m]->segs[n].vaddr = (void *) buffer_list[i].addr;
 		mr->mr.map[m]->segs[n].length = buffer_list[i].size;
 		mr->mr.length += buffer_list[i].size;
 		n++;
 		if (n == QIB_SEGSZ) {
@@ -180,19 +215,18 @@ struct ib_mr *qib_reg_phys_mr(struct ib_pd *pd,
 bail:
 	return ret;
 }
 
 /**
  * qib_reg_user_mr - register a userspace memory region
  * @pd: protection domain for this memory region
  * @start: starting userspace address
  * @length: length of region to register
- * @virt_addr: virtual address to use (from HCA's point of view)
  * @mr_access_flags: access flags for this memory region
  * @udata: unused by the QLogic_IB driver
  *
  * Returns the memory region on success, otherwise returns an errno.
  */
 struct ib_mr *qib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 			      u64 virt_addr, int mr_access_flags,
 			      struct ib_udata *udata)
 {
@@ -210,26 +244,25 @@ struct ib_mr *qib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	umem = ib_umem_get(pd->uobject->context, start, length,
 			   mr_access_flags, 0);
 	if (IS_ERR(umem))
 		return (void *) umem;
 
 	n = 0;
 	list_for_each_entry(chunk, &umem->chunk_list, list)
 		n += chunk->nents;
 
-	mr = alloc_mr(n, &to_idev(pd->device)->lk_table);
-	if (!mr) {
-		ret = ERR_PTR(-ENOMEM);
+	mr = alloc_mr(n, pd);
+	if (IS_ERR(mr)) {
+		ret = (struct ib_mr *)mr;
 		ib_umem_release(umem);
 		goto bail;
 	}
 
-	mr->mr.pd = pd;
 	mr->mr.user_base = start;
 	mr->mr.iova = virt_addr;
 	mr->mr.length = length;
 	mr->mr.offset = umem->offset;
 	mr->mr.access_flags = mr_access_flags;
 	mr->umem = umem;
 
 	if (is_power_of_2(umem->page_size))
 		mr->mr.page_shift = ilog2(umem->page_size);
@@ -265,74 +298,70 @@ bail:
  *
  * Returns 0 on success.
  *
  * Note that this is called to free MRs created by qib_get_dma_mr()
  * or qib_reg_user_mr().
  */
 int qib_dereg_mr(struct ib_mr *ibmr)
 {
 	struct qib_mr *mr = to_imr(ibmr);
-	struct qib_ibdev *dev = to_idev(ibmr->device);
-	int ret;
-	int i;
-
-	ret = qib_free_lkey(dev, &mr->mr);
-	if (ret)
-		return ret;
-
-	i = mr->mr.mapsz;
-	while (i)
-		kfree(mr->mr.map[--i]);
+	int ret = 0;
+	unsigned long timeout;
+
+	qib_free_lkey(&mr->mr);
+
+	qib_put_mr(&mr->mr); /* will set completion if last */
+	timeout = wait_for_completion_timeout(&mr->mr.comp,
+		5 * HZ);
+	if (!timeout) {
+		qib_get_mr(&mr->mr);
+		ret = -EBUSY;
+		goto out;
+	}
+	deinit_qib_mregion(&mr->mr);
 	if (mr->umem)
 		ib_umem_release(mr->umem);
 	kfree(mr);
-	return 0;
+out:
+	return ret;
 }
 
 /*
  * Allocate a memory region usable with the
  * IB_WR_FAST_REG_MR send work request.
  *
  * Return the memory region on success, otherwise return an errno.
  */
 struct ib_mr *qib_alloc_fast_reg_mr(struct ib_pd *pd, int max_page_list_len)
 {
 	struct qib_mr *mr;
 
-	mr = alloc_mr(max_page_list_len, &to_idev(pd->device)->lk_table);
-	if (mr == NULL)
-		return ERR_PTR(-ENOMEM);
-
-	mr->mr.pd = pd;
-	mr->mr.user_base = 0;
-	mr->mr.iova = 0;
-	mr->mr.length = 0;
-	mr->mr.offset = 0;
-	mr->mr.access_flags = 0;
-	mr->umem = NULL;
+	mr = alloc_mr(max_page_list_len, pd);
+	if (IS_ERR(mr))
+		return (struct ib_mr *)mr;
 
 	return &mr->ibmr;
 }
 
 struct ib_fast_reg_page_list *
 qib_alloc_fast_reg_page_list(struct ib_device *ibdev, int page_list_len)
 {
 	unsigned size = page_list_len * sizeof(u64);
 	struct ib_fast_reg_page_list *pl;
 
 	if (size > PAGE_SIZE)
 		return ERR_PTR(-EINVAL);
 
-	pl = kmalloc(sizeof *pl, GFP_KERNEL);
+	pl = kzalloc(sizeof *pl, GFP_KERNEL);
 	if (!pl)
 		return ERR_PTR(-ENOMEM);
 
-	pl->page_list = kmalloc(size, GFP_KERNEL);
+	pl->page_list = kzalloc(size, GFP_KERNEL);
 	if (!pl->page_list)
 		goto err_free;
 
 	return pl;
 
 err_free:
 	kfree(pl);
 	return ERR_PTR(-ENOMEM);
 }
@@ -349,69 +378,59 @@ void qib_free_fast_reg_page_list(struct ib_fast_reg_page_list *pl)
  * @mr_access_flags: access flags for this memory region
  * @fmr_attr: fast memory region attributes
  *
  * Returns the memory region on success, otherwise returns an errno.
  */
 struct ib_fmr *qib_alloc_fmr(struct ib_pd *pd, int mr_access_flags,
 			     struct ib_fmr_attr *fmr_attr)
 {
 	struct qib_fmr *fmr;
-	int m, i = 0;
+	int m;
 	struct ib_fmr *ret;
+	int rval = -ENOMEM;
 
 	/* Allocate struct plus pointers to first level page tables. */
 	m = (fmr_attr->max_pages + QIB_SEGSZ - 1) / QIB_SEGSZ;
-	fmr = kmalloc(sizeof *fmr + m * sizeof fmr->mr.map[0], GFP_KERNEL);
+	fmr = kzalloc(sizeof *fmr + m * sizeof fmr->mr.map[0], GFP_KERNEL);
 	if (!fmr)
 		goto bail;
 
-	/* Allocate first level page tables. */
-	for (; i < m; i++) {
-		fmr->mr.map[i] = kmalloc(sizeof *fmr->mr.map[0],
-					 GFP_KERNEL);
-		if (!fmr->mr.map[i])
-			goto bail;
-	}
-	fmr->mr.mapsz = m;
+	rval = init_qib_mregion(&fmr->mr, pd, fmr_attr->max_pages);
+	if (rval)
+		goto bail;
 
 	/*
 	 * ib_alloc_fmr() will initialize fmr->ibfmr except for lkey &
 	 * rkey.
 	 */
-	if (!qib_alloc_lkey(&to_idev(pd->device)->lk_table, &fmr->mr))
-		goto bail;
+	rval = qib_alloc_lkey(&fmr->mr, 0);
+	if (rval)
+		goto bail_mregion;
 	fmr->ibfmr.rkey = fmr->mr.lkey;
 	fmr->ibfmr.lkey = fmr->mr.lkey;
 	/*
 	 * Resources are allocated but no valid mapping (RKEY can't be
 	 * used).
 	 */
-	fmr->mr.pd = pd;
-	fmr->mr.user_base = 0;
-	fmr->mr.iova = 0;
-	fmr->mr.length = 0;
-	fmr->mr.offset = 0;
 	fmr->mr.access_flags = mr_access_flags;
 	fmr->mr.max_segs = fmr_attr->max_pages;
 	fmr->mr.page_shift = fmr_attr->page_shift;
 
-	atomic_set(&fmr->mr.refcount, 0);
 	ret = &fmr->ibfmr;
-	goto done;
+done:
+	return ret;
 
+bail_mregion:
+	deinit_qib_mregion(&fmr->mr);
 bail:
-	while (i)
-		kfree(fmr->mr.map[--i]);
 	kfree(fmr);
-	ret = ERR_PTR(-ENOMEM);
-
-done:
-	return ret;
+	ret = ERR_PTR(rval);
+	goto done;
 }
 
 /**
  * qib_map_phys_fmr - set up a fast memory region
  * @ibmfr: the fast memory region to set up
  * @page_list: the list of pages to associate with the fast memory region
  * @list_len: the number of pages to associate with the fast memory region
  * @iova: the virtual address of the start of the fast memory region
  *
@@ -422,19 +441,20 @@ int qib_map_phys_fmr(struct ib_fmr *ibfmr, u64 *page_list,
 		     int list_len, u64 iova)
 {
 	struct qib_fmr *fmr = to_ifmr(ibfmr);
 	struct qib_lkey_table *rkt;
 	unsigned long flags;
 	int m, n, i;
 	u32 ps;
 	int ret;
 
-	if (atomic_read(&fmr->mr.refcount))
+	i = atomic_read(&fmr->mr.refcount);
+	if (i > 2)
 		return -EBUSY;
 
 	if (list_len > fmr->mr.max_segs) {
 		ret = -EINVAL;
 		goto bail;
 	}
 	rkt = &to_idev(ibfmr->device)->lk_table;
 	spin_lock_irqsave(&rkt->lock, flags);
 	fmr->mr.user_base = iova;
@@ -484,22 +504,26 @@ int qib_unmap_fmr(struct list_head *fmr_list)
 /**
  * qib_dealloc_fmr - deallocate a fast memory region
  * @ibfmr: the fast memory region to deallocate
  *
  * Returns 0 on success.
  */
 int qib_dealloc_fmr(struct ib_fmr *ibfmr)
 {
 	struct qib_fmr *fmr = to_ifmr(ibfmr);
-	int ret;
-	int i;
-
-	ret = qib_free_lkey(to_idev(ibfmr->device), &fmr->mr);
-	if (ret)
-		return ret;
-
-	i = fmr->mr.mapsz;
-	while (i)
-		kfree(fmr->mr.map[--i]);
+	int ret = 0;
+	unsigned long timeout;
+
+	qib_free_lkey(&fmr->mr);
+	qib_put_mr(&fmr->mr); /* will set completion if last */
+	timeout = wait_for_completion_timeout(&fmr->mr.comp,
+		5 * HZ);
+	if (!timeout) {
+		qib_get_mr(&fmr->mr);
+		ret = -EBUSY;
+		goto out;
+	}
+	deinit_qib_mregion(&fmr->mr);
 	kfree(fmr);
-	return 0;
+out:
+	return ret;
 }
diff --git a/drivers/infiniband/hw/qib/qib_qp.c b/drivers/infiniband/hw/qib/qib_qp.c
index 1ce56b5..693041b 100644
--- a/drivers/infiniband/hw/qib/qib_qp.c
+++ b/drivers/infiniband/hw/qib/qib_qp.c
@@ -400,63 +400,54 @@ static void qib_reset_qp(struct qib_qp *qp, enum ib_qp_type type)
 	}
 	qp->r_sge.num_sge = 0;
 }
 
 static void clear_mr_refs(struct qib_qp *qp, int clr_sends)
 {
 	unsigned n;
 
 	if (test_and_clear_bit(QIB_R_REWIND_SGE, &qp->r_aflags))
-		while (qp->s_rdma_read_sge.num_sge) {
-			atomic_dec(&qp->s_rdma_read_sge.sge.mr->refcount);
-			if (--qp->s_rdma_read_sge.num_sge)
-				qp->s_rdma_read_sge.sge =
-					*qp->s_rdma_read_sge.sg_list++;
-		}
+		qib_put_ss(&qp->s_rdma_read_sge);
 
-	while (qp->r_sge.num_sge) {
-		atomic_dec(&qp->r_sge.sge.mr->refcount);
-		if (--qp->r_sge.num_sge)
-			qp->r_sge.sge = *qp->r_sge.sg_list++;
-	}
+	qib_put_ss(&qp->r_sge);
 
 	if (clr_sends) {
 		while (qp->s_last != qp->s_head) {
 			struct qib_swqe *wqe = get_swqe_ptr(qp, qp->s_last);
 			unsigned i;
 
 			for (i = 0; i < wqe->wr.num_sge; i++) {
 				struct qib_sge *sge = &wqe->sg_list[i];
 
-				atomic_dec(&sge->mr->refcount);
+				qib_put_mr(sge->mr);
 			}
 			if (qp->ibqp.qp_type == IB_QPT_UD ||
 			    qp->ibqp.qp_type == IB_QPT_SMI ||
 			    qp->ibqp.qp_type == IB_QPT_GSI)
 				atomic_dec(&to_iah(wqe->wr.wr.ud.ah)->refcount);
 			if (++qp->s_last >= qp->s_size)
 				qp->s_last = 0;
 		}
 		if (qp->s_rdma_mr) {
-			atomic_dec(&qp->s_rdma_mr->refcount);
+			qib_put_mr(qp->s_rdma_mr);
 			qp->s_rdma_mr = NULL;
 		}
 	}
 
 	if (qp->ibqp.qp_type != IB_QPT_RC)
 		return;
 
 	for (n = 0; n < ARRAY_SIZE(qp->s_ack_queue); n++) {
 		struct qib_ack_entry *e = &qp->s_ack_queue[n];
 
 		if (e->opcode == IB_OPCODE_RC_RDMA_READ_REQUEST &&
 		    e->rdma_sge.mr) {
-			atomic_dec(&e->rdma_sge.mr->refcount);
+			qib_put_mr(e->rdma_sge.mr);
 			e->rdma_sge.mr = NULL;
 		}
 	}
 }
 
 /**
  * qib_error_qp - put a QP into the error state
  * @qp: the QP to put into the error state
  * @err: the receive completion error to signal if a RWQE is active
@@ -489,19 +480,19 @@ int qib_error_qp(struct qib_qp *qp, enum ib_wc_status err)
 	if (!list_empty(&qp->iowait) && !(qp->s_flags & QIB_S_BUSY)) {
 		qp->s_flags &= ~QIB_S_ANY_WAIT_IO;
 		list_del_init(&qp->iowait);
 	}
 	spin_unlock(&dev->pending_lock);
 
 	if (!(qp->s_flags & QIB_S_BUSY)) {
 		qp->s_hdrwords = 0;
 		if (qp->s_rdma_mr) {
-			atomic_dec(&qp->s_rdma_mr->refcount);
+			qib_put_mr(qp->s_rdma_mr);
 			qp->s_rdma_mr = NULL;
 		}
 		if (qp->s_tx) {
 			qib_put_txreq(qp->s_tx);
 			qp->s_tx = NULL;
 		}
 	}
 
 	/* Schedule the sending tasklet to drain the send work queue. */
diff --git a/drivers/infiniband/hw/qib/qib_rc.c b/drivers/infiniband/hw/qib/qib_rc.c
index b641416..3ab3413 100644
--- a/drivers/infiniband/hw/qib/qib_rc.c
+++ b/drivers/infiniband/hw/qib/qib_rc.c
@@ -89,19 +89,19 @@ static int qib_make_rc_ack(struct qib_ibdev *dev, struct qib_qp *qp,
 
 	/* header size in 32-bit words LRH+BTH = (8+12)/4. */
 	hwords = 5;
 
 	switch (qp->s_ack_state) {
 	case OP(RDMA_READ_RESPONSE_LAST):
 	case OP(RDMA_READ_RESPONSE_ONLY):
 		e = &qp->s_ack_queue[qp->s_tail_ack_queue];
 		if (e->rdma_sge.mr) {
-			atomic_dec(&e->rdma_sge.mr->refcount);
+			qib_put_mr(e->rdma_sge.mr);
 			e->rdma_sge.mr = NULL;
 		}
 		/* FALLTHROUGH */
 	case OP(ATOMIC_ACKNOWLEDGE):
 		/*
 		 * We can increment the tail pointer now that the last
 		 * response has been sent instead of only being
 		 * constructed.
 		 */
@@ -127,19 +127,19 @@ static int qib_make_rc_ack(struct qib_ibdev *dev, struct qib_qp *qp,
 			 */
 			len = e->rdma_sge.sge_length;
 			if (len && !e->rdma_sge.mr) {
 				qp->s_tail_ack_queue = qp->r_head_ack_queue;
 				goto bail;
 			}
 			/* Copy SGE state in case we need to resend */
 			qp->s_rdma_mr = e->rdma_sge.mr;
 			if (qp->s_rdma_mr)
-				atomic_inc(&qp->s_rdma_mr->refcount);
+				qib_get_mr(qp->s_rdma_mr);
 			qp->s_ack_rdma_sge.sge = e->rdma_sge;
 			qp->s_ack_rdma_sge.num_sge = 1;
 			qp->s_cur_sge = &qp->s_ack_rdma_sge;
 			if (len > pmtu) {
 				len = pmtu;
 				qp->s_ack_state = OP(RDMA_READ_RESPONSE_FIRST);
 			} else {
 				qp->s_ack_state = OP(RDMA_READ_RESPONSE_ONLY);
 				e->sent = 1;
@@ -166,19 +166,19 @@ static int qib_make_rc_ack(struct qib_ibdev *dev, struct qib_qp *qp,
 		break;
 
 	case OP(RDMA_READ_RESPONSE_FIRST):
 		qp->s_ack_state = OP(RDMA_READ_RESPONSE_MIDDLE);
 		/* FALLTHROUGH */
 	case OP(RDMA_READ_RESPONSE_MIDDLE):
 		qp->s_cur_sge = &qp->s_ack_rdma_sge;
 		qp->s_rdma_mr = qp->s_ack_rdma_sge.sge.mr;
 		if (qp->s_rdma_mr)
-			atomic_inc(&qp->s_rdma_mr->refcount);
+			qib_get_mr(qp->s_rdma_mr);
 		len = qp->s_ack_rdma_sge.sge.sge_length;
 		if (len > pmtu)
 			len = pmtu;
 		else {
 			ohdr->u.aeth = qib_compute_aeth(qp);
 			hwords++;
 			qp->s_ack_state = OP(RDMA_READ_RESPONSE_LAST);
 			e = &qp->s_ack_queue[qp->s_tail_ack_queue];
 			e->sent = 1;
@@ -1006,19 +1006,19 @@ void qib_rc_send_complete(struct qib_qp *qp, struct qib_ib_header *hdr)
 
 	while (qp->s_last != qp->s_acked) {
 		wqe = get_swqe_ptr(qp, qp->s_last);
 		if (qib_cmp24(wqe->lpsn, qp->s_sending_psn) >= 0 &&
 		    qib_cmp24(qp->s_sending_psn, qp->s_sending_hpsn) <= 0)
 			break;
 		for (i = 0; i < wqe->wr.num_sge; i++) {
 			struct qib_sge *sge = &wqe->sg_list[i];
 
-			atomic_dec(&sge->mr->refcount);
+			qib_put_mr(sge->mr);
 		}
 		/* Post a send completion queue entry if requested. */
 		if (!(qp->s_flags & QIB_S_SIGNAL_REQ_WR) ||
 		    (wqe->wr.send_flags & IB_SEND_SIGNALED)) {
 			memset(&wc, 0, sizeof wc);
 			wc.wr_id = wqe->wr.wr_id;
 			wc.status = IB_WC_SUCCESS;
 			wc.opcode = ib_qib_wc_opcode[wqe->wr.opcode];
 			wc.byte_len = wqe->length;
@@ -1062,19 +1062,19 @@ static struct qib_swqe *do_rc_completion(struct qib_qp *qp,
 	 * Don't decrement refcount and don't generate a
 	 * completion if the SWQE is being resent until the send
 	 * is finished.
 	 */
 	if (qib_cmp24(wqe->lpsn, qp->s_sending_psn) < 0 ||
 	    qib_cmp24(qp->s_sending_psn, qp->s_sending_hpsn) > 0) {
 		for (i = 0; i < wqe->wr.num_sge; i++) {
 			struct qib_sge *sge = &wqe->sg_list[i];
 
-			atomic_dec(&sge->mr->refcount);
+			qib_put_mr(sge->mr);
 		}
 		/* Post a send completion queue entry if requested. */
 		if (!(qp->s_flags & QIB_S_SIGNAL_REQ_WR) ||
 		    (wqe->wr.send_flags & IB_SEND_SIGNALED)) {
 			memset(&wc, 0, sizeof wc);
 			wc.wr_id = wqe->wr.wr_id;
 			wc.status = IB_WC_SUCCESS;
 			wc.opcode = ib_qib_wc_opcode[wqe->wr.opcode];
 			wc.byte_len = wqe->length;
@@ -1724,19 +1724,19 @@ static int qib_rc_rcv_error(struct qib_other_headers *ohdr,
 		 * should not back up and request an earlier PSN for the
 		 * same request.
 		 */
 		offset = ((psn - e->psn) & QIB_PSN_MASK) *
 			qp->pmtu;
 		len = be32_to_cpu(reth->length);
 		if (unlikely(offset + len != e->rdma_sge.sge_length))
 			goto unlock_done;
 		if (e->rdma_sge.mr) {
-			atomic_dec(&e->rdma_sge.mr->refcount);
+			qib_put_mr(e->rdma_sge.mr);
 			e->rdma_sge.mr = NULL;
 		}
 		if (len != 0) {
 			u32 rkey = be32_to_cpu(reth->rkey);
 			u64 vaddr = be64_to_cpu(reth->vaddr);
 			int ok;
 
 			ok = qib_rkey_ok(qp, &e->rdma_sge, len, vaddr, rkey,
 					 IB_ACCESS_REMOTE_READ);
@@ -2018,23 +2018,19 @@ send_last:
 		/* XXX LAST len should be >= 1 */
 		if (unlikely(tlen < (hdrsize + pad + 4)))
 			goto nack_inv;
 		/* Don't count the CRC. */
 		tlen -= (hdrsize + pad + 4);
 		wc.byte_len = tlen + qp->r_rcv_len;
 		if (unlikely(wc.byte_len > qp->r_len))
 			goto nack_inv;
 		qib_copy_sge(&qp->r_sge, data, tlen, 1);
-		while (qp->r_sge.num_sge) {
-			atomic_dec(&qp->r_sge.sge.mr->refcount);
-			if (--qp->r_sge.num_sge)
-				qp->r_sge.sge = *qp->r_sge.sg_list++;
-		}
+		qib_put_ss(&qp->r_sge);
 		qp->r_msn++;
 		if (!test_and_clear_bit(QIB_R_WRID_VALID, &qp->r_aflags))
 			break;
 		wc.wr_id = qp->r_wr_id;
 		wc.status = IB_WC_SUCCESS;
 		if (opcode == OP(RDMA_WRITE_LAST_WITH_IMMEDIATE) ||
 		    opcode == OP(RDMA_WRITE_ONLY_WITH_IMMEDIATE))
 			wc.opcode = IB_WC_RECV_RDMA_WITH_IMM;
 		else
@@ -2110,19 +2106,19 @@ send_last:
 			next = 0;
 		spin_lock_irqsave(&qp->s_lock, flags);
 		if (unlikely(next == qp->s_tail_ack_queue)) {
 			if (!qp->s_ack_queue[next].sent)
 				goto nack_inv_unlck;
 			qib_update_ack_queue(qp, next);
 		}
 		e = &qp->s_ack_queue[qp->r_head_ack_queue];
 		if (e->opcode == OP(RDMA_READ_REQUEST) && e->rdma_sge.mr) {
-			atomic_dec(&e->rdma_sge.mr->refcount);
+			qib_put_mr(e->rdma_sge.mr);
 			e->rdma_sge.mr = NULL;
 		}
 		reth = &ohdr->u.rc.reth;
 		len = be32_to_cpu(reth->length);
 		if (len) {
 			u32 rkey = be32_to_cpu(reth->rkey);
 			u64 vaddr = be64_to_cpu(reth->vaddr);
 			int ok;
 
@@ -2182,19 +2178,19 @@ send_last:
 			next = 0;
 		spin_lock_irqsave(&qp->s_lock, flags);
 		if (unlikely(next == qp->s_tail_ack_queue)) {
 			if (!qp->s_ack_queue[next].sent)
 				goto nack_inv_unlck;
 			qib_update_ack_queue(qp, next);
 		}
 		e = &qp->s_ack_queue[qp->r_head_ack_queue];
 		if (e->opcode == OP(RDMA_READ_REQUEST) && e->rdma_sge.mr) {
-			atomic_dec(&e->rdma_sge.mr->refcount);
+			qib_put_mr(e->rdma_sge.mr);
 			e->rdma_sge.mr = NULL;
 		}
 		ateth = &ohdr->u.atomic_eth;
 		vaddr = ((u64) be32_to_cpu(ateth->vaddr[0]) << 32) |
 			be32_to_cpu(ateth->vaddr[1]);
 		if (unlikely(vaddr & (sizeof(u64) - 1)))
 			goto nack_inv_unlck;
 		rkey = be32_to_cpu(ateth->rkey);
 		/* Check rkey & NAK */
@@ -2204,19 +2200,19 @@ send_last:
 			goto nack_acc_unlck;
 		/* Perform atomic OP and save result. */
 		maddr = (atomic64_t *) qp->r_sge.sge.vaddr;
 		sdata = be64_to_cpu(ateth->swap_data);
 		e->atomic_data = (opcode == OP(FETCH_ADD)) ?
 			(u64) atomic64_add_return(sdata, maddr) - sdata :
 			(u64) cmpxchg((u64 *) qp->r_sge.sge.vaddr,
 				      be64_to_cpu(ateth->compare_data),
 				      sdata);
-		atomic_dec(&qp->r_sge.sge.mr->refcount);
+		qib_put_mr(qp->r_sge.sge.mr);
 		qp->r_sge.num_sge = 0;
 		e->opcode = opcode;
 		e->sent = 0;
 		e->psn = psn;
 		e->lpsn = psn;
 		qp->r_msn++;
 		qp->r_psn++;
 		qp->r_state = opcode;
 		qp->r_nak_state = 0;
diff --git a/drivers/infiniband/hw/qib/qib_ruc.c b/drivers/infiniband/hw/qib/qib_ruc.c
index c0ee7e0..357b6cf 100644
--- a/drivers/infiniband/hw/qib/qib_ruc.c
+++ b/drivers/infiniband/hw/qib/qib_ruc.c
@@ -104,19 +104,19 @@ static int qib_init_sge(struct qib_qp *qp, struct qib_rwqe *wqe)
 	ss->num_sge = j;
 	ss->total_len = qp->r_len;
 	ret = 1;
 	goto bail;
 
 bad_lkey:
 	while (j) {
 		struct qib_sge *sge = --j ? &ss->sg_list[j - 1] : &ss->sge;
 
-		atomic_dec(&sge->mr->refcount);
+		qib_put_mr(sge->mr);
 	}
 	ss->num_sge = 0;
 	memset(&wc, 0, sizeof(wc));
 	wc.wr_id = wqe->wr_id;
 	wc.status = IB_WC_LOC_PROT_ERR;
 	wc.opcode = IB_WC_RECV;
 	wc.qp = &qp->ibqp;
 	/* Signal solicited completion event. */
 	qib_cq_enter(to_icq(qp->ibqp.recv_cq), &wc, 1);
@@ -495,19 +495,19 @@ again:
 			goto acc_err;
 		/* Perform atomic OP and save result. */
 		maddr = (atomic64_t *) qp->r_sge.sge.vaddr;
 		sdata = wqe->wr.wr.atomic.compare_add;
 		*(u64 *) sqp->s_sge.sge.vaddr =
 			(wqe->wr.opcode == IB_WR_ATOMIC_FETCH_AND_ADD) ?
 			(u64) atomic64_add_return(sdata, maddr) - sdata :
 			(u64) cmpxchg((u64 *) qp->r_sge.sge.vaddr,
 				      sdata, wqe->wr.wr.atomic.swap);
-		atomic_dec(&qp->r_sge.sge.mr->refcount);
+		qib_put_mr(qp->r_sge.sge.mr);
 		qp->r_sge.num_sge = 0;
 		goto send_comp;
 
 	default:
 		send_status = IB_WC_LOC_QP_OP_ERR;
 		goto serr;
 	}
 
 	sge = &sqp->s_sge.sge;
@@ -519,40 +519,36 @@ again:
 		if (len > sge->sge_length)
 			len = sge->sge_length;
 		BUG_ON(len == 0);
 		qib_copy_sge(&qp->r_sge, sge->vaddr, len, release);
 		sge->vaddr += len;
 		sge->length -= len;
 		sge->sge_length -= len;
 		if (sge->sge_length == 0) {
 			if (!release)
-				atomic_dec(&sge->mr->refcount);
+				qib_put_mr(sge->mr);
 			if (--sqp->s_sge.num_sge)
 				*sge = *sqp->s_sge.sg_list++;
 		} else if (sge->length == 0 && sge->mr->lkey) {
 			if (++sge->n >= QIB_SEGSZ) {
 				if (++sge->m >= sge->mr->mapsz)
 					break;
 				sge->n = 0;
 			}
 			sge->vaddr =
 				sge->mr->map[sge->m]->segs[sge->n].vaddr;
 			sge->length =
 				sge->mr->map[sge->m]->segs[sge->n].length;
 		}
 		sqp->s_len -= len;
 	}
 	if (release)
-		while (qp->r_sge.num_sge) {
-			atomic_dec(&qp->r_sge.sge.mr->refcount);
-			if (--qp->r_sge.num_sge)
-				qp->r_sge.sge = *qp->r_sge.sg_list++;
-		}
+		qib_put_ss(&qp->r_sge);
 
 	if (!test_and_clear_bit(QIB_R_WRID_VALID, &qp->r_aflags))
 		goto send_comp;
 
 	if (wqe->wr.opcode == IB_WR_RDMA_WRITE_WITH_IMM)
 		wc.opcode = IB_WC_RECV_RDMA_WITH_IMM;
 	else
 		wc.opcode = IB_WC_RECV;
 	wc.wr_id = qp->r_wr_id;
@@ -776,19 +772,19 @@ void qib_send_complete(struct qib_qp *qp, struct qib_swqe *wqe,
 	u32 old_last, last;
 	unsigned i;
 
 	if (!(ib_qib_state_ops[qp->state] & QIB_PROCESS_OR_FLUSH_SEND))
 		return;
 
 	for (i = 0; i < wqe->wr.num_sge; i++) {
 		struct qib_sge *sge = &wqe->sg_list[i];
 
-		atomic_dec(&sge->mr->refcount);
+		qib_put_mr(sge->mr);
 	}
 	if (qp->ibqp.qp_type == IB_QPT_UD ||
 	    qp->ibqp.qp_type == IB_QPT_SMI ||
 	    qp->ibqp.qp_type == IB_QPT_GSI)
 		atomic_dec(&to_iah(wqe->wr.wr.ud.ah)->refcount);
 
 	/* See ch. 11.2.4.1 and 10.7.3.1 */
 	if (!(qp->s_flags & QIB_S_SIGNAL_REQ_WR) ||
 	    (wqe->wr.send_flags & IB_SEND_SIGNALED) ||
diff --git a/drivers/infiniband/hw/qib/qib_uc.c b/drivers/infiniband/hw/qib/qib_uc.c
index 70b4cb7..aa3a803 100644
--- a/drivers/infiniband/hw/qib/qib_uc.c
+++ b/drivers/infiniband/hw/qib/qib_uc.c
@@ -275,23 +275,19 @@ void qib_uc_rcv(struct qib_ibport *ibp, struct qib_ib_header *hdr,
 		 * Silently drop any current message.
 		 */
 		qp->r_psn = psn;
 inv:
 		if (qp->r_state == OP(SEND_FIRST) ||
 		    qp->r_state == OP(SEND_MIDDLE)) {
 			set_bit(QIB_R_REWIND_SGE, &qp->r_aflags);
 			qp->r_sge.num_sge = 0;
 		} else
-			while (qp->r_sge.num_sge) {
-				atomic_dec(&qp->r_sge.sge.mr->refcount);
-				if (--qp->r_sge.num_sge)
-					qp->r_sge.sge = *qp->r_sge.sg_list++;
-			}
+			qib_put_ss(&qp->r_sge);
 		qp->r_state = OP(SEND_LAST);
 		switch (opcode) {
 		case OP(SEND_FIRST):
 		case OP(SEND_ONLY):
 		case OP(SEND_ONLY_WITH_IMMEDIATE):
 			goto send_first;
 
 		case OP(RDMA_WRITE_FIRST):
 		case OP(RDMA_WRITE_ONLY):
@@ -398,24 +394,19 @@ send_last:
 		if (unlikely(tlen < (hdrsize + pad + 4)))
 			goto rewind;
 		/* Don't count the CRC. */
 		tlen -= (hdrsize + pad + 4);
 		wc.byte_len = tlen + qp->r_rcv_len;
 		if (unlikely(wc.byte_len > qp->r_len))
 			goto rewind;
 		wc.opcode = IB_WC_RECV;
 		qib_copy_sge(&qp->r_sge, data, tlen, 0);
-		while (qp->s_rdma_read_sge.num_sge) {
-			atomic_dec(&qp->s_rdma_read_sge.sge.mr->refcount);
-			if (--qp->s_rdma_read_sge.num_sge)
-				qp->s_rdma_read_sge.sge =
-					*qp->s_rdma_read_sge.sg_list++;
-		}
+		qib_put_ss(&qp->s_rdma_read_sge);
 last_imm:
 		wc.wr_id = qp->r_wr_id;
 		wc.status = IB_WC_SUCCESS;
 		wc.qp = &qp->ibqp;
 		wc.src_qp = qp->remote_qpn;
 		wc.slid = qp->remote_ah_attr.dlid;
 		wc.sl = qp->remote_ah_attr.sl;
 		/* zero fields that are N/A */
 		wc.vendor_err = 0;
@@ -487,60 +478,46 @@ rdma_last_imm:
 		/* Check for invalid length. */
 		/* XXX LAST len should be >= 1 */
 		if (unlikely(tlen < (hdrsize + pad + 4)))
 			goto drop;
 		/* Don't count the CRC. */
 		tlen -= (hdrsize + pad + 4);
 		if (unlikely(tlen + qp->r_rcv_len != qp->r_len))
 			goto drop;
 		if (test_and_clear_bit(QIB_R_REWIND_SGE, &qp->r_aflags))
-			while (qp->s_rdma_read_sge.num_sge) {
-				atomic_dec(&qp->s_rdma_read_sge.sge.mr->
-					   refcount);
-				if (--qp->s_rdma_read_sge.num_sge)
-					qp->s_rdma_read_sge.sge =
-						*qp->s_rdma_read_sge.sg_list++;
-			}
+			qib_put_ss(&qp->s_rdma_read_sge);
 		else {
 			ret = qib_get_rwqe(qp, 1);
 			if (ret < 0)
 				goto op_err;
 			if (!ret)
 				goto drop;
 		}
 		wc.byte_len = qp->r_len;
 		wc.opcode = IB_WC_RECV_RDMA_WITH_IMM;
 		qib_copy_sge(&qp->r_sge, data, tlen, 1);
-		while (qp->r_sge.num_sge) {
-			atomic_dec(&qp->r_sge.sge.mr->refcount);
-			if (--qp->r_sge.num_sge)
-				qp->r_sge.sge = *qp->r_sge.sg_list++;
-		}
+		qib_put_ss(&qp->r_sge);
 		goto last_imm;
 
 	case OP(RDMA_WRITE_LAST):
 rdma_last:
 		/* Get the number of bytes the message was padded by. */
 		pad = (be32_to_cpu(ohdr->bth[0]) >> 20) & 3;
 		/* Check for invalid length. */
 		/* XXX LAST len should be >= 1 */
 		if (unlikely(tlen < (hdrsize + pad + 4)))
 			goto drop;
 		/* Don't count the CRC. */
 		tlen -= (hdrsize + pad + 4);
 		if (unlikely(tlen + qp->r_rcv_len != qp->r_len))
 			goto drop;
 		qib_copy_sge(&qp->r_sge, data, tlen, 1);
-		while (qp->r_sge.num_sge) {
-			atomic_dec(&qp->r_sge.sge.mr->refcount);
-			if (--qp->r_sge.num_sge)
-				qp->r_sge.sge = *qp->r_sge.sg_list++;
-		}
+		qib_put_ss(&qp->r_sge);
 		break;
 
 	default:
 		/* Drop packet for unknown opcodes. */
 		goto drop;
 	}
 	qp->r_psn++;
 	qp->r_state = opcode;
 	return;
diff --git a/drivers/infiniband/hw/qib/qib_ud.c b/drivers/infiniband/hw/qib/qib_ud.c
index a468bf2..d6c7fe7 100644
--- a/drivers/infiniband/hw/qib/qib_ud.c
+++ b/drivers/infiniband/hw/qib/qib_ud.c
@@ -188,23 +188,19 @@ static void qib_ud_loopback(struct qib_qp *sqp, struct qib_swqe *swqe)
 				sge->n = 0;
 			}
 			sge->vaddr =
 				sge->mr->map[sge->m]->segs[sge->n].vaddr;
 			sge->length =
 				sge->mr->map[sge->m]->segs[sge->n].length;
 		}
 		length -= len;
 	}
-	while (qp->r_sge.num_sge) {
-		atomic_dec(&qp->r_sge.sge.mr->refcount);
-		if (--qp->r_sge.num_sge)
-			qp->r_sge.sge = *qp->r_sge.sg_list++;
-	}
+	qib_put_ss(&qp->r_sge);
 	if (!test_and_clear_bit(QIB_R_WRID_VALID, &qp->r_aflags))
 		goto bail_unlock;
 	wc.wr_id = qp->r_wr_id;
 	wc.status = IB_WC_SUCCESS;
 	wc.opcode = IB_WC_RECV;
 	wc.qp = &qp->ibqp;
 	wc.src_qp = sqp->ibqp.qp_num;
 	wc.pkey_index = qp->ibqp.qp_type == IB_QPT_GSI ?
 		swqe->wr.wr.ud.pkey_index : 0;
@@ -550,23 +546,19 @@ void qib_ud_rcv(struct qib_ibport *ibp, struct qib_ib_header *hdr,
 		goto drop;
 	}
 	if (has_grh) {
 		qib_copy_sge(&qp->r_sge, &hdr->u.l.grh,
 			     sizeof(struct ib_grh), 1);
 		wc.wc_flags |= IB_WC_GRH;
 	} else
 		qib_skip_sge(&qp->r_sge, sizeof(struct ib_grh), 1);
 	qib_copy_sge(&qp->r_sge, data, wc.byte_len - sizeof(struct ib_grh), 1);
-	while (qp->r_sge.num_sge) {
-		atomic_dec(&qp->r_sge.sge.mr->refcount);
-		if (--qp->r_sge.num_sge)
-			qp->r_sge.sge = *qp->r_sge.sg_list++;
-	}
+	qib_put_ss(&qp->r_sge);
 	if (!test_and_clear_bit(QIB_R_WRID_VALID, &qp->r_aflags))
 		return;
 	wc.wr_id = qp->r_wr_id;
 	wc.status = IB_WC_SUCCESS;
 	wc.opcode = IB_WC_RECV;
 	wc.vendor_err = 0;
 	wc.qp = &qp->ibqp;
 	wc.src_qp = src_qp;
 	wc.pkey_index = qp->ibqp.qp_type == IB_QPT_GSI ?
diff --git a/drivers/infiniband/hw/qib/qib_verbs.c b/drivers/infiniband/hw/qib/qib_verbs.c
index 7b6c3bf..76d7ce8 100644
--- a/drivers/infiniband/hw/qib/qib_verbs.c
+++ b/drivers/infiniband/hw/qib/qib_verbs.c
@@ -177,19 +177,19 @@ void qib_copy_sge(struct qib_sge_state *ss, void *data, u32 length, int release)
 		if (len > sge->sge_length)
 			len = sge->sge_length;
 		BUG_ON(len == 0);
 		memcpy(sge->vaddr, data, len);
 		sge->vaddr += len;
 		sge->length -= len;
 		sge->sge_length -= len;
 		if (sge->sge_length == 0) {
 			if (release)
-				atomic_dec(&sge->mr->refcount);
+				qib_put_mr(sge->mr);
 			if (--ss->num_sge)
 				*sge = *ss->sg_list++;
 		} else if (sge->length == 0 && sge->mr->lkey) {
 			if (++sge->n >= QIB_SEGSZ) {
 				if (++sge->m >= sge->mr->mapsz)
 					break;
 				sge->n = 0;
 			}
 			sge->vaddr =
@@ -218,19 +218,19 @@ void qib_skip_sge(struct qib_sge_state *ss, u32 length, int release)
 			len = length;
 		if (len > sge->sge_length)
 			len = sge->sge_length;
 		BUG_ON(len == 0);
 		sge->vaddr += len;
 		sge->length -= len;
 		sge->sge_length -= len;
 		if (sge->sge_length == 0) {
 			if (release)
-				atomic_dec(&sge->mr->refcount);
+				qib_put_mr(sge->mr);
 			if (--ss->num_sge)
 				*sge = *ss->sg_list++;
 		} else if (sge->length == 0 && sge->mr->lkey) {
 			if (++sge->n >= QIB_SEGSZ) {
 				if (++sge->m >= sge->mr->mapsz)
 					break;
 				sge->n = 0;
 			}
 			sge->vaddr =
@@ -429,19 +429,19 @@ static int qib_post_one_send(struct qib_qp *qp, struct ib_send_wr *wr)
 	qp->s_head = next;
 
 	ret = 0;
 	goto bail;
 
 bail_inval_free:
 	while (j) {
 		struct qib_sge *sge = &wqe->sg_list[--j];
 
-		atomic_dec(&sge->mr->refcount);
+		qib_put_mr(sge->mr);
 	}
 bail_inval:
 	ret = -EINVAL;
 bail:
 	spin_unlock_irqrestore(&qp->s_lock, flags);
 	return ret;
 }
 
 /**
@@ -972,19 +972,19 @@ void qib_put_txreq(struct qib_verbs_txreq *tx)
 	struct qib_qp *qp;
 	unsigned long flags;
 
 	qp = tx->qp;
 	dev = to_idev(qp->ibqp.device);
 
 	if (atomic_dec_and_test(&qp->refcount))
 		wake_up(&qp->wait);
 	if (tx->mr) {
-		atomic_dec(&tx->mr->refcount);
+		qib_put_mr(tx->mr);
 		tx->mr = NULL;
 	}
 	if (tx->txreq.flags & QIB_SDMA_TXREQ_F_FREEBUF) {
 		tx->txreq.flags &= ~QIB_SDMA_TXREQ_F_FREEBUF;
 		dma_unmap_single(&dd_from_dev(dev)->pcidev->dev,
 				 tx->txreq.addr, tx->hdr_dwords << 2,
 				 DMA_TO_DEVICE);
 		kfree(tx->align_buf);
 	}
@@ -1330,19 +1330,19 @@ static int qib_verbs_send_pio(struct qib_qp *qp, struct qib_ib_header *ibhdr,
 	copy_io(piobuf, ss, len, flush_wc);
 done:
 	if (dd->flags & QIB_USE_SPCL_TRIG) {
 		u32 spcl_off = (pbufn >= dd->piobcnt2k) ? 2047 : 1023;
 		qib_flush_wc();
 		__raw_writel(0xaebecede, piobuf_orig + spcl_off);
 	}
 	qib_sendbuf_done(dd, pbufn);
 	if (qp->s_rdma_mr) {
-		atomic_dec(&qp->s_rdma_mr->refcount);
+		qib_put_mr(qp->s_rdma_mr);
 		qp->s_rdma_mr = NULL;
 	}
 	if (qp->s_wqe) {
 		spin_lock_irqsave(&qp->s_lock, flags);
 		qib_send_complete(qp, qp->s_wqe, IB_WC_SUCCESS);
 		spin_unlock_irqrestore(&qp->s_lock, flags);
 	} else if (qp->ibqp.qp_type == IB_QPT_RC) {
 		spin_lock_irqsave(&qp->s_lock, flags);
 		qib_rc_send_complete(qp, ibhdr);
diff --git a/drivers/infiniband/hw/qib/qib_verbs.h b/drivers/infiniband/hw/qib/qib_verbs.h
index 4876060..4a2277b 100644
--- a/drivers/infiniband/hw/qib/qib_verbs.h
+++ b/drivers/infiniband/hw/qib/qib_verbs.h
@@ -35,18 +35,19 @@
 #ifndef QIB_VERBS_H
 #define QIB_VERBS_H
 
 #include <linux/types.h>
 #include <linux/spinlock.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
 #include <linux/kref.h>
 #include <linux/workqueue.h>
+#include <linux/completion.h>
 #include <rdma/ib_pack.h>
 #include <rdma/ib_user_verbs.h>
 
 struct qib_ctxtdata;
 struct qib_pportdata;
 struct qib_devdata;
 struct qib_verbs_txreq;
 
 #define QIB_MAX_RDMA_ATOMIC     16
@@ -296,18 +297,20 @@ struct qib_mregion {
 	u64 user_base;          /* User's address for this region */
 	u64 iova;               /* IB start address of this region */
 	size_t length;
 	u32 lkey;
 	u32 offset;             /* offset (bytes) to start of region */
 	int access_flags;
 	u32 max_segs;           /* number of qib_segs in all the arrays */
 	u32 mapsz;              /* size of the map array */
 	u8  page_shift;         /* 0 - non unform/non powerof2 sizes */
+	u8  lkey_published;	/* in global table */
+	struct completion comp; /* complete when refcount goes to zero */
 	atomic_t refcount;
 	struct qib_segarray *map[0];    /* the segments */
 };
 
 /*
  * These keep track of the copy progress within a memory region.
  * Used by the verbs layer.
  */
 struct qib_sge {
@@ -938,21 +941,21 @@ void qib_rc_rnr_retry(unsigned long arg);
 void qib_rc_send_complete(struct qib_qp *qp, struct qib_ib_header *hdr);
 
 void qib_rc_error(struct qib_qp *qp, enum ib_wc_status err);
 
 int qib_post_ud_send(struct qib_qp *qp, struct ib_send_wr *wr);
 
 void qib_ud_rcv(struct qib_ibport *ibp, struct qib_ib_header *hdr,
 		int has_grh, void *data, u32 tlen, struct qib_qp *qp);
 
-int qib_alloc_lkey(struct qib_lkey_table *rkt, struct qib_mregion *mr);
+int qib_alloc_lkey(struct qib_mregion *mr, int dma_region);
 
-int qib_free_lkey(struct qib_ibdev *dev, struct qib_mregion *mr);
+void qib_free_lkey(struct qib_mregion *mr);
 
 int qib_lkey_ok(struct qib_lkey_table *rkt, struct qib_pd *pd,
 		struct qib_sge *isge, struct ib_sge *sge, int acc);
 
 int qib_rkey_ok(struct qib_qp *qp, struct qib_sge *sge,
 		u32 len, u64 vaddr, u32 rkey, int acc);
 
 int qib_post_srq_receive(struct ib_srq *ibsrq, struct ib_recv_wr *wr,
 			 struct ib_recv_wr **bad_wr);
@@ -1008,18 +1011,39 @@ struct ib_fmr *qib_alloc_fmr(struct ib_pd *pd, int mr_access_flags,
 			     struct ib_fmr_attr *fmr_attr);
 
 int qib_map_phys_fmr(struct ib_fmr *ibfmr, u64 *page_list,
 		     int list_len, u64 iova);
 
 int qib_unmap_fmr(struct list_head *fmr_list);
 
 int qib_dealloc_fmr(struct ib_fmr *ibfmr);
 
+static inline void qib_get_mr(struct qib_mregion *mr)
+{
+	atomic_inc(&mr->refcount);
+}
+
+static inline void qib_put_mr(struct qib_mregion *mr)
+{
+	if (unlikely(atomic_dec_and_test(&mr->refcount)))
+		complete(&mr->comp);
+}
+
+static inline void qib_put_ss(struct qib_sge_state *ss)
+{
+	while (ss->num_sge) {
+		qib_put_mr(ss->sge.mr);
+		if (--ss->num_sge)
+			ss->sge = *ss->sg_list++;
+	}
+}
+
+
 void qib_release_mmap_info(struct kref *ref);
 
 struct qib_mmap_info *qib_create_mmap_info(struct qib_ibdev *dev, u32 size,
 					   struct ib_ucontext *context,
 					   void *obj);
 
 void qib_update_mmap_info(struct qib_ibdev *dev, struct qib_mmap_info *ip,
 			  u32 size, void *obj);
 
-- 
1.7.10


--n8g4imXOkfNTN/H1--
