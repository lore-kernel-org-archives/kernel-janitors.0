From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 08:42:26 +0000
Subject: [PATCH 2/3] HSI: nokia-modem: Delete error messages for a failed memory allocation in two functions
Message-Id: <72632887-4105-04a6-0f20-fad4a979ff25@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <be1a9b8a-bc9f-d96e-04b4-a6edf2dc37c6@users.sourceforge.net>
In-Reply-To: <be1a9b8a-bc9f-d96e-04b4-a6edf2dc37c6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 10:17:06 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus remove such statements here.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hsi/clients/nokia-modem.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/hsi/clients/nokia-modem.c b/drivers/hsi/clients/nokia-modem.c
index f6c97a0e1fcd..a774ca7839e1 100644
--- a/drivers/hsi/clients/nokia-modem.c
+++ b/drivers/hsi/clients/nokia-modem.c
@@ -104,10 +104,8 @@ static int nokia_modem_gpio_probe(struct device *dev)
 
 	modem->gpios = devm_kcalloc(dev, gpio_count, sizeof(*modem->gpios),
 				    GFP_KERNEL);
-	if (!modem->gpios) {
-		dev_err(dev, "Could not allocate memory for gpios\n");
+	if (!modem->gpios)
 		return -ENOMEM;
-	}
 
 	modem->gpio_amount = gpio_count;
 
@@ -156,10 +154,9 @@ static int nokia_modem_probe(struct device *dev)
 	}
 
 	modem = devm_kzalloc(dev, sizeof(*modem), GFP_KERNEL);
-	if (!modem) {
-		dev_err(dev, "Could not allocate memory for nokia_modem_device\n");
+	if (!modem)
 		return -ENOMEM;
-	}
+
 	dev_set_drvdata(dev, modem);
 	modem->device = dev;
 
-- 
2.12.2

