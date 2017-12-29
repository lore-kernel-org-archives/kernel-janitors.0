From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 29 Dec 2017 16:26:24 +0000
Subject: [PATCH 1/3] parport: ax88796: Delete an error message for a failed memory allocation in parport_ax88
Message-Id: <aff62b72-eb6d-5e51-5a59-f0954423aa8b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <68c7b9ec-1d02-3981-8323-f72d1e7fa146@users.sourceforge.net>
In-Reply-To: <68c7b9ec-1d02-3981-8323-f72d1e7fa146@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 29 Dec 2017 17:00:14 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/parport/parport_ax88796.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/parport/parport_ax88796.c b/drivers/parport/parport_ax88796.c
index 2fc91edb058d..ef0aec4b55f3 100644
--- a/drivers/parport/parport_ax88796.c
+++ b/drivers/parport/parport_ax88796.c
@@ -281,10 +281,8 @@ static int parport_ax88796_probe(struct platform_device *pdev)
 	int ret;
 
 	dd = kzalloc(sizeof(struct ax_drvdata), GFP_KERNEL);
-	if (dd = NULL) {
-		dev_err(_dev, "no memory for private data\n");
+	if (!dd)
 		return -ENOMEM;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res = NULL) {
-- 
2.15.1

