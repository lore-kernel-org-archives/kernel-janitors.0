From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jan 2014 06:50:51 +0000
Subject: [patch] usb: phy: msm: tiny leak on error in probe()
Message-Id: <20140121065051.GA14666@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Free "motog" on error.  This is more to appease the static checkers than
a real worry.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
index 8546c8dccd51..64c9d14ea77d 100644
--- a/drivers/usb/phy/phy-msm-usb.c
+++ b/drivers/usb/phy/phy-msm-usb.c
@@ -1429,7 +1429,8 @@ static int __init msm_otg_probe(struct platform_device *pdev)
 	motg->phy.otg = kzalloc(sizeof(struct usb_otg), GFP_KERNEL);
 	if (!motg->phy.otg) {
 		dev_err(&pdev->dev, "unable to allocate msm_otg\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto free_motg;
 	}
 
 	motg->pdata = dev_get_platdata(&pdev->dev);
