From: Rohit Sarkar <rohitsarkar5398@gmail.com>
Date: Wed, 11 Sep 2019 13:51:30 +0000
Subject: [PATCH] staging: vhciq_core: replace snprintf with scnprintf
Message-Id: <20190911135112.GA5569@SARKAR>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Tobias =?iso-8859-1?Q?B=FCttner?= <tobias.buettner@fau.de>, linux-rpi-kernel@lists.infradead.org, Dominic Braun <inf.braun@fau.de>

When the number of bytes to be printed exceeds the limit snprintf
returns the number of bytes that would have been printed (if there was
no truncation). This might cause issues, hence use scnprintf which
returns the actual number of bytes printed to buffer always

Signed-off-by: Rohit Sarkar <rohitsarkar5398@gmail.com>
---
 .../interface/vchiq_arm/vchiq_core.c          | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 183f5cf887e0..56a23a297fa4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3322,13 +3322,13 @@ vchiq_dump_shared_state(void *dump_context, struct vchiq_state *state,
 	char buf[80];
 	int len;
 
-	len = snprintf(buf, sizeof(buf),
+	len = scnprintf(buf, sizeof(buf),
 		"  %s: slots %d-%d tx_pos=%x recycle=%x",
 		label, shared->slot_first, shared->slot_last,
 		shared->tx_pos, shared->slot_queue_recycle);
 	vchiq_dump(dump_context, buf, len + 1);
 
-	len = snprintf(buf, sizeof(buf),
+	len = scnprintf(buf, sizeof(buf),
 		"    Slots claimed:");
 	vchiq_dump(dump_context, buf, len + 1);
 
@@ -3336,7 +3336,7 @@ vchiq_dump_shared_state(void *dump_context, struct vchiq_state *state,
 		struct vchiq_slot_info slot_info  						*SLOT_INFO_FROM_INDEX(state, i);
 		if (slot_info.use_count != slot_info.release_count) {
-			len = snprintf(buf, sizeof(buf),
+			len = scnprintf(buf, sizeof(buf),
 				"      %d: %d/%d", i, slot_info.use_count,
 				slot_info.release_count);
 			vchiq_dump(dump_context, buf, len + 1);
@@ -3344,7 +3344,7 @@ vchiq_dump_shared_state(void *dump_context, struct vchiq_state *state,
 	}
 
 	for (i = 1; i < shared->debug[DEBUG_ENTRIES]; i++) {
-		len = snprintf(buf, sizeof(buf), "    DEBUG: %s = %d(%x)",
+		len = scnprintf(buf, sizeof(buf), "    DEBUG: %s = %d(%x)",
 			debug_names[i], shared->debug[i], shared->debug[i]);
 		vchiq_dump(dump_context, buf, len + 1);
 	}
@@ -3357,11 +3357,11 @@ vchiq_dump_state(void *dump_context, struct vchiq_state *state)
 	int len;
 	int i;
 
-	len = snprintf(buf, sizeof(buf), "State %d: %s", state->id,
+	len = scnprintf(buf, sizeof(buf), "State %d: %s", state->id,
 		conn_state_names[state->conn_state]);
 	vchiq_dump(dump_context, buf, len + 1);
 
-	len = snprintf(buf, sizeof(buf),
+	len = scnprintf(buf, sizeof(buf),
 		"  tx_pos=%x(@%pK), rx_pos=%x(@%pK)",
 		state->local->tx_pos,
 		state->tx_data + (state->local_tx_pos & VCHIQ_SLOT_MASK),
@@ -3369,13 +3369,13 @@ vchiq_dump_state(void *dump_context, struct vchiq_state *state)
 		state->rx_data + (state->rx_pos & VCHIQ_SLOT_MASK));
 	vchiq_dump(dump_context, buf, len + 1);
 
-	len = snprintf(buf, sizeof(buf),
+	len = scnprintf(buf, sizeof(buf),
 		"  Version: %d (min %d)",
 		VCHIQ_VERSION, VCHIQ_VERSION_MIN);
 	vchiq_dump(dump_context, buf, len + 1);
 
 	if (VCHIQ_ENABLE_STATS) {
-		len = snprintf(buf, sizeof(buf),
+		len = scnprintf(buf, sizeof(buf),
 			"  Stats: ctrl_tx_count=%d, ctrl_rx_count=%d, "
 			"error_count=%d",
 			state->stats.ctrl_tx_count, state->stats.ctrl_rx_count,
@@ -3383,7 +3383,7 @@ vchiq_dump_state(void *dump_context, struct vchiq_state *state)
 		vchiq_dump(dump_context, buf, len + 1);
 	}
 
-	len = snprintf(buf, sizeof(buf),
+	len = scnprintf(buf, sizeof(buf),
 		"  Slots: %d available (%d data), %d recyclable, %d stalls "
 		"(%d data)",
 		((state->slot_queue_available * VCHIQ_SLOT_SIZE) -
@@ -3416,7 +3416,7 @@ vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
 	char buf[80];
 	int len;
 
-	len = snprintf(buf, sizeof(buf), "Service %u: %s (ref %u)",
+	len = scnprintf(buf, sizeof(buf), "Service %u: %s (ref %u)",
 		service->localport, srvstate_names[service->srvstate],
 		service->ref_count - 1); /*Don't include the lock just taken*/
 
@@ -3428,17 +3428,17 @@ vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
 		int tx_pending, rx_pending;
 
 		if (service->remoteport != VCHIQ_PORT_FREE) {
-			int len2 = snprintf(remoteport, sizeof(remoteport),
+			int len2 = scnprintf(remoteport, sizeof(remoteport),
 				"%u", service->remoteport);
 
 			if (service->public_fourcc != VCHIQ_FOURCC_INVALID)
-				snprintf(remoteport + len2,
+				scnprintf(remoteport + len2,
 					sizeof(remoteport) - len2,
 					" (client %x)", service->client_id);
 		} else
 			strcpy(remoteport, "n/a");
 
-		len += snprintf(buf + len, sizeof(buf) - len,
+		len += scnprintf(buf + len, sizeof(buf) - len,
 			" '%c%c%c%c' remote %s (msg use %d/%d, slot use %d/%d)",
 			VCHIQ_FOURCC_AS_4CHARS(fourcc),
 			remoteport,
@@ -3455,7 +3455,7 @@ vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
 		rx_pending = service->bulk_rx.local_insert -
 			service->bulk_rx.remote_insert;
 
-		len = snprintf(buf, sizeof(buf),
+		len = scnprintf(buf, sizeof(buf),
 			"  Bulk: tx_pending=%d (size %d),"
 			" rx_pending=%d (size %d)",
 			tx_pending,
@@ -3468,7 +3468,7 @@ vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
 		if (VCHIQ_ENABLE_STATS) {
 			vchiq_dump(dump_context, buf, len + 1);
 
-			len = snprintf(buf, sizeof(buf),
+			len = scnprintf(buf, sizeof(buf),
 				"  Ctrl: tx_count=%d, tx_bytes=%llu, "
 				"rx_count=%d, rx_bytes=%llu",
 				service->stats.ctrl_tx_count,
@@ -3477,7 +3477,7 @@ vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
 				service->stats.ctrl_rx_bytes);
 			vchiq_dump(dump_context, buf, len + 1);
 
-			len = snprintf(buf, sizeof(buf),
+			len = scnprintf(buf, sizeof(buf),
 				"  Bulk: tx_count=%d, tx_bytes=%llu, "
 				"rx_count=%d, rx_bytes=%llu",
 				service->stats.bulk_tx_count,
@@ -3486,7 +3486,7 @@ vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
 				service->stats.bulk_rx_bytes);
 			vchiq_dump(dump_context, buf, len + 1);
 
-			len = snprintf(buf, sizeof(buf),
+			len = scnprintf(buf, sizeof(buf),
 				"  %d quota stalls, %d slot stalls, "
 				"%d bulk stalls, %d aborted, %d errors",
 				service->stats.quota_stalls,
@@ -3562,9 +3562,9 @@ void vchiq_log_dump_mem(const char *label, u32 addr, const void *void_mem,
 
 		for (offset = 0; offset < 16; offset++) {
 			if (offset < num_bytes)
-				s += snprintf(s, 4, "%02x ", mem[offset]);
+				s += scnprintf(s, 4, "%02x ", mem[offset]);
 			else
-				s += snprintf(s, 4, "   ");
+				s += scnprintf(s, 4, "   ");
 		}
 
 		for (offset = 0; offset < 16; offset++) {
-- 
2.17.1
