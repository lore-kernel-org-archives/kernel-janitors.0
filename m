From: <gregkh@suse.de>
Date: Thu, 08 Jul 2010 18:44:43 +0000
Subject: patch "USB: core: hcd-pci: use for_each_pci_dev()" added to gregkh-2.6 tree
Message-Id: <1278614683204@site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    USB: core: hcd-pci: use for_each_pci_dev()

to my gregkh-2.6 tree which can be found in directory form at:
    http://www.kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/patches/
 and in git form at:
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/patches.git

The filename of this patch is:
    usb-core-hcd-pci-use-for_each_pci_dev.patch

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

If this patch meets the merge guidelines for a bugfix, it should be
merged into Linus's tree before the next major kernel release.
If not, it will be merged into Linus's tree during the next merge window.

Either way, you will probably be copied on the patch when it gets sent
to Linus for merging so that others can see what is happening in kernel
development.

If you have any questions about this process, please let me know.


From segooon@gmail.com  Thu Jul  8 11:37:17 2010
From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat,  3 Jul 2010 20:04:47 +0400
Subject: USB: core: hcd-pci: use for_each_pci_dev()
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Stern <stern@rowland.harvard.edu>, Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <1278173088-12051-1-git-send-email-segooon@gmail.com>


Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 drivers/usb/core/hcd-pci.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -66,10 +66,7 @@ static void companion_common(struct pci_
 	 * vice versa.
 	 */
 	companion = NULL;
-	for (;;) {
-		companion = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, companion);
-		if (!companion)
-			break;
+	for_each_pci_dev(companion) {
 		if (companion->bus != pdev->bus ||
 				PCI_SLOT(companion->devfn) != slot)
 			continue;

