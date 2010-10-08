From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Oct 2010 12:54:33 +0000
Subject: [patch] Staging: bcm: make major and minor signed
Message-Id: <20101008125433.GJ11681@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We assume that major is signed in register_control_device_interface(). 

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/bcm/Adapter.h b/drivers/staging/bcm/Adapter.h
index 742ddeb..748460e 100644
--- a/drivers/staging/bcm/Adapter.h
+++ b/drivers/staging/bcm/Adapter.h
@@ -484,8 +484,8 @@ struct _MINI_ADAPTER
 	BOOLEAN			    AutoSyncup;
 
 	struct net_device	*dev;
-	UINT				major;
-	UINT				minor;
+	int				major;
+	int				minor;
 	wait_queue_head_t 	tx_packet_wait_queue;
 	wait_queue_head_t 	process_rx_cntrlpkt;
 	atomic_t			process_waiting;
