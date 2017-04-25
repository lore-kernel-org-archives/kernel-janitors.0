From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 12:46:31 +0000
Subject: [PATCH 2/2] HSI: core: Use kcalloc() in two functions
Message-Id: <921ba1f4-132c-18b6-f5ff-99b9f3e562d9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <52f7db50-a3a0-6bc5-a39f-1d235a5945cd@users.sourceforge.net>
In-Reply-To: <52f7db50-a3a0-6bc5-a39f-1d235a5945cd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>, Carlos Chinea <carlos.chinea@nokia.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sre@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 14:17:50 +0200

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hsi/hsi_core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hsi/hsi_core.c b/drivers/hsi/hsi_core.c
index c2a2a9795b0b..9065efd21851 100644
--- a/drivers/hsi/hsi_core.c
+++ b/drivers/hsi/hsi_core.c
@@ -267,14 +267,13 @@ static void hsi_add_client_from_dt(struct hsi_port *port,
 
 	cl->rx_cfg.num_channels = cells;
 	cl->tx_cfg.num_channels = cells;
-
-	cl->rx_cfg.channels = kzalloc(cells * sizeof(channel), GFP_KERNEL);
+	cl->rx_cfg.channels = kcalloc(cells, sizeof(channel), GFP_KERNEL);
 	if (!cl->rx_cfg.channels) {
 		err = -ENOMEM;
 		goto err;
 	}
 
-	cl->tx_cfg.channels = kzalloc(cells * sizeof(channel), GFP_KERNEL);
+	cl->tx_cfg.channels = kcalloc(cells, sizeof(channel), GFP_KERNEL);
 	if (!cl->tx_cfg.channels) {
 		err = -ENOMEM;
 		goto err2;
@@ -485,7 +484,7 @@ struct hsi_controller *hsi_alloc_controller(unsigned int n_ports, gfp_t flags)
 	hsi = kzalloc(sizeof(*hsi), flags);
 	if (!hsi)
 		return NULL;
-	port = kzalloc(sizeof(*port)*n_ports, flags);
+	port = kcalloc(n_ports, sizeof(*port), flags);
 	if (!port) {
 		kfree(hsi);
 		return NULL;
-- 
2.12.2

