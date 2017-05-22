From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 06:13:37 +0000
Subject: [PATCH 1/2] ieee802154: ca8210: Delete an error message for a failed memory allocation in ca8210_pro
Message-Id: <374015a3-15c9-f799-f26b-3aca91c77c55@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55fddbc7-28c4-8866-67d3-ff1ff1a4eeb7@users.sourceforge.net>
In-Reply-To: <55fddbc7-28c4-8866-67d3-ff1ff1a4eeb7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxdev@cascoda.com, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, Alexander Aring <aar@pengutronix.de>, Harry Morris <h.morris@cascoda.com>, Stefan Schmidt <stefan@osg.samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 07:32:46 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ieee802154/ca8210.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index 25fd3b04b3c0..25ed11bb5ed3 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -3143,10 +3143,6 @@ static int ca8210_probe(struct spi_device *spi_device)
 
 	pdata = kmalloc(sizeof(*pdata), GFP_KERNEL);
 	if (!pdata) {
-		dev_crit(
-			&spi_device->dev,
-			"Could not allocate platform data\n"
-		);
 		ret = -ENOMEM;
 		goto error;
 	}
-- 
2.13.0

