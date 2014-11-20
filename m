From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 20 Nov 2014 17:33:58 +0000
Subject: [PATCH 3/7] dwc3: dwc3-keystone: fix error return code
Message-Id: <1416504842-18548-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1416504842-18548-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1416504842-18548-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Return a negative error code on failure.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
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
The patches in this series are independent of each other.

 drivers/usb/dwc3/dwc3-keystone.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
index dd8d2df..fe3b933 100644
--- a/drivers/usb/dwc3/dwc3-keystone.c
+++ b/drivers/usb/dwc3/dwc3-keystone.c
@@ -123,6 +123,7 @@ static int kdwc3_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		dev_err(&pdev->dev, "missing irq\n");
+		error = irq;
 		goto err_irq;
 	}
 

