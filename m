From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Aug 2013 07:34:10 +0000
Subject: [patch] usb: chipidea: fix a NULL dereference on error
Message-Id: <20130816073410.GB9881@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The regulator_disable() function can't accept NULL pointers so we need
to add a check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index 6f96795..abfb1cc 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -88,7 +88,8 @@ static int host_start(struct ci_hdrc *ci)
 	return ret;
 
 disable_reg:
-	regulator_disable(ci->platdata->reg_vbus);
+	if (ci->platdata->reg_vbus)
+		regulator_disable(ci->platdata->reg_vbus);
 
 put_hcd:
 	usb_put_hcd(hcd);
