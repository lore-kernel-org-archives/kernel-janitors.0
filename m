From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Aug 2017 08:42:06 +0000
Subject: [PATCH] staging: r8822be: remove some dead code
Message-Id: <20170825084206.upqz4f6kmzzs47xp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"hdr" can't be NULL.  We take skb->data which is non-NULL and add an
offset to get "hdr".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtlwifi/rtl8822be/trx.c b/drivers/staging/rtlwifi/rtl8822be/trx.c
index 123e83bd6e82..38f80e48a399 100644
--- a/drivers/staging/rtlwifi/rtl8822be/trx.c
+++ b/drivers/staging/rtlwifi/rtl8822be/trx.c
@@ -279,13 +279,6 @@ bool rtl8822be_rx_query_desc(struct ieee80211_hw *hw, struct rtl_stats *status,
 	 * to decrypt it
 	 */
 	if (status->decrypted) {
-		if (!hdr) {
-			WARN_ON_ONCE(true);
-			pr_err("decrypted is true but hdr NULL, from skb %p\n",
-			       rtl_get_hdr(skb));
-			return false;
-		}
-
 		if ((!_ieee80211_is_robust_mgmt_frame(hdr)) &&
 		    (ieee80211_has_protected(hdr->frame_control)))
 			rx_status->flag |= RX_FLAG_DECRYPTED;
