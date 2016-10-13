From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 12:55:08 +0000
Subject: [patch v2] staging: android: ion: Fix error handling in ion_query_heaps()
Message-Id: <20161013125508.GA12868@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If the copy_to_user() fails we should unlock and return directly without
updating "cnt".  Also the return value should be -EFAULT instead of the
number of bytes remaining.

Fixes: 02b23803c6af ("staging: android: ion: Add ioctl to query available heaps")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: a more complete fix

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
index 396ded5..209a8f7 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -1187,8 +1187,10 @@ int ion_query_heaps(struct ion_client *client, struct ion_heap_query *query)
 		hdata.type = heap->type;
 		hdata.heap_id = heap->id;
 
-		ret = copy_to_user(&buffer[cnt],
-				   &hdata, sizeof(hdata));
+		if (copy_to_user(&buffer[cnt], &hdata, sizeof(hdata))) {
+			ret = -EFAULT;
+			goto out;
+		}
 
 		cnt++;
 		if (cnt >= max_cnt)
