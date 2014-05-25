From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Date: Sun, 25 May 2014 17:59:36 +0000
Subject: [PATCH] mwifiex: use time_after()
Message-Id: <1401040776-13711-1-git-send-email-manuel.schoelling@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: bzhao@marvell.com
Cc: linville@tuxdriver.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>

To be future-proof and for better readability the time comparisons are
modified to use time_after() instead of plain, error-prone math.

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
---
 drivers/net/wireless/mwifiex/main.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mwifiex/main.h b/drivers/net/wireless/mwi=
fiex/main.h
index d53e1e8..3191066 100644
--- a/drivers/net/wireless/mwifiex/main.h
+++ b/drivers/net/wireless/mwifiex/main.h
@@ -1101,7 +1101,7 @@ mwifiex_11h_get_csa_closed_channel(struct mwifiex_pri=
vate *priv)
 		return 0;
=20
 	/* Clear csa channel, if DFS channel move time has passed */
-	if (jiffies > priv->csa_expire_time) {
+	if (time_after(jiffies, priv->csa_expire_time)) {
 		priv->csa_chan =3D 0;
 		priv->csa_expire_time =3D 0;
 	}
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
