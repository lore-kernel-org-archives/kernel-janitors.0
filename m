From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 08:41:19 +0000
Subject: [PATCH 1/3] HSI: nokia-modem: Use devm_kcalloc() in nokia_modem_gpio_probe()
Message-Id: <cfe0f4c9-bf59-8388-9695-20037ead15dc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <be1a9b8a-bc9f-d96e-04b4-a6edf2dc37c6@users.sourceforge.net>
In-Reply-To: <be1a9b8a-bc9f-d96e-04b4-a6edf2dc37c6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 09:49:22 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "devm_kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hsi/clients/nokia-modem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hsi/clients/nokia-modem.c b/drivers/hsi/clients/nokia-modem.c
index c000780d931f..f6c97a0e1fcd 100644
--- a/drivers/hsi/clients/nokia-modem.c
+++ b/drivers/hsi/clients/nokia-modem.c
@@ -102,8 +102,8 @@ static int nokia_modem_gpio_probe(struct device *dev)
 		return -EINVAL;
 	}
 
-	modem->gpios = devm_kzalloc(dev, gpio_count *
-				sizeof(struct nokia_modem_gpio), GFP_KERNEL);
+	modem->gpios = devm_kcalloc(dev, gpio_count, sizeof(*modem->gpios),
+				    GFP_KERNEL);
 	if (!modem->gpios) {
 		dev_err(dev, "Could not allocate memory for gpios\n");
 		return -ENOMEM;
-- 
2.12.2

