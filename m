From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Oct 2018 08:05:34 +0000
Subject: [PATCH 2/2] mfd: ab8500-core: Return zero in get_register_interruptible()
Message-Id: <20181018080534.yw2crvhguen5vajg@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

I just noticed this in review.  The get_register_interruptible() should
return zero on success but it instead returns the value that it read.

I looked at all the places that called this directly and they check for
negatives and treat greater than or equal to zero as success.  This
function is also called as the ->get_register() function pointer.  Some
of the callers of that treat all non-zero returns as errors, so it's
possible that this bug causes some problems in real life.

I could not find any callers that rely on the current behavior, and this
makes the function align with the get_register_interruptible() in
ab3100-core.c.

Fixes: 47c1697508f2 ("mfd: Align ab8500 with the abx500 interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mfd/ab8500-core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 30d09d177171..66458a329127 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -252,16 +252,18 @@ static int get_register_interruptible(struct ab8500 *ab8500, u8 bank,
 	mutex_lock(&ab8500->lock);
 
 	ret = ab8500->read(ab8500, addr);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(ab8500->dev, "failed to read reg %#x: %d\n",
 			addr, ret);
-	else
-		*value = ret;
+		return ret;
+	}
+
+	*value = ret;
 
 	mutex_unlock(&ab8500->lock);
 	dev_vdbg(ab8500->dev, "rd: addr %#x => data %#x\n", addr, ret);
 
-	return ret;
+	return 0;
 }
 
 static int ab8500_get_register(struct device *dev, u8 bank,
-- 
2.11.0
