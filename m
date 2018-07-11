From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Jul 2018 11:47:28 +0000
Subject: [PATCH] staging: vt6655: remove some redundant variables
Message-Id: <20180711114728.31924-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variables rx_sts, sq, frame and is_pspoll are being assigned but are
never used hence they are redundant and can be removed.

Cleans up clang warnings:
warning: variable 'sq' set but not used [-Wunused-but-set-variable]
warning: variable 'rx_sts' set but not used [-Wunused-but-set-variable]
warning: variable 'frame' set but not used [-Wunused-but-set-variable]
warning: variable 'is_pspoll' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/vt6655/dpc.c  | 4 +---
 drivers/staging/vt6656/dpc.c  | 4 +---
 drivers/staging/vt6656/rxtx.c | 5 +----
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/dpc.c b/drivers/staging/vt6655/dpc.c
index 088d2d9dbc21..52214a30e9b6 100644
--- a/drivers/staging/vt6655/dpc.c
+++ b/drivers/staging/vt6655/dpc.c
@@ -34,7 +34,7 @@ static bool vnt_rx_data(struct vnt_private *priv, struct sk_buff *skb,
 	__le64 *tsf_time;
 	u16 frame_size;
 	int ii, r;
-	u8 *rx_sts, *rx_rate, *sq;
+	u8 *rx_rate;
 	u8 *skb_data;
 	u8 rate_idx = 0;
 	u8 rate[MAX_RATE] = {2, 4, 11, 22, 12, 18, 24, 36, 48, 72, 96, 108};
@@ -49,7 +49,6 @@ static bool vnt_rx_data(struct vnt_private *priv, struct sk_buff *skb,
 
 	skb_data = (u8 *)skb->data;
 
-	rx_sts = skb_data;
 	rx_rate = skb_data + 1;
 
 	sband = hw->wiphy->bands[hw->conf.chandef.chan->band];
@@ -74,7 +73,6 @@ static bool vnt_rx_data(struct vnt_private *priv, struct sk_buff *skb,
 	}
 
 	tsf_time = (__le64 *)(skb_data + bytes_received - 12);
-	sq = skb_data + bytes_received - 4;
 	new_rsr = skb_data + bytes_received - 3;
 	rssi = skb_data + bytes_received - 2;
 	rsr = skb_data + bytes_received - 1;
diff --git a/drivers/staging/vt6656/dpc.c b/drivers/staging/vt6656/dpc.c
index c3b5b1431048..3b94e80f1d5e 100644
--- a/drivers/staging/vt6656/dpc.c
+++ b/drivers/staging/vt6656/dpc.c
@@ -32,7 +32,7 @@ int vnt_rx_data(struct vnt_private *priv, struct vnt_rcb *ptr_rcb,
 	struct ieee80211_rx_status rx_status = { 0 };
 	struct ieee80211_hdr *hdr;
 	__le16 fc;
-	u8 *rsr, *new_rsr, *rssi, *frame;
+	u8 *rsr, *new_rsr, *rssi;
 	__le64 *tsf_time;
 	u32 frame_size;
 	int ii, r;
@@ -133,8 +133,6 @@ int vnt_rx_data(struct vnt_private *priv, struct vnt_rcb *ptr_rcb,
 	priv->bb_pre_ed_rssi = (u8)rx_dbm + 1;
 	priv->current_rssi = priv->bb_pre_ed_rssi;
 
-	frame = skb_data + 8;
-
 	skb_pull(skb, 8);
 	skb_trim(skb, frame_size);
 
diff --git a/drivers/staging/vt6656/rxtx.c b/drivers/staging/vt6656/rxtx.c
index 26ca3fa29301..9def0748ffee 100644
--- a/drivers/staging/vt6656/rxtx.c
+++ b/drivers/staging/vt6656/rxtx.c
@@ -797,7 +797,7 @@ int vnt_tx_packet(struct vnt_private *priv, struct sk_buff *skb)
 	unsigned long flags;
 	u16 tx_bytes, tx_header_size, tx_body_size, current_rate, duration_id;
 	u8 pkt_type, fb_option = AUTO_FB_NONE;
-	bool need_rts = false, is_pspoll = false;
+	bool need_rts = false;
 	bool need_mic = false;
 
 	hdr = (struct ieee80211_hdr *)(skb->data);
@@ -888,9 +888,6 @@ int vnt_tx_packet(struct vnt_private *priv, struct sk_buff *skb)
 	if (ieee80211_has_a4(hdr->frame_control))
 		tx_buffer_head->fifo_ctl |= cpu_to_le16(FIFOCTL_LHEAD);
 
-	if (info->flags & IEEE80211_TX_CTL_NO_PS_BUFFER)
-		is_pspoll = true;
-
 	tx_buffer_head->frag_ctl  			cpu_to_le16(ieee80211_get_hdrlen_from_skb(skb) << 10);
 
-- 
2.17.1

