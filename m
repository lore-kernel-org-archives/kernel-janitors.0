From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 12:49:40 +0000
Subject: [patch] staging: android: ion: Fix error handling in ion_query_heaps()
Message-Id: <20161012124940.GA23933@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

copy_to_user() returns the number of bytes remaining to be copied.  We
want to return -EFAULT here instead.  Also there seems like no point
in continuing the loop if copy_to_user() fails.

Fixes: 02b23803c6af ('staging: android: ion: Add ioctl to query available heaps')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The error handling still might be wrong here.  Do we really want to
change query->cnt?  Please review.

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
index 396ded5..4cec0b2 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -1187,8 +1187,10 @@ int ion_query_heaps(struct ion_client *client, struct ion_heap_query *query)
 		hdata.type = heap->type;
 		hdata.heap_id = heap->id;
 
-		ret = copy_to_user(&buffer[cnt],
-				   &hdata, sizeof(hdata));
+		if (copy_to_user(&buffer[cnt], &hdata, sizeof(hdata))) {
+			ret = -EFAULT;
+			break;
+		}
 
 		cnt++;
 		if (cnt >= max_cnt)
