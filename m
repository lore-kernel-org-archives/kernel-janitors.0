From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 May 2018 07:47:56 +0000
Subject: [PATCH] vfio/pci: remove a bogus cast in vfio_msi_set_block()
Message-Id: <20180528074756.bgl5fxvn7foe5uhn@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This cast is confusing...  The "start" variable is an unsigned int.  We
absolutely do not want to cast it to a negative int so why is the cast
there?  It turns out, when you look at the context, it's a no-op and we
can just remove it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
index 1c46045b0e7f..2724fed62129 100644
--- a/drivers/vfio/pci/vfio_pci_intrs.c
+++ b/drivers/vfio/pci/vfio_pci_intrs.c
@@ -368,7 +368,7 @@ static int vfio_msi_set_block(struct vfio_pci_device *vdev, unsigned start,
 	}
 
 	if (ret) {
-		for (--j; j >= (int)start; j--)
+		for (--j; j >= start; j--)
 			vfio_msi_set_vector_signal(vdev, j, -1, msix);
 	}
 
