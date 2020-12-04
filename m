From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Dec 2020 18:04:59 +0000
Subject: [PATCH] net: brcmfmac: remove redundant assignment to pointer 'entry'
Message-Id: <20201204180459.1148257-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-hsien Lin <chi-hsien.lin@infineon.com>, Wright Feng <wright.feng@infineon.com>, Chung-hsien Hsu <chung-hsien.hsu@infineon.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, SHA-cyfmac-dev-list@infineon.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'entry' is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
index 437e83ea8902..19b0f318f93e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
@@ -746,7 +746,7 @@ brcmf_fws_macdesc_lookup(struct brcmf_fws_info *fws, u8 *ea)
 static struct brcmf_fws_mac_descriptor*
 brcmf_fws_macdesc_find(struct brcmf_fws_info *fws, struct brcmf_if *ifp, u8 *da)
 {
-	struct brcmf_fws_mac_descriptor *entry = &fws->desc.other;
+	struct brcmf_fws_mac_descriptor *entry;
 	bool multicast;
 
 	multicast = is_multicast_ether_addr(da);
-- 
2.29.2
