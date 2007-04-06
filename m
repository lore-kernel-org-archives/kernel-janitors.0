From: Borislav Petkov <petkov@math.uni-muenster.de>
Date: Fri, 06 Apr 2007 07:44:24 +0000
Subject: [KJ] [PATCH 4/5] Fix warnings when building 'xmldocs' target:
Message-Id: <20070406074424.GA4870@gollum.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Signed-off-by: Borislav Petkov <bbpetkov@yahoo.de>

--- kernel.orig/20-rc5/drivers/pci/pci.c	2007-04-05 09:33:57.000000000 +0200
+++ kernel/20-rc5/drivers/pci/pci.c	2007-04-05 09:34:01.000000000 +0200
@@ -1271,7 +1271,7 @@
=20
 /**
  * pci_msi_off - disables any msi or msix capabilities
- * @pdev: the PCI device to operate on
+ * @dev: the PCI device to operate on
  *
  * If you want to use msi see pci_enable_msi and friends.
  * This is a lower level primitive that allows us to disable

--=20
Regards/Gru=DF,
    Boris.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
