From: Colin King <colin.king@canonical.com>
Date: Thu, 26 Nov 2020 22:40:29 +0000
Subject: [PATCH] nvmet: Kconfig: Fix spelling mistake "incuding" -> "including"
Message-Id: <20201126224029.13527-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>, linux-nvme@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nvme/target/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/Kconfig b/drivers/nvme/target/Kconfig
index 8056955e652c..4be2ececbc45 100644
--- a/drivers/nvme/target/Kconfig
+++ b/drivers/nvme/target/Kconfig
@@ -24,7 +24,7 @@ config NVME_TARGET_PASSTHRU
 	  This enables target side NVMe passthru controller support for the
 	  NVMe Over Fabrics protocol. It allows for hosts to manage and
 	  directly access an actual NVMe controller residing on the target
-	  side, incuding executing Vendor Unique Commands.
+	  side, including executing Vendor Unique Commands.
 
 	  If unsure, say N.
 
-- 
2.29.2
