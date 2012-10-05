From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 05 Oct 2012 21:33:02 +0000
Subject: [PATCH 10/20 V2] drivers/net/irda/sh_irda.c: fix error return code
Message-Id: <1349472786-10921-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: samuel@sortiz.org
Cc: irda-users@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

From: Peter Senna Tschudin <peter.senna@gmail.com>

The function sh_irda_probe() return 0 for success and negative value
for most of its internal tests failures. There is one exception
that is error case going to err_mem_4:. For this error case, the
function abort its success execution path, but returns non negative
value, making it difficult for a caller function to notice the error.

This patch fixes the error case that do not return negative value.

This was found by Coccinelle, but the code change was made by hand.
This patch is not robot generated.

A simplified version of the semantic match that finds this problem is
as follows: (http://coccinelle.lip6.fr/)

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
Change from V1:
        Updated commit message. See:
        http://www.kernelhub.org/?p=2&msg9319

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

