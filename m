From: trem <tremyfr@yahoo.fr>
Date: Sun, 14 May 2006 21:52:43 +0000
Subject: [KJ] [PATCH] via82cxxx_audio.c : replace pci_find_device by
Message-Id: <4467A6AB.8060901@yahoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4467A460.3030909@yahoo.fr>
In-Reply-To: <4467A460.3030909@yahoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: trem <tremyfr@yahoo.fr>

This patch simply change pci_find_device by pci_get_device, because
pci_find_device is deprecated. This one fix path in the patch.

Signed-Off-By: trem <tremyfr@yahoo.fr>
---
--- linux-2.6-git/sound/oss/via82cxxx_audio.c   2006-05-14 23:47:02.000000000 +0200
+++ linux-2.6-git-trem/sound/oss/via82cxxx_audio.c      2006-05-14 01:13:29.000000000 +0200
@@ -1547,7 +1547,7 @@ static int via_mixer_open (struct inode 
 
        DPRINTK ("ENTER\n");
 
-       while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
+       while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
                drvr = pci_dev_driver (pdev);
                if (drvr = &via_driver) {
                        assert (pci_get_drvdata (pdev) != NULL);
@@ -3245,7 +3245,7 @@ static int via_dsp_open (struct inode *i
        }
 
        card = NULL;
-       while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
+       while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
                drvr = pci_dev_driver (pdev);
                if (drvr = &via_driver) {
                        assert (pci_get_drvdata (pdev) != NULL);



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
