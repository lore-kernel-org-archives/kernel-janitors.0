From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Sep 2018 10:35:00 +0000
Subject: [PATCH] thermal: armada: fix a test in probe()
Message-Id: <20180919103500.GB9238@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The platform_get_resource() function doesn't return error pointers, it
returns NULL on error.

Fixes: 3d4e51844a4e ("thermal: armada: convert driver to syscon register accesses")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_thermal.c
index 2c2f6d93034e..92f67d40f2e9 100644
--- a/drivers/thermal/armada_thermal.c
+++ b/drivers/thermal/armada_thermal.c
@@ -526,8 +526,8 @@ static int armada_thermal_probe_legacy(struct platform_device *pdev,
 
 	/* First memory region points towards the status register */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (IS_ERR(res))
-		return PTR_ERR(res);
+	if (!res)
+		return -EIO;
 
 	/*
 	 * Edit the resource start address and length to map over all the
