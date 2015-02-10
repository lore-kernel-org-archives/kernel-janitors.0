From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Tue, 10 Feb 2015 10:42:08 +0000
Subject: [PATCH 1/1] staging: ozwpan: Move code from success handling to error handling
Message-Id: <20150210104208.GA16539@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shigekatsu Tateno <shigekatsu.tateno@atmel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

The original version was success handling rather than error handling,
therefore this patch reduces nesting.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/ozwpan/ozhcd.c | 18 +++++++-------
 drivers/staging/ozwpan/ozpd.c  | 53 +++++++++++++++++++++---------------------
 2 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/ozwpan/ozhcd.c b/drivers/staging/ozwpan/ozhcd.c
index 96e95bf..5ff4716 100644
--- a/drivers/staging/ozwpan/ozhcd.c
+++ b/drivers/staging/ozwpan/ozhcd.c
@@ -283,15 +283,17 @@ static struct oz_endpoint *oz_ep_alloc(int buffer_size, gfp_t mem_flags)
 	struct oz_endpoint *ep;
 
 	ep = kzalloc(sizeof(struct oz_endpoint)+buffer_size, mem_flags);
-	if (ep) {
-		INIT_LIST_HEAD(&ep->urb_list);
-		INIT_LIST_HEAD(&ep->link);
-		ep->credit = -1;
-		if (buffer_size) {
-			ep->buffer_size = buffer_size;
-			ep->buffer = (u8 *)(ep+1);
-		}
+	if (!ep)
+		return NULL;
+
+	INIT_LIST_HEAD(&ep->urb_list);
+	INIT_LIST_HEAD(&ep->link);
+	ep->credit = -1;
+	if (buffer_size) {
+		ep->buffer_size = buffer_size;
+		ep->buffer = (u8 *)(ep+1);
 	}
+
 	return ep;
 }
 
diff --git a/drivers/staging/ozwpan/ozpd.c b/drivers/staging/ozwpan/ozpd.c
index 1c95d57..021d74a 100644
--- a/drivers/staging/ozwpan/ozpd.c
+++ b/drivers/staging/ozwpan/ozpd.c
@@ -103,34 +103,35 @@ void oz_pd_put(struct oz_pd *pd)
 struct oz_pd *oz_pd_alloc(const u8 *mac_addr)
 {
 	struct oz_pd *pd;
+	int i;
 
 	pd = kzalloc(sizeof(struct oz_pd), GFP_ATOMIC);
-	if (pd) {
-		int i;
-
-		atomic_set(&pd->ref_count, 2);
-		for (i = 0; i < OZ_NB_APPS; i++)
-			spin_lock_init(&pd->app_lock[i]);
-		pd->last_rx_pkt_num = 0xffffffff;
-		oz_pd_set_state(pd, OZ_PD_S_IDLE);
-		pd->max_tx_size = OZ_MAX_TX_SIZE;
-		ether_addr_copy(pd->mac_addr, mac_addr);
-		oz_elt_buf_init(&pd->elt_buff);
-		spin_lock_init(&pd->tx_frame_lock);
-		INIT_LIST_HEAD(&pd->tx_queue);
-		INIT_LIST_HEAD(&pd->farewell_list);
-		pd->last_sent_frame = &pd->tx_queue;
-		spin_lock_init(&pd->stream_lock);
-		INIT_LIST_HEAD(&pd->stream_list);
-		tasklet_init(&pd->heartbeat_tasklet, oz_pd_heartbeat_handler,
-							(unsigned long)pd);
-		tasklet_init(&pd->timeout_tasklet, oz_pd_timeout_handler,
-							(unsigned long)pd);
-		hrtimer_init(&pd->heartbeat, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		hrtimer_init(&pd->timeout, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		pd->heartbeat.function = oz_pd_heartbeat_event;
-		pd->timeout.function = oz_pd_timeout_event;
-	}
+	if (!pd)
+		return NULL;
+
+	atomic_set(&pd->ref_count, 2);
+	for (i = 0; i < OZ_NB_APPS; i++)
+		spin_lock_init(&pd->app_lock[i]);
+	pd->last_rx_pkt_num = 0xffffffff;
+	oz_pd_set_state(pd, OZ_PD_S_IDLE);
+	pd->max_tx_size = OZ_MAX_TX_SIZE;
+	ether_addr_copy(pd->mac_addr, mac_addr);
+	oz_elt_buf_init(&pd->elt_buff);
+	spin_lock_init(&pd->tx_frame_lock);
+	INIT_LIST_HEAD(&pd->tx_queue);
+	INIT_LIST_HEAD(&pd->farewell_list);
+	pd->last_sent_frame = &pd->tx_queue;
+	spin_lock_init(&pd->stream_lock);
+	INIT_LIST_HEAD(&pd->stream_list);
+	tasklet_init(&pd->heartbeat_tasklet, oz_pd_heartbeat_handler,
+						(unsigned long)pd);
+	tasklet_init(&pd->timeout_tasklet, oz_pd_timeout_handler,
+						(unsigned long)pd);
+	hrtimer_init(&pd->heartbeat, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	hrtimer_init(&pd->timeout, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	pd->heartbeat.function = oz_pd_heartbeat_event;
+	pd->timeout.function = oz_pd_timeout_event;
+
 	return pd;
 }
 
-- 
1.9.1

