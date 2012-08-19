From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 19 Aug 2012 08:44:30 +0000
Subject: [PATCH 14/14] drivers/spi/spi-s3c24xx.c: fix error return code
Message-Id: <1345365870-29831-15-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Initialize return variable before exiting on an error path.

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

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Perhaps -EINVAL is not the right value in this case.

 drivers/spi/spi-s3c24xx.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-s3c24xx.c b/drivers/spi/spi-s3c24xx.c
index 8ee7d79..a2a080b 100644
--- a/drivers/spi/spi-s3c24xx.c
+++ b/drivers/spi/spi-s3c24xx.c
@@ -611,6 +611,7 @@ static int __devinit s3c24xx_spi_probe(struct platform_device *pdev)
 	if (!pdata->set_cs) {
 		if (pdata->pin_cs < 0) {
 			dev_err(&pdev->dev, "No chipselect pin\n");
+			err = -EINVAL;
 			goto err_register;
 		}
 

