From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 29 Dec 2017 16:28:41 +0000
Subject: [PATCH 3/3] parport: ax88796: Delete an unnecessary variable initialisation in parport_ax88796_probe
Message-Id: <ad4acd77-f807-277c-5ec4-ba561f81eaf4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <68c7b9ec-1d02-3981-8323-f72d1e7fa146@users.sourceforge.net>
In-Reply-To: <68c7b9ec-1d02-3981-8323-f72d1e7fa146@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 29 Dec 2017 17:08:47 +0100

The local variable "pp" will eventually be set to an appropriate pointer
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/parport/parport_ax88796.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parport/parport_ax88796.c b/drivers/parport/parport_ax88796.c
index 09788d8cf467..bfe97c2a8d4c 100644
--- a/drivers/parport/parport_ax88796.c
+++ b/drivers/parport/parport_ax88796.c
@@ -273,7 +273,7 @@ static int parport_ax88796_probe(struct platform_device *pdev)
 {
 	struct device *_dev = &pdev->dev;
 	struct ax_drvdata *dd;
-	struct parport *pp = NULL;
+	struct parport *pp;
 	struct resource *res;
 	unsigned long size;
 	int spacing;
-- 
2.15.1

