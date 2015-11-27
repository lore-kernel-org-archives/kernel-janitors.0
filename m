From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Nov 2015 13:43:27 +0000
Subject: [patch] brcm80211: fix error code in brcmf_pcie_exit_download_state()
Message-Id: <20151127134327.GA16802@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>
Cc: Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, Kalle Valo <kvalo@codeaurora.org>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

The original code returns 1 on failure and 0 on success but the caller
was expecting an error code on failure.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 83d8042..e149541 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -622,7 +622,9 @@ static int brcmf_pcie_exit_download_state(struct brcmf_pciedev_info *devinfo,
 		brcmf_chip_resetcore(core, 0, 0, 0);
 	}
 
-	return !brcmf_chip_set_active(devinfo->ci, resetintr);
+	if (!brcmf_chip_set_active(devinfo->ci, resetintr))
+		return -EINVAL;
+	return 0;
 }
 
 
