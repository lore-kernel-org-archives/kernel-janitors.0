From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 13:17:56 +0000
Subject: [PATCH] mmc: atmel-mci: Delete an error message for a failed memory allocation in atmci_of_init()
Message-Id: <199b33a2-6722-fba1-e7ec-5ac016c5bad0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mmc@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 15:05:28 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mmc/host/atmel-mci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 388e4a3f13e6..584247464eb8 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -667,10 +667,8 @@ atmci_of_init(struct platform_device *pdev)
 	}
 
 	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(&pdev->dev, "could not allocate memory for pdata\n");
+	if (!pdata)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	for_each_child_of_node(np, cnp) {
 		if (of_property_read_u32(cnp, "reg", &slot_id)) {
-- 
2.12.3

