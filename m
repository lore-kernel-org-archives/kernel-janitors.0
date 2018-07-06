From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Jul 2018 08:39:21 +0000
Subject: [PATCH] Staging: Gasket: shift wrapping bug in gasket_read_modify_write_64()
Message-Id: <20180706083921.nzicmo757ybxx7mj@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This function only has one caller so mask_width is 1 and mask_shift is
32.  Shifting an int by 32 bits is undefined, but I guess on GCC it
wraps to 0x1?  Anyway it's supposed to be 0x100000000.

Fixes: 9a69f5087ccc ("drivers/staging: Gasket driver framework + Apex driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gasket/gasket_core.h b/drivers/staging/gasket/gasket_core.h
index 203b9a31377b..5d6535a0f254 100644
--- a/drivers/staging/gasket/gasket_core.h
+++ b/drivers/staging/gasket/gasket_core.h
@@ -683,7 +683,7 @@ static inline void gasket_read_modify_write_64(
 	u64 mask, tmp;
 
 	tmp = gasket_dev_read_64(dev, bar, location);
-	mask = ((1 << mask_width) - 1) << mask_shift;
+	mask = ((1ULL << mask_width) - 1) << mask_shift;
 	tmp = (tmp & ~mask) | (value << mask_shift);
 	gasket_dev_write_64(dev, tmp, bar, location);
 }
