From: Colin King <colin.king@canonical.com>
Date: Tue, 18 Sep 2018 06:54:11 +0000
Subject: [PATCH] usb: phy: mxs: fix spelling mistake "stardard" -> "standard"
Message-Id: <20180918065411.30625-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_dbg message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index e5aa24c1e4fd..1b1bb0ad40c3 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -563,7 +563,7 @@ static enum usb_charger_type mxs_charger_primary_detection(struct mxs_phy *x)
 	regmap_read(regmap, ANADIG_USB1_CHRG_DET_STAT, &val);
 	if (!(val & ANADIG_USB1_CHRG_DET_STAT_CHRG_DETECTED)) {
 		chgr_type = SDP_TYPE;
-		dev_dbg(x->phy.dev, "It is a stardard downstream port\n");
+		dev_dbg(x->phy.dev, "It is a standard downstream port\n");
 	}
 
 	/* Disable charger detector */
-- 
2.17.1
