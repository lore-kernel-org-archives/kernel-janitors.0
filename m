From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 07:45:39 +0000
Subject: [patch] USB: make hcd->irq signed for error handling
Message-Id: <20131107074538.GE21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a bug in ehci_msm_probe() where we do:

	hcd->irq = platform_get_irq(pdev, 0);
	if (hcd->irq < 0) {

The problem is that hcd->irq is unsigned so the error handling doesn't
work.  I have made it signed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index b8aba19..95be4a0 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -143,7 +143,7 @@ struct usb_hcd {
 	unsigned		has_tt:1;	/* Integrated TT in root hub */
 	unsigned		amd_resume_bug:1; /* AMD remote wakeup quirk */
 
-	unsigned int		irq;		/* irq allocated */
+	int			irq;		/* irq allocated */
 	void __iomem		*regs;		/* device memory/io */
 	resource_size_t		rsrc_start;	/* memory/io resource start */
 	resource_size_t		rsrc_len;	/* memory/io resource length */
