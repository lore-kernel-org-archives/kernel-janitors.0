From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Jul 2017 19:41:21 +0000
Subject: [PATCH][xen-next] xen/pvcalls: fix null pointer reference on sock_release call
Message-Id: <20170711194121.24802-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently a sock_release on map->sock will result in a null pointer
deference on map when map is null. Instead, the sock_relase sould
be on sock and not map->sock.

Detected by CoverityScan, CID#1450169 ("Dereference after null check")

Fixes: b535e2b9b78a ("xen/pvcalls: implement connect command")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/xen/pvcalls-back.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.11.0

