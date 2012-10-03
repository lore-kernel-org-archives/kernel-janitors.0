From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 03 Oct 2012 16:17:57 +0000
Subject: [PATCH 10/20] drivers/net/irda/sh_irda.c: fix error return code
Message-Id: <1349281090-10013-7-git-send-email-peter.senna@gmail.com>
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
 drivers/net/irda/sh_irda.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/irda/sh_irda.c b/drivers/net/irda/sh_irda.c
index eb315b8..4b746d9 100644
--- a/drivers/net/irda/sh_irda.c
+++ b/drivers/net/irda/sh_irda.c
@@ -808,8 +808,8 @@ static int __devinit sh_irda_probe(struct platform_device *pdev)
 		goto err_mem_4;
 
 	platform_set_drvdata(pdev, ndev);
-
-	if (request_irq(irq, sh_irda_irq, IRQF_DISABLED, "sh_irda", self)) {
+	err = request_irq(irq, sh_irda_irq, IRQF_DISABLED, "sh_irda", self);
+	if (err) {
 		dev_warn(&pdev->dev, "Unable to attach sh_irda interrupt\n");
 		goto err_mem_4;
 	}

