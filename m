From: Colin King <colin.king@canonical.com>
Date: Fri, 17 Nov 2017 14:50:55 +0000
Subject: [PATCH] staging: rtl8822be: fix missing null check on dev_alloc_skb return
Message-Id: <20171117145055.30430-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Kalle Valo <kvalo@codeaurora.org>, Ping-Ke Shih <pkshih@realtek.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

dev_alloc_skb can potentially return NULL, so add a null check to
avoid a null pointer dereference on skb

Detected by CoverityScan, CID#1454558 ("Dereference on null return")

Fixes: 7e5b796cde7e ("staging: r8822be: Add the driver code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/rtl8822be/fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtlwifi/rtl8822be/fw.c b/drivers/staging/rtlwifi/rtl8822be/fw.c
index f45487122517..483ea85943c3 100644
--- a/drivers/staging/rtlwifi/rtl8822be/fw.c
+++ b/drivers/staging/rtlwifi/rtl8822be/fw.c
@@ -464,6 +464,8 @@ bool rtl8822b_halmac_cb_write_data_rsvd_page(struct rtl_priv *rtlpriv, u8 *buf,
 	int count;
 
 	skb = dev_alloc_skb(size);
+	if (!skb)
+		return false;
 	memcpy((u8 *)skb_put(skb, size), buf, size);
 
 	if (!_rtl8822be_send_bcn_or_cmd_packet(rtlpriv->hw, skb, BEACON_QUEUE))
-- 
2.14.1

