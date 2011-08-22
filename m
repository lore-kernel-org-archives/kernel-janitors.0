From: Julia Lawall <julia@diku.dk>
Date: Mon, 22 Aug 2011 14:00:35 +0000
Subject: [PATCH 3/4] drivers/usb/host/ohci-omap3.c: test the just-initialized value
Message-Id: <1314021636-11528-3-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>
Cc: kernel-janitors@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Test the just-initialized value rather than some other one.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier x,y,f!={PTR_ERR,ERR_PTR,ERR_CAST};
statement S;
@@

x = f(...);
(
if (\(x = NULL\|IS_ERR(x)\)) S
|
*if (\(y = NULL\|IS_ERR(y)\))
 { ... when != x
   return ...; }
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/host/ohci-omap3.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-omap3.c b/drivers/usb/host/ohci-omap3.c
index 6048f2f..853ad8d 100644
--- a/drivers/usb/host/ohci-omap3.c
+++ b/drivers/usb/host/ohci-omap3.c
@@ -149,7 +149,7 @@ static int __devinit ohci_hcd_omap3_probe(struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev,
 				IORESOURCE_MEM, "ohci");
-	if (!ret) {
+	if (!res) {
 		dev_err(dev, "UHH OHCI get resource failed\n");
 		return -ENOMEM;
 	}

