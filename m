From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 06 Sep 2012 15:23:50 +0000
Subject: [PATCH 11/14] drivers/media/usb/stk1160/stk1160-i2c.c: fix error return code
Message-Id: <1346945041-26676-3-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/usb/stk1160/stk1160-i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/stk1160/stk1160-i2c.c b/drivers/media/usb/stk1160/stk1160-i2c.c
index 176ac93..850cf28 100644
--- a/drivers/media/usb/stk1160/stk1160-i2c.c
+++ b/drivers/media/usb/stk1160/stk1160-i2c.c
@@ -116,7 +116,7 @@ static int stk1160_i2c_read_reg(struct stk1160 *dev, u8 addr,
 	if (rc < 0)
 		return rc;
 
-	stk1160_read_reg(dev, STK1160_SBUSR_RD, value);
+	rc = stk1160_read_reg(dev, STK1160_SBUSR_RD, value);
 	if (rc < 0)
 		return rc;
 

