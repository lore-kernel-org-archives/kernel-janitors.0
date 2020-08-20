From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Thu, 20 Aug 2020 08:52:02 +0000
Subject: [PATCH 3/6] staging: wfx/data_rx.c: Fix spelling mistake "negociation" => "negotiation"
Message-Id: <7e0dab9eb4d976605371f1ba814ce32d62366dd4.1597913333.git.usuraj35@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com>
In-Reply-To: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jerome.pouiller@silabs.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/staging/wfx/data_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/data_rx.c b/drivers/staging/wfx/data_rx.c
index 6fb078880742..7fcbbfc53416 100644
--- a/drivers/staging/wfx/data_rx.c
+++ b/drivers/staging/wfx/data_rx.c
@@ -73,7 +73,7 @@ void wfx_rx_cb(struct wfx_vif *wvif,
 	if (arg->rx_flags.encryp)
 		hdr->flag |= RX_FLAG_DECRYPTED;
 
-	// Block ack negociation is offloaded by the firmware. However,
+	// Block ack negotiation is offloaded by the firmware. However,
 	// re-ordering must be done by the mac80211.
 	if (ieee80211_is_action(frame->frame_control) &&
 	    mgmt->u.action.category = WLAN_CATEGORY_BACK &&
-- 
2.17.1
