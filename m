From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Nov 2011 18:24:36 +0000
Subject: [patch 2/2] xen-gntalloc: signedness bug in add_grefs()
Message-Id: <20111104182436.GE5796@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
Cc: kernel-janitors@vger.kernel.org, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

gref->gref_id is unsigned so the error handling didn't work.
gnttab_grant_foreign_access() returns an int type, so we can add a
cast here, and it doesn't cause any problems.
gnttab_grant_foreign_access() can return a variety of errors
including -ENOSPC, -ENOSYS and -ENOMEM.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
index 23c60cf..e1c4c6e 100644
--- a/drivers/xen/gntalloc.c
+++ b/drivers/xen/gntalloc.c
@@ -135,7 +135,7 @@ static int add_grefs(struct ioctl_gntalloc_alloc_gref *op,
 		/* Grant foreign access to the page. */
 		gref->gref_id = gnttab_grant_foreign_access(op->domid,
 			pfn_to_mfn(page_to_pfn(gref->page)), readonly);
-		if (gref->gref_id < 0) {
+		if ((int)gref->gref_id < 0) {
 			rc = gref->gref_id;
 			goto undo;
 		}
