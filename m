From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 14:35:12 +0000
Subject: [PATCH 05/34] [media] DaVinci-VPBE: Return an error code only as a constant in vpbe_probe()
Message-Id: <a73b4879-7f45-f863-fb11-73878d40674d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
In-Reply-To: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Oct 2016 13:43:25 +0200

* Return an error code without storing it in an intermediate variable.

* Delete the local variable "ret" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpbe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/davinci/vpbe.c b/drivers/media/platform/davinci/vpbe.c
index 625bddf..4c4cd81 100644
--- a/drivers/media/platform/davinci/vpbe.c
+++ b/drivers/media/platform/davinci/vpbe.c
@@ -821,7 +821,6 @@ static int vpbe_probe(struct platform_device *pdev)
 {
 	struct vpbe_device *vpbe_dev;
 	struct vpbe_config *cfg;
-	int ret = -EINVAL;
 
 	if (!pdev->dev.platform_data) {
 		v4l2_err(pdev->dev.driver, "No platform data\n");
@@ -834,7 +833,7 @@ static int vpbe_probe(struct platform_device *pdev)
 	    !cfg->venc.module_name[0]) {
 		v4l2_err(pdev->dev.driver,
 			 "vpbe display module names not defined\n");
-		return ret;
+		return -EINVAL;
 	}
 
 	vpbe_dev = kzalloc(sizeof(*vpbe_dev), GFP_KERNEL);
-- 
2.10.1

