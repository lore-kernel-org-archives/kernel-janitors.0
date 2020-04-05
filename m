From: Colin King <colin.king@canonical.com>
Date: Sun, 05 Apr 2020 13:39:06 +0000
Subject: [PATCH] brcm80211: remove redundant pointer 'address'
Message-Id: <20200405133906.381358-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer 'address' is being assigned and updated in a few places
by it is never read. Hence the assignments are redundant and can
be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/commonring.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.c
index 49db54d23e03..e44236cb210e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.c
@@ -180,14 +180,8 @@ brcmf_commonring_reserve_for_write_multiple(struct brcmf_commonring *commonring,
 
 int brcmf_commonring_write_complete(struct brcmf_commonring *commonring)
 {
-	void *address;
-
-	address = commonring->buf_addr;
-	address += (commonring->f_ptr * commonring->item_len);
-	if (commonring->f_ptr > commonring->w_ptr) {
-		address = commonring->buf_addr;
+	if (commonring->f_ptr > commonring->w_ptr)
 		commonring->f_ptr = 0;
-	}
 
 	commonring->f_ptr = commonring->w_ptr;
 
-- 
2.25.1
