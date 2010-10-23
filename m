From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 23 Oct 2010 08:25:15 +0000
Subject: [PATCH 2/2] block: cpqarray: fix information leak to userland
Message-Id: <1287822316-14826-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Chirag Kantharia <chirag.kantharia@hp.com>, Jens Axboe <jaxboe@fusionio.com>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>, Kulikov Vasiliy <segooon@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, iss_storagedev@hp.com, linux-kernel@vger.kernel.org

Structure ida_pci_info_struct is copied to userland with some padding
fields unitialized.  It leads to leaking of stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 drivers/block/cpqarray.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/block/cpqarray.c b/drivers/block/cpqarray.c
index 946dad4..8e0e6b4 100644
--- a/drivers/block/cpqarray.c
+++ b/drivers/block/cpqarray.c
@@ -1198,6 +1198,7 @@ out_passthru:
 		ida_pci_info_struct pciinfo;
 
 		if (!arg) return -EINVAL;
+		memset(&pciinfo, 0, sizeof(pciinfo));
 		pciinfo.bus = host->pci_dev->bus->number;
 		pciinfo.dev_fn = host->pci_dev->devfn;
 		pciinfo.board_id = host->board_id;
-- 
1.7.0.4

