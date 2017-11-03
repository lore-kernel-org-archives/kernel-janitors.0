From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Nov 2017 08:42:02 +0000
Subject: [PATCH] xen/pvcalls: fix unsigned less than zero error check
Message-Id: <20171103084202.27790-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check on bedata->ref is never true because ref is an unsigned
integer. Fix this by assigning signed int ret to the return of the
call to gnttab_claim_grant_reference so the -ve return can be checked.

Detected by CoverityScan, CID#1460358 ("Unsigned compared against 0")

Fixes: 219681909913 ("xen/pvcalls: connect to the backend")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/xen/pvcalls-front.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 0c1ec6894cc4..de8a470351a5 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -1186,11 +1186,10 @@ static int pvcalls_front_probe(struct xenbus_device *dev,
 	ret = gnttab_alloc_grant_references(1, &gref_head);
 	if (ret < 0)
 		goto error;
-	bedata->ref = gnttab_claim_grant_reference(&gref_head);
-	if (bedata->ref < 0) {
-		ret = bedata->ref;
+	ret = gnttab_claim_grant_reference(&gref_head);
+	if (ret < 0)
 		goto error;
-	}
+	bedata->ref = ret;
 	gnttab_grant_foreign_access_ref(bedata->ref, dev->otherend_id,
 					virt_to_gfn((void *)sring), 0);
 
-- 
2.14.1

