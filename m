From: Colin King <colin.king@canonical.com>
Date: Wed, 02 Oct 2019 10:15:17 +0000
Subject: [PATCH] libertas: remove redundant assignment to variable ret
Message-Id: <20191002101517.10836-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned a value that is never read and is
being re-assigned a little later on. The assignment is redundant and hence
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/marvell/libertas/mesh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/libertas/mesh.c b/drivers/net/wireless/marvell/libertas/mesh.c
index 2747c957d18c..44c8a550da4c 100644
--- a/drivers/net/wireless/marvell/libertas/mesh.c
+++ b/drivers/net/wireless/marvell/libertas/mesh.c
@@ -1003,7 +1003,6 @@ static int lbs_add_mesh(struct lbs_private *priv)
 	if (priv->mesh_tlv) {
 		sprintf(mesh_wdev->ssid, "mesh");
 		mesh_wdev->mesh_id_up_len = 4;
-		ret = 1;
 	}
 
 	mesh_wdev->netdev = mesh_dev;
-- 
2.20.1
