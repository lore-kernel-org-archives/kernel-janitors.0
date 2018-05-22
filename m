From: Colin King <colin.king@canonical.com>
Date: Tue, 22 May 2018 16:49:05 +0000
Subject: [PATCH] staging: wilc1000: fix spelling mistake: "Preamle" -> "Preamble"
Message-Id: <20180522164905.10874-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aditya Shankar <aditya.shankar@microchip.com>, Ganesh Krishna <ganesh.krishna@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in netdev_err error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wilc1000/host_interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index a2f82c885d63..7b613cd72d22 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -577,7 +577,7 @@ static void handle_cfg_param(struct wilc_vif *vif, struct cfg_param_attr *param)
 			wid_list[i].size = sizeof(char);
 			hif_drv->cfg_values.preamble_type = preamble_type;
 		} else {
-			netdev_err(vif->ndev, "Preamle Range(0~2) over\n");
+			netdev_err(vif->ndev, "Preamble Range(0~2) over\n");
 			goto unlock;
 		}
 		i++;
-- 
2.17.0

