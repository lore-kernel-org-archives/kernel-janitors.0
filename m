From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 29 Dec 2017 16:27:21 +0000
Subject: [PATCH 2/3] parport: ax88796: Improve a size determination in parport_ax88796_probe()
Message-Id: <3f682a30-3584-067b-3e61-ff510ba9c85e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <68c7b9ec-1d02-3981-8323-f72d1e7fa146@users.sourceforge.net>
In-Reply-To: <68c7b9ec-1d02-3981-8323-f72d1e7fa146@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 29 Dec 2017 17:03:30 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/parport/parport_ax88796.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parport/parport_ax88796.c b/drivers/parport/parport_ax88796.c
index ef0aec4b55f3..09788d8cf467 100644
--- a/drivers/parport/parport_ax88796.c
+++ b/drivers/parport/parport_ax88796.c
@@ -280,7 +280,7 @@ static int parport_ax88796_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	dd = kzalloc(sizeof(struct ax_drvdata), GFP_KERNEL);
+	dd = kzalloc(sizeof(*dd), GFP_KERNEL);
 	if (!dd)
 		return -ENOMEM;
 
-- 
2.15.1

