From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 03 Oct 2012 16:17:58 +0000
Subject: [PATCH 9/20] drivers/net/irda/sa1100_ir.c: fix error return code
Message-Id: <1349281090-10013-8-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: samuel@sortiz.org
Cc: kernel-janitors@vger.kernel.org, irda-users@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/net/irda/sa1100_ir.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/irda/sa1100_ir.c b/drivers/net/irda/sa1100_ir.c
index e250675..42fde9e 100644
--- a/drivers/net/irda/sa1100_ir.c
+++ b/drivers/net/irda/sa1100_ir.c
@@ -940,8 +940,10 @@ static int sa1100_irda_probe(struct platform_device *pdev)
 		goto err_mem_3;
 
 	dev = alloc_irdadev(sizeof(struct sa1100_irda));
-	if (!dev)
+	if (!dev) {
+		err = -ENOMEM;
 		goto err_mem_4;
+	}
 
 	SET_NETDEV_DEV(dev, &pdev->dev);
 

