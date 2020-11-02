From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Nov 2020 07:56:55 +0000
Subject: [PATCH] usb: misc: brcmstb-usb-pinmap: Fix an IS_ERR() vs NULL check
Message-Id: <20201102075655.GA4163205@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Cooper <alcooperx@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

The devm_ioremap() function doesn't return error pointers, it returns
NULL on error.

Fixes: 517c4c44b323 ("usb: Add driver to allow any GPIO to be used for 7211 USB signals")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The commit original commit "usb: Add driver to allow any GPIO to ..."
has a bad subsystem prefix.  This is a common anti-pattern for new
drivers.  (Although less common after I started whinging to everyone
about it).  It means that the first person to fix a bug in the driver
has to imagine what the original author wanted.  Sometimes people get
annoyed which prefix we pick for them.

 drivers/usb/misc/brcmstb-usb-pinmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/brcmstb-usb-pinmap.c b/drivers/usb/misc/brcmstb-usb-pinmap.c
index 02144c39aaba..2326e60545f7 100644
--- a/drivers/usb/misc/brcmstb-usb-pinmap.c
+++ b/drivers/usb/misc/brcmstb-usb-pinmap.c
@@ -277,8 +277,8 @@ static int __init brcmstb_usb_pinmap_probe(struct platform_device *pdev)
 	pdata->out_pins = (struct out_pin *)(pdata->in_pins + in_count);
 
 	pdata->regs = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (IS_ERR(pdata->regs))
-		return PTR_ERR(pdata->regs);
+	if (!pdata->regs)
+		return -ENOMEM;
 	platform_set_drvdata(pdev, pdata);
 
 	err = parse_pins(&pdev->dev, dn, pdata);
-- 
2.28.0
