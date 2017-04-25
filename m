From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 08:43:41 +0000
Subject: [PATCH 3/3] HSI: nokia-modem: Add a space character for better code readability in nokia_modem_probe
Message-Id: <b0aaf824-6d02-12f7-7941-a0906730b633@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <be1a9b8a-bc9f-d96e-04b4-a6edf2dc37c6@users.sourceforge.net>
In-Reply-To: <be1a9b8a-bc9f-d96e-04b4-a6edf2dc37c6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, trivial@kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 10:20:37 +0200

The script "checkpatch.pl" pointed information out like the following.

ERROR: space required before the open parenthesis '('

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hsi/clients/nokia-modem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hsi/clients/nokia-modem.c b/drivers/hsi/clients/nokia-modem.c
index a774ca7839e1..f78cca98266f 100644
--- a/drivers/hsi/clients/nokia-modem.c
+++ b/drivers/hsi/clients/nokia-modem.c
@@ -179,7 +179,7 @@ static int nokia_modem_probe(struct device *dev)
 	}
 	enable_irq_wake(irq);
 
-	if(pm) {
+	if (pm) {
 		err = nokia_modem_gpio_probe(dev);
 		if (err < 0) {
 			dev_err(dev, "Could not probe GPIOs\n");
-- 
2.12.2

