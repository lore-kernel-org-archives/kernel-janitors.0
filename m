From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Apr 2019 16:33:30 +0000
Subject: [PATCH] staging: wilc1000: fix spelling mistake "dissconect" -> "disconnect"
Message-Id: <20190415163330.28166-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0168c840-e962-53ce-4b30-705a5c80730c@microchip.com>
In-Reply-To: <0168c840-e962-53ce-4b30-705a5c80730c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adham Abozaeid <adham.abozaeid@microchip.com>, Ajay Singh <ajay.kathat@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a netdev_err error message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wilc1000/host_interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index e1a35bb426f9..ed15bd1bcd56 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -774,7 +774,7 @@ int wilc_disconnect(struct wilc_vif *vif)
 	result = wilc_send_config_pkt(vif, WILC_SET_CFG, &wid, 1,
 				      wilc_get_vif_idx(vif));
 	if (result) {
-		netdev_err(vif->ndev, "Failed to send dissconect\n");
+		netdev_err(vif->ndev, "Failed to send disconnect\n");
 		return result;
 	}
 
-- 
2.20.1
