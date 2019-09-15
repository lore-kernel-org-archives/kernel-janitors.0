From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 15 Sep 2019 19:32:10 +0000
Subject: [PATCH] brcmsmac: remove a useless test
Message-Id: <20190915193210.27357-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arend.vanspriel@broadcom.com, franky.lin@broadcom.com, hante.meuleman@broadcom.com, chi-hsien.lin@cypress.com, wright.feng@cypress.com, kvalo@codeaurora.org, davem@davemloft.net
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'pih' is known to be non-NULL at this point, so the test can be removed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 080e829da9b3..6bb34a12a94b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -1816,8 +1816,7 @@ void brcms_b_phy_reset(struct brcms_hardware *wlc_hw)
 	udelay(2);
 	brcms_b_core_phy_clk(wlc_hw, ON);
 
-	if (pih)
-		wlc_phy_anacore(pih, ON);
+	wlc_phy_anacore(pih, ON);
 }
 
 /* switch to and initialize new band */
-- 
2.20.1
