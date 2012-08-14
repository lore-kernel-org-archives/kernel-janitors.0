From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 14 Aug 2012 06:47:34 +0000
Subject: [PATCH 1/5] drivers/usb/gadget/s3c-hsotg.c: fix error return code
Message-Id: <1344926858-1162-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344926858-1162-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344926858-1162-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert a 0 error return code to a negative one, as returned elsewhere in the
function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret;
expression e,e1,e2,e3,e4,x;
@@

(
if (\(ret != 0\|ret < 0\) || ...) { ... return ...; }
|
ret = 0
)
... when != ret = e1
*x = \(kmalloc\|kzalloc\|kcalloc\|devm_kzalloc\|ioremap\|ioremap_nocache\|devm_ioremap\|devm_ioremap_nocache\)(...);
... when != x = e2
    when != ret = e3
*if (x = NULL || ...)
{
  ... when != ret = e4
*  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/gadget/s3c-hsotg.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index b13e0bb..0bb617e 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -3599,6 +3599,7 @@ static int __devinit s3c_hsotg_probe(struct platform_device *pdev)
 
 	if (hsotg->num_of_eps = 0) {
 		dev_err(dev, "wrong number of EPs (zero)\n");
+		ret = -EINVAL;
 		goto err_supplies;
 	}
 
@@ -3606,6 +3607,7 @@ static int __devinit s3c_hsotg_probe(struct platform_device *pdev)
 		      GFP_KERNEL);
 	if (!eps) {
 		dev_err(dev, "cannot get memory\n");
+		ret = -ENOMEM;
 		goto err_supplies;
 	}
 
@@ -3622,6 +3624,7 @@ static int __devinit s3c_hsotg_probe(struct platform_device *pdev)
 						     GFP_KERNEL);
 	if (!hsotg->ctrl_req) {
 		dev_err(dev, "failed to allocate ctrl req\n");
+		ret = -ENOMEM;
 		goto err_ep_mem;
 	}
 

