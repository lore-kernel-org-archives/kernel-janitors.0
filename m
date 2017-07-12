From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jul 2017 07:25:06 +0000
Subject: [PATCH] xen/pvcalls: NULL dereference in error handling
Message-Id: <20170712072506.3lzevgfwuzgs5u2s@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We accidentally dereference "map" when it's NULL.

Fixes: b535e2b9b78a ("xen/pvcalls: implement connect command")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index d6c4c4aecb41..01b690e1e555 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -424,7 +424,7 @@ static int pvcalls_back_connect(struct xenbus_device *dev,
 					sock);
 	if (!map) {
 		ret = -EFAULT;
-		sock_release(map->sock);
+		sock_release(sock);
 	}
 
 out:
