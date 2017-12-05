From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Dec 2017 14:38:54 +0000
Subject: [PATCH 2/2] xen/pvcalls: Fix a check in pvcalls_front_remove()
Message-Id: <20171205143854.d3exoof6rrdgx6yr@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

bedata->ref can't be less than zero because it's unsigned.  This affects
certain error paths in probe.  We first set ->ref = -1 and then we set
it to a valid value later.

Fixes: 219681909913 ("xen/pvcalls: connect to the backend")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 40caa92bff33..d1e1d8d2b9d5 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -1103,7 +1103,7 @@ static int pvcalls_front_remove(struct xenbus_device *dev)
 			kfree(map);
 		}
 	}
-	if (bedata->ref >= 0)
+	if (bedata->ref != -1)
 		gnttab_end_foreign_access(bedata->ref, 0, 0);
 	kfree(bedata->ring.sring);
 	kfree(bedata);
