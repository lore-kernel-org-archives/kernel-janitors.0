From: Walter Harms <wharms@bfs.de>
Date: Fri, 14 Aug 2020 08:49:43 +0000
Subject: AW: [PATCH] ath6kl: prevent potential array overflow in ath6kl_add_new_sta()
Message-Id: <61e34f670a4845f8b1cbf6f6013f8a35@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200813141315.GB457408@mwanda>
In-Reply-To: <20200813141315.GB457408@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Jouni Malinen <jouni@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

nitpicking:

the debugtrace will give the impression that the function is 
running. perhaps it is more clever to have this after the check.

jm2c,
 wh
________________________________________
Von: kernel-janitors-owner@vger.kernel.org [kernel-janitors-owner@vger.kernel.org] im Auftrag von Dan Carpenter [dan.carpenter@oracle.com]
Gesendet: Donnerstag, 13. August 2020 16:13
An: Kalle Valo
Cc: Jakub Kicinski; Jouni Malinen; linux-wireless@vger.kernel.org; kernel-janitors@vger.kernel.org
Betreff: [PATCH] ath6kl: prevent potential array overflow in ath6kl_add_new_sta()

The value for "aid" comes from skb->data so Smatch marks it as
untrusted.  If it's invalid then it can result in an out of bounds array
access in ath6kl_add_new_sta().

Fixes: 572e27c00c9d ("ath6kl: Fix AP mode connect event parsing and TIM updates")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath6kl/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath6kl/main.c b/drivers/net/wireless/ath/ath6kl/main.c
index 5e7ea838a921..814131a0680a 100644
--- a/drivers/net/wireless/ath/ath6kl/main.c
+++ b/drivers/net/wireless/ath/ath6kl/main.c
@@ -430,6 +430,9 @@ void ath6kl_connect_ap_mode_sta(struct ath6kl_vif *vif, u16 aid, u8 *mac_addr,

        ath6kl_dbg(ATH6KL_DBG_TRC, "new station %pM aid=%d\n", mac_addr, aid);

+       if (aid < 1 || aid > AP_MAX_NUM_STA)
+               return;
+
        if (assoc_req_len > sizeof(struct ieee80211_hdr_3addr)) {
                struct ieee80211_mgmt *mgmt =
                        (struct ieee80211_mgmt *) assoc_info;
--
2.28.0
