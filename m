From: girish verma <girish.gcet@gmail.com>
Date: Sun, 06 May 2012 15:17:13 +0000
Subject: [patch] xhci: testing sizeof xhci_doorbell_array 2 time
Message-Id: <CAMC5Lb4bMfqnWuvzcisGNV-uM08vHJMLt8X+mYmOp0P6RzqtrA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org

Testing BUILD_BUG_ON xhci_doorbell_array structure 2 time, redundant statem=
ent

Signed-off-by: Girish Verma <girish.gcet@gmail.com>

=A0---
 drivers/usb/host/xhci.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 36641a7..cfcf733 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4090,7 +4090,6 @@ static int __init xhci_hcd_init(void)
 	BUILD_BUG_ON(sizeof(struct xhci_intr_reg) !=3D 8*32/8);
 	/* xhci_run_regs has eight fields and embeds 128 xhci_intr_regs */
 	BUILD_BUG_ON(sizeof(struct xhci_run_regs) !=3D (8+8*128)*32/8);
-	BUILD_BUG_ON(sizeof(struct xhci_doorbell_array) !=3D 256*32/8);
 	return 0;
 unreg_pci:
 	xhci_unregister_pci();
--
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
