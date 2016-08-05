From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 05 Aug 2016 08:56:42 +0000
Subject: [PATCH 02/11] usb: host: fsl-mph-dr-of: use of_property_read_bool
Message-Id: <1470387411-15879-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
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
expression e1,e2;
statement S2,S1;
@@
-       if (of_get_property(e1,e2,NULL))
+       if (of_property_read_bool(e1,e2))
        S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/host/fsl-mph-dr-of.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index 1044b0f..8bbca74 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -222,11 +222,11 @@ static int fsl_usb2_mph_dr_of_probe(struct platform_device *ofdev)
 	pdata->controller_ver = usb_get_ver_info(np);
 
 	/* Activate Erratum by reading property in device tree */
-	if (of_get_property(np, "fsl,usb-erratum-a007792", NULL))
+	if (of_property_read_bool(np, "fsl,usb-erratum-a007792"))
 		pdata->has_fsl_erratum_a007792 = 1;
 	else
 		pdata->has_fsl_erratum_a007792 = 0;
-	if (of_get_property(np, "fsl,usb-erratum-a005275", NULL))
+	if (of_property_read_bool(np, "fsl,usb-erratum-a005275"))
 		pdata->has_fsl_erratum_a005275 = 1;
 	else
 		pdata->has_fsl_erratum_a005275 = 0;
@@ -235,7 +235,7 @@ static int fsl_usb2_mph_dr_of_probe(struct platform_device *ofdev)
 	 * Determine whether phy_clk_valid needs to be checked
 	 * by reading property in device tree
 	 */
-	if (of_get_property(np, "phy-clk-valid", NULL))
+	if (of_property_read_bool(np, "phy-clk-valid"))
 		pdata->check_phy_clk_valid = 1;
 	else
 		pdata->check_phy_clk_valid = 0;

