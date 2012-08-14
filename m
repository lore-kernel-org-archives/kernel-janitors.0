From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 14 Aug 2012 12:58:32 +0000
Subject: [PATCH 2/5] drivers/dma/amba-pl08x.c: fix error return code
Message-Id: <1344949115-13266-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344949115-13266-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344949115-13266-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: kernel-janitors@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org

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
 drivers/dma/amba-pl08x.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 6fbeebb..d1cc579 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -1892,6 +1892,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 	pl08x->pd = dev_get_platdata(&adev->dev);
 	if (!pl08x->pd) {
 		dev_err(&adev->dev, "no platform data supplied\n");
+		ret = -EINVAL;
 		goto out_no_platdata;
 	}
 
@@ -1943,6 +1944,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		dev_err(&adev->dev, "%s failed to allocate "
 			"physical channel holders\n",
 			__func__);
+		ret = -ENOMEM;
 		goto out_no_phychans;
 	}
 

