From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Nov 2014 14:23:51 +0000
Subject: [PATCH 1/1] USB: PCI-quirks: Deletion of unnecessary checks before the function call "pci_dev_put"
Message-Id: <546F4AF7.1030207@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Nov 2014 15:20:12 +0100

The pci_dev_put() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/host/pci-quirks.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index 2f3aceb..dd483c1 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -233,10 +233,8 @@ commit:
 
 		spin_unlock_irqrestore(&amd_lock, flags);
 
-		if (info.nb_dev)
-			pci_dev_put(info.nb_dev);
-		if (info.smbus_dev)
-			pci_dev_put(info.smbus_dev);
+		pci_dev_put(info.nb_dev);
+		pci_dev_put(info.smbus_dev);
 
 	} else {
 		/* no race - commit the result */
@@ -447,10 +445,8 @@ void usb_amd_dev_put(void)
 
 	spin_unlock_irqrestore(&amd_lock, flags);
 
-	if (nb)
-		pci_dev_put(nb);
-	if (smbus)
-		pci_dev_put(smbus);
+	pci_dev_put(nb);
+	pci_dev_put(smbus);
 }
 EXPORT_SYMBOL_GPL(usb_amd_dev_put);
 
-- 
2.1.3

