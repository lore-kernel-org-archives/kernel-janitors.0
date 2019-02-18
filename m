From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 07:55:22 +0000
Subject: [PATCH] brcmfmac: remove set but not used variable 'old_state'
Message-Id: <20190218080846.187942-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c: In function 'brcmf_usb_state_change':
drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c:578:6: warning:
 variable 'old_state' set but not used [-Wunused-but-set-variable]

It's never used and can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
index 76cfaf6999c8..398536b30b7a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
@@ -575,7 +575,6 @@ static void
 brcmf_usb_state_change(struct brcmf_usbdev_info *devinfo, int state)
 {
 	struct brcmf_bus *bcmf_bus = devinfo->bus_pub.bus;
-	int old_state;
 
 	brcmf_dbg(USB, "Enter, current state=%d, new state=%d\n",
 		  devinfo->bus_pub.state, state);
@@ -583,7 +582,6 @@ brcmf_usb_state_change(struct brcmf_usbdev_info *devinfo, int state)
 	if (devinfo->bus_pub.state = state)
 		return;
 
-	old_state = devinfo->bus_pub.state;
 	devinfo->bus_pub.state = state;
 
 	/* update state of upper layer */
