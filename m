From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 11:15:33 +0000
Subject: [PATCH 1/3] HSI: omap_ssi: Use devm_kcalloc() in ssi_add_controller()
Message-Id: <0c285b86-6fe8-2f36-8442-474ded5edc61@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2fa2c33a-dc43-7e03-03d7-7ca04931e6c7@users.sourceforge.net>
In-Reply-To: <2fa2c33a-dc43-7e03-03d7-7ca04931e6c7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 11:20:41 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "devm_kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hsi/controllers/omap_ssi_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hsi/controllers/omap_ssi_core.c b/drivers/hsi/controllers/omap_ssi_core.c
index 9a29b34ed2c8..464db6d33afb 100644
--- a/drivers/hsi/controllers/omap_ssi_core.c
+++ b/drivers/hsi/controllers/omap_ssi_core.c
@@ -421,8 +421,8 @@ static int ssi_add_controller(struct hsi_controller *ssi,
 		goto out_err;
 	}
 
-	omap_ssi->port = devm_kzalloc(&ssi->device,
-		sizeof(struct omap_ssi_port *) * ssi->num_ports, GFP_KERNEL);
+	omap_ssi->port = devm_kcalloc(&ssi->device, ssi->num_ports,
+				      sizeof(*omap_ssi->port), GFP_KERNEL);
 	if (!omap_ssi->port) {
 		err = -ENOMEM;
 		goto out_err;
-- 
2.12.2

