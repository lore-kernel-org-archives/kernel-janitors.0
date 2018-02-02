From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 02 Feb 2018 15:01:07 +0000
Subject: [PATCH 1/2] i2c-puv3: Delete an error message for a failed memory allocation in puv3_i2c_probe()
Message-Id: <3bf9bdc5-3bcc-373a-10c3-1d7c77633b5b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2fbd709c-2790-af6c-4fd4-0c8ec6b5b3d7@users.sourceforge.net>
In-Reply-To: <2fbd709c-2790-af6c-4fd4-0c8ec6b5b3d7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-i2c@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 2 Feb 2018 15:41:26 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/i2c/busses/i2c-puv3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-puv3.c b/drivers/i2c/busses/i2c-puv3.c
index 287088b8c4c8..5bd001d01bef 100644
--- a/drivers/i2c/busses/i2c-puv3.c
+++ b/drivers/i2c/busses/i2c-puv3.c
@@ -198,7 +198,6 @@ static int puv3_i2c_probe(struct platform_device *pdev)
 
 	adapter = kzalloc(sizeof(struct i2c_adapter), GFP_KERNEL);
 	if (adapter = NULL) {
-		dev_err(&pdev->dev, "can't allocate interface!\n");
 		rc = -ENOMEM;
 		goto fail_nomem;
 	}
-- 
2.16.1

