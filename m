From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Mar 2010 11:08:56 +0000
Subject: [patch] goku_udc: potential null dereference
Message-Id: <20100306110856.GF4958@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <dbrownell@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Matthias Kaehlcke <matthias@kaehlcke.net>, Harvey Harrison <harvey.harrison@gmail.com>, =?iso-8859-1?Q?N=E9meth_M=E1rton?= <nm127@freemail.hu>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"dev" is always null here.  In the end it's only used to get the 
pci_name() of "pdev" which is redundant information and so I
removed it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/usb/gadget/goku_udc.c b/drivers/usb/gadget/goku_udc.c
index e8edc64..1088d08 100644
--- a/drivers/usb/gadget/goku_udc.c
+++ b/drivers/usb/gadget/goku_udc.c
@@ -1768,7 +1768,7 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	 * usb_gadget_driver_{register,unregister}() must change.
 	 */
 	if (the_controller) {
-		WARNING(dev, "ignoring %s\n", pci_name(pdev));
+		pr_warning("ignoring %s\n", pci_name(pdev));
 		return -EBUSY;
 	}
 	if (!pdev->irq) {
