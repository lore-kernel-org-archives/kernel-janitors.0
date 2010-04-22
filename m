From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 09:56:41 +0000
Subject: [patch] drbd: fix memory leak
Message-Id: <20100422095641.GR29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We leak memory if "--dry-run" is not supported by the peer.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 67e0fc5..93d1f9b 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -1695,6 +1695,7 @@ int drbd_send_protocol(struct drbd_conf *mdev)
 			cf |= CF_DRY_RUN;
 		else {
 			dev_err(DEV, "--dry-run is not supported by peer");
+			kfree(p);
 			return 0;
 		}
 	}
