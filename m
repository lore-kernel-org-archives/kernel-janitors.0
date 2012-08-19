From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 19 Aug 2012 08:44:25 +0000
Subject: [PATCH 12/14] drivers/spi/spi-coldfire-qspi.c: fix error return code
Message-Id: <1345365870-29831-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345365870-29831-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

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
 drivers/spi/spi-coldfire-qspi.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-coldfire-qspi.c b/drivers/spi/spi-coldfire-qspi.c
index b2d4b9e..7889796 100644
--- a/drivers/spi/spi-coldfire-qspi.c
+++ b/drivers/spi/spi-coldfire-qspi.c
@@ -462,6 +462,7 @@ static int __devinit mcfqspi_probe(struct platform_device *pdev)
 	pdata = pdev->dev.platform_data;
 	if (!pdata) {
 		dev_dbg(&pdev->dev, "platform data is missing\n");
+		status = -EINVAL;
 		goto fail4;
 	}
 	master->bus_num = pdata->bus_num;

