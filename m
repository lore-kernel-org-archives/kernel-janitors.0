From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Mar 2019 14:16:09 +0000
Subject: [PATCH] i2c: nomadik: remove an unnecessary NULL check in nmk_i2c_remove()
Message-Id: <20190328141609.GL32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"res" can't be NULL because it's a pointer to somewhere in the middle of
the "adev" struct.  Also probe() succeeded so there is no need to check
here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 0ed5a41804dc..4f30a43b63da 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1070,8 +1070,7 @@ static int nmk_i2c_remove(struct amba_device *adev)
 	/* disable the controller */
 	i2c_clr_bit(dev->virtbase + I2C_CR, I2C_CR_PE);
 	clk_disable_unprepare(dev->clk);
-	if (res)
-		release_mem_region(res->start, resource_size(res));
+	release_mem_region(res->start, resource_size(res));
 
 	return 0;
 }
-- 
2.17.1
