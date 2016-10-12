From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:20:22 +0000
Subject: [patch] staging: android/ion: testing the wrong variable
Message-Id: <20161012062022.GR12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We're testing "pdev" but we intended to test "heap_pdev".  This is a
static checker fix and it's unlikely that anyone is affected by this
bug.

Fixes: 13439479c7de ('staging: ion: Add files for parsing the devicetree')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/android/ion/ion_of.c b/drivers/staging/android/ion/ion_of.c
index 15bac92..46b2bb9 100644
--- a/drivers/staging/android/ion/ion_of.c
+++ b/drivers/staging/android/ion/ion_of.c
@@ -107,7 +107,7 @@ struct ion_platform_data *ion_parse_dt(struct platform_device *pdev,
 
 		heap_pdev = of_platform_device_create(node, heaps[i].name,
 						      &pdev->dev);
-		if (!pdev)
+		if (!heap_pdev)
 			return ERR_PTR(-ENOMEM);
 		heap_pdev->dev.platform_data = &heaps[i];
 
