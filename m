From: Dan Carpenter <error27@gmail.com>
Date: Sat, 27 Aug 2011 11:06:07 +0000
Subject: [patch] Staging: hv: netvsc: return negative error codes
Message-Id: <20110827110606.GM3775@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There was a typo here and we changed the -ENOMEM into +ENOMEM.  The
error codes aren't used, so this is just a cleanup.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/hv/netvsc.c b/drivers/staging/hv/netvsc.c
index b6e1fb9..0b801f5 100644
--- a/drivers/staging/hv/netvsc.c
+++ b/drivers/staging/hv/netvsc.c
@@ -175,7 +175,7 @@ static int netvsc_destroy_recv_buf(struct netvsc_device *net_device)
 		if (ret != 0) {
 			dev_err(&net_device->dev->device,
 				   "unable to teardown receive buffer's gpadl");
-			return -ret;
+			return ret;
 		}
 		net_device->recv_buf_gpadl_handle = 0;
 	}
