From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 17:49:41 +0000
Subject: [PATCH 01/10] USB: omap_udc: use resource_size
Message-Id: <1577900990-8588-2-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@ struct resource ptr; @@
- (ptr.end - ptr.start + 1)
+ resource_size(&ptr)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/usb/gadget/udc/omap_udc.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index f36f0730afab..bd12417996db 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -2757,7 +2757,7 @@ static int omap_udc_probe(struct platform_device *pdev)
 
 	/* NOTE:  "knows" the order of the resources! */
 	if (!request_mem_region(pdev->resource[0].start,
-			pdev->resource[0].end - pdev->resource[0].start + 1,
+			resource_size(&pdev->resource[0]),
 			driver_name)) {
 		DBG("request_mem_region failed\n");
 		return -EBUSY;
@@ -2934,7 +2934,7 @@ static int omap_udc_probe(struct platform_device *pdev)
 	}
 
 	release_mem_region(pdev->resource[0].start,
-			pdev->resource[0].end - pdev->resource[0].start + 1);
+			   resource_size(&pdev->resource[0]));
 
 	return status;
 }
@@ -2950,7 +2950,7 @@ static int omap_udc_remove(struct platform_device *pdev)
 	wait_for_completion(&done);
 
 	release_mem_region(pdev->resource[0].start,
-			pdev->resource[0].end - pdev->resource[0].start + 1);
+			   resource_size(&pdev->resource[0]));
 
 	return 0;
 }
