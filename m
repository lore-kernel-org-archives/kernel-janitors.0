From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 May 2015 09:59:19 +0000
Subject: [patch] brcmfmac: cleanup a sizeof()
Message-Id: <20150507095919.GB17996@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>
Cc: Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, Kalle Valo <kvalo@codeaurora.org>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

"flowrings" and "*flowrings" are both pointers so this always returns
sizeof(void *) and the current code works fine.  But "*flowrings" is
intended here and static checkers complain, so lets change it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/brcm80211/brcmfmac/pcie.c
index 1831ecd..d371f1e 100644
--- a/drivers/net/wireless/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/brcm80211/brcmfmac/pcie.c
@@ -1609,7 +1609,7 @@ static void brcmf_pcie_setup(struct device *dev, const struct firmware *fw,
 		bus->msgbuf->commonrings[i]  				&devinfo->shared.commonrings[i]->commonring;
 
-	flowrings = kcalloc(devinfo->shared.nrof_flowrings, sizeof(flowrings),
+	flowrings = kcalloc(devinfo->shared.nrof_flowrings, sizeof(*flowrings),
 			    GFP_KERNEL);
 	if (!flowrings)
 		goto fail;
