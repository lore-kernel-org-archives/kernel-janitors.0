From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 18:37:14 +0000
Subject: [PATCH 2/3] uio: Return directly after a failed kzalloc() in uio_dmem_genirq_probe()
Message-Id: <b6158483-3ace-d787-87f2-7ff51c889dc9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2efe226c-065a-b77d-d278-4345ab2586b1@users.sourceforge.net>
In-Reply-To: <2efe226c-065a-b77d-d278-4345ab2586b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Dec 2017 19:11:49 +0100

* Return directly after a call of the function "kzalloc" failed
  in an if branch.

* Delete the jump label "bad2" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/uio/uio_dmem_genirq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/uio/uio_dmem_genirq.c b/drivers/uio/uio_dmem_genirq.c
index b7b0acd1bf01..4f230ce8b861 100644
--- a/drivers/uio/uio_dmem_genirq.c
+++ b/drivers/uio/uio_dmem_genirq.c
@@ -158,10 +158,9 @@ static int uio_dmem_genirq_probe(struct platform_device *pdev)
 
 		/* alloc uioinfo for one device */
 		uioinfo = kzalloc(sizeof(*uioinfo), GFP_KERNEL);
-		if (!uioinfo) {
-			ret = -ENOMEM;
-			goto bad2;
-		}
+		if (!uioinfo)
+			return -ENOMEM;
+
 		uioinfo->name = pdev->dev.of_node->name;
 		uioinfo->version = "devicetree";
 
@@ -285,7 +284,7 @@ static int uio_dmem_genirq_probe(struct platform_device *pdev)
 	/* kfree uioinfo for OF */
 	if (pdev->dev.of_node)
 		kfree(uioinfo);
- bad2:
+
 	return ret;
 }
 
-- 
2.15.1

