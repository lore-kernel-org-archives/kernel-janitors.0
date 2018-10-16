From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Oct 2018 17:43:42 +0000
Subject: [PATCH] brcmfmac: fix spelling mistake "Retreiving" -> "Retrieving"
Message-Id: <20181016174342.1867-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in brcmf_err error message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index 94044a7a6021..9f6938f8b1ca 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
@@ -214,7 +214,7 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
 	err = brcmf_fil_iovar_data_get(ifp, "cur_etheraddr", ifp->mac_addr,
 				       sizeof(ifp->mac_addr));
 	if (err < 0) {
-		brcmf_err("Retreiving cur_etheraddr failed, %d\n", err);
+		brcmf_err("Retrieving cur_etheraddr failed, %d\n", err);
 		goto done;
 	}
 	memcpy(ifp->drvr->wiphy->perm_addr, ifp->drvr->mac, ETH_ALEN);
@@ -269,7 +269,7 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
 	strcpy(buf, "ver");
 	err = brcmf_fil_iovar_data_get(ifp, "ver", buf, sizeof(buf));
 	if (err < 0) {
-		brcmf_err("Retreiving version information failed, %d\n",
+		brcmf_err("Retrieving version information failed, %d\n",
 			  err);
 		goto done;
 	}
-- 
2.19.1
