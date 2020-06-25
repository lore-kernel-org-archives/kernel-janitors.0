From: Colin King <colin.king@canonical.com>
Date: Thu, 25 Jun 2020 12:44:28 +0000
Subject: [PATCH] phy: sun4i-usb: fix dereference of pointer phy0 before it is null checked
Message-Id: <20200625124428.83564-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzk@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently pointer phy0 is being dereferenced via the assignment of
phy on the call to phy_get_drvdata before phy0 is null checked, this
can lead to a null pointer dereference. Fix this by performing the
null check on phy0 before the call to phy_get_drvdata. Also replace
the phy0 = NULL check with the more usual !phy0 idiom.

Addresses-Coverity: ("Dereference before null check")
Fixes: e6f32efb1b12 ("phy: sun4i-usb: Make sure to disable PHY0 passby for peripheral mode")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 7e09ad6a0b42..f7a59a75df1a 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -545,13 +545,14 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	struct sun4i_usb_phy_data *data  		container_of(work, struct sun4i_usb_phy_data, detect.work);
 	struct phy *phy0 = data->phys[0].phy;
-	struct sun4i_usb_phy *phy = phy_get_drvdata(phy0);
+	struct sun4i_usb_phy *phy;
 	bool force_session_end, id_notify = false, vbus_notify = false;
 	int id_det, vbus_det;
 
-	if (phy0 = NULL)
+	if (!phy0)
 		return;
 
+	phy = phy_get_drvdata(phy0);
 	id_det = sun4i_usb_phy0_get_id_det(data);
 	vbus_det = sun4i_usb_phy0_get_vbus_det(data);
 
-- 
2.27.0
