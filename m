From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Feb 2011 17:01:36 +0000
Subject: [patch] usb: fusb300_udc: add more "ep%d" names
Message-Id: <20110207170136.GH4384@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need FUSB300_MAX_NUM_EP (16) names otherwise the last 8 names get
initialized to garbage values in fusb300_probe().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/usb/gadget/fusb300_udc.c b/drivers/usb/gadget/fusb300_udc.c
index fd4fd69..763d462 100644
--- a/drivers/usb/gadget/fusb300_udc.c
+++ b/drivers/usb/gadget/fusb300_udc.c
@@ -38,7 +38,8 @@ MODULE_ALIAS("platform:fusb300_udc");
 
 static const char udc_name[] = "fusb300_udc";
 static const char * const fusb300_ep_name[] = {
-	"ep0", "ep1", "ep2", "ep3", "ep4", "ep5", "ep6", "ep7"
+	"ep0", "ep1", "ep2", "ep3", "ep4", "ep5", "ep6", "ep7", "ep8", "ep9",
+	"ep10", "ep11", "ep12", "ep13", "ep14", "ep15"
 };
 
 static void done(struct fusb300_ep *ep, struct fusb300_request *req,
