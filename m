From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Jan 2014 10:30:01 +0000
Subject: [patch] staging: android: ion: dummy: fix an error code
Message-Id: <20140120103001.GB14233@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should be returning -ENOMEM here instead of zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/android/ion/ion_dummy_driver.c b/drivers/staging/android/ion/ion_dummy_driver.c
index 55b2002753f2..f0d786c539ea 100644
--- a/drivers/staging/android/ion/ion_dummy_driver.c
+++ b/drivers/staging/android/ion/ion_dummy_driver.c
@@ -69,7 +69,7 @@ static int __init ion_dummy_init(void)
 	heaps = kzalloc(sizeof(struct ion_heap *) * dummy_ion_pdata.nr,
 			GFP_KERNEL);
 	if (!heaps)
-		return PTR_ERR(heaps);
+		return -ENOMEM;
 
 
 	/* Allocate a dummy carveout heap */
