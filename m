From: Julia Lawall <julia@diku.dk>
Date: Tue, 03 Aug 2010 21:35:36 +0000
Subject: [PATCH 9/9] drivers/infiniband/hw/ehca: Drop unnecessary null test
Message-Id: <Pine.LNX.4.64.1008032335190.20393@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hoang-Nam Nguyen <hnguyen-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Christoph Raisch <raisch-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock@gmai>

From: Julia Lawall <julia@diku.dk>

list_for_each_entry binds its first argument to a non-null value, and thus
any null test on the value of that argument is superfluous.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
iterator I;
expression x;
statement S,S1,S2;
@@

I(x,...) { <...
- if (x = NULL && ...) S
  ...> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/infiniband/hw/ehca/ehca_mrmw.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/infiniband/hw/ehca/ehca_mrmw.c b/drivers/infiniband/hw/ehca/ehca_mrmw.c
index 31a68b9..53f4cd4 100644
--- a/drivers/infiniband/hw/ehca/ehca_mrmw.c
+++ b/drivers/infiniband/hw/ehca/ehca_mrmw.c
@@ -933,11 +933,6 @@ int ehca_unmap_fmr(struct list_head *fmr_list)
 	/* check all FMR belong to same SHCA, and check internal flag */
 	list_for_each_entry(ib_fmr, fmr_list, list) {
 		prev_shca = shca;
-		if (!ib_fmr) {
-			ehca_gen_err("bad fmr=%p in list", ib_fmr);
-			ret = -EINVAL;
-			goto unmap_fmr_exit0;
-		}
 		shca = container_of(ib_fmr->device, struct ehca_shca,
 				    ib_device);
 		e_fmr = container_of(ib_fmr, struct ehca_mr, ib.ib_fmr);
