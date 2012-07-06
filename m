From: Fengguang Wu <wfg@linux.intel.com>
Date: Fri, 06 Jul 2012 14:07:09 +0000
Subject: Re: [infiniband:for-next 13/14] drivers/infiniband/hw/qib/qib_keys.c:64:23: sparse: incompatible typ
Message-Id: <20120706140709.GA11894@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120706080229.GB28650@localhost>
In-Reply-To: <20120706080229.GB28650@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 06, 2012 at 03:23:54PM +0300, Dan Carpenter wrote:
> On Fri, Jul 06, 2012 at 11:58:14AM +0000, Marciniszyn, Mike wrote:
> > I'm not seeing this on either of my build test systems.
> > 
> > Can you provide your .config file and gcc version?
> > 
> 
> This isn't a GCC warning, it's a sparse warning.  It's saying that
> your Sparse rcu anotations aren't correct, probably.

Yeah these warnings can be reproduced with

1) CONFIG_SPARSE_RCU_POINTER=y
2) make C=1 drivers/infiniband/hw/qib/qib_keys.o

Paul has a nice article on the details

        The RCU API, 2010 Edition
        https://lwn.net/Articles/418853/ 

For the entitled warning, the fix should be

diff --git a/drivers/infiniband/hw/qib/qib_keys.c b/drivers/infiniband/hw/qib/qib_keys.c
index 970165b..3c8c27d 100644
--- a/drivers/infiniband/hw/qib/qib_keys.c
+++ b/drivers/infiniband/hw/qib/qib_keys.c
@@ -349,7 +349,7 @@ int qib_fast_reg_mr(struct qib_qp *qp, struct ib_send_wr *wr)
 	if (pd->user || rkey = 0)
 		goto bail;
 
-	mr = rkt->table[(rkey >> (32 - ib_qib_lkey_table_size))];
+	mr = rcu_dereference(rkt->table[(rkey >> (32 - ib_qib_lkey_table_size))]);
 	if (unlikely(mr = NULL || qp->ibqp.pd != mr->pd))
 		goto bail;
 
diff --git a/drivers/infiniband/hw/qib/qib_verbs.h b/drivers/infiniband/hw/qib/qib_verbs.h
index 85751fd..1293133 100644
--- a/drivers/infiniband/hw/qib/qib_verbs.h
+++ b/drivers/infiniband/hw/qib/qib_verbs.h
@@ -650,7 +650,7 @@ struct qib_lkey_table {
 	u32 next;               /* next unused index (speeds search) */
 	u32 gen;                /* generation count */
 	u32 max;                /* size of the table */
-	struct qib_mregion **table;
+	struct qib_mregion __rcu **table;
 };
 
 struct qib_opcode_stats {
@@ -732,7 +732,7 @@ struct qib_ibdev {
 	struct list_head pending_mmaps;
 	spinlock_t mmap_offset_lock; /* protect mmap_offset */
 	u32 mmap_offset;
-	struct qib_mregion *dma_mr;
+	struct qib_mregion __rcu *dma_mr;
 
 	/* QP numbers are shared by all IB ports */
 	struct qib_qpn_table qpn_table;

> I've added Fengguang's other email address in case wfg isn't fixed
> yet.

Thank you! The wfg address seems to work fine except for the previous
abnormal case :)

Thanks,
Fengguang
