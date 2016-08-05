From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 05 Aug 2016 11:26:53 +0000
Subject: [PATCH 02/11 v2] usb: host: fsl-mph-dr-of: use of_property_read_bool
Message-Id: <alpine.DEB.2.10.1608051326210.2999@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr> <1470387411-15879-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470387411-15879-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Use of_property_read_bool to check for the existence of a property.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2,x;
@@
-	if (of_get_property(e1,e2,NULL))
-		x = true;
-	else
-		x = false;
+	x = of_property_read_bool(e1,e2);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: special case for propagating true and false

 drivers/usb/host/fsl-mph-dr-of.c |   18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index 1044b0f..f07ccb2 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -222,23 +222,17 @@ static int fsl_usb2_mph_dr_of_probe(struct platform_device *ofdev)
 	pdata->controller_ver = usb_get_ver_info(np);

 	/* Activate Erratum by reading property in device tree */
-	if (of_get_property(np, "fsl,usb-erratum-a007792", NULL))
-		pdata->has_fsl_erratum_a007792 = 1;
-	else
-		pdata->has_fsl_erratum_a007792 = 0;
-	if (of_get_property(np, "fsl,usb-erratum-a005275", NULL))
-		pdata->has_fsl_erratum_a005275 = 1;
-	else
-		pdata->has_fsl_erratum_a005275 = 0;
+	pdata->has_fsl_erratum_a007792 +		of_property_read_bool(np, "fsl,usb-erratum-a007792");
+	pdata->has_fsl_erratum_a005275 +		of_property_read_bool(np, "fsl,usb-erratum-a005275");

 	/*
 	 * Determine whether phy_clk_valid needs to be checked
 	 * by reading property in device tree
 	 */
-	if (of_get_property(np, "phy-clk-valid", NULL))
-		pdata->check_phy_clk_valid = 1;
-	else
-		pdata->check_phy_clk_valid = 0;
+	pdata->check_phy_clk_valid +		of_property_read_bool(np, "phy-clk-valid");

 	if (pdata->have_sysif_regs) {
 		if (pdata->controller_ver = FSL_USB_VER_NONE) {

