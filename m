From: Colin King <colin.king@canonical.com>
Date: Sun, 05 May 2019 21:16:23 +0000
Subject: [PATCH][next] brcmfmac: remove redundant u32 comparison with less than zero
Message-Id: <20190505211623.3153-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for the u32 variable idx being less than zero is
always false and is redundant. Remove it.

Addresses-Coverity: ("Unsigned compared against 0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
index 9d1f9ff25bfa..e874dddc7b7f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
@@ -375,7 +375,7 @@ brcmf_msgbuf_get_pktid(struct device *dev, struct brcmf_msgbuf_pktids *pktids,
 	struct brcmf_msgbuf_pktid *pktid;
 	struct sk_buff *skb;
 
-	if (idx < 0 || idx >= pktids->array_size) {
+	if (idx >= pktids->array_size) {
 		brcmf_err("Invalid packet id %d (max %d)\n", idx,
 			  pktids->array_size);
 		return NULL;
-- 
2.20.1
