From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Jun 2013 09:25:16 +0000
Subject: [patch] cpqarray: info leak in ida_locked_ioctl()
Message-Id: <20130603092516.GC16171@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chirag Kantharia <chirag.kantharia@hp.com>
Cc: iss_storagedev@hp.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The pciinfo struct has a two byte hole after ->dev_fn so stack
information could be leaked to the user.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/cpqarray.c b/drivers/block/cpqarray.c
index 639d26b..2b94403 100644
--- a/drivers/block/cpqarray.c
+++ b/drivers/block/cpqarray.c
@@ -1193,6 +1193,7 @@ out_passthru:
 		ida_pci_info_struct pciinfo;
 
 		if (!arg) return -EINVAL;
+		memset(&pciinfo, 0, sizeof(pciinfo));
 		pciinfo.bus = host->pci_dev->bus->number;
 		pciinfo.dev_fn = host->pci_dev->devfn;
 		pciinfo.board_id = host->board_id;
