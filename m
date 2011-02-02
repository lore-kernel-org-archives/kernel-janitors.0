From: Vasiliy Kulikov <segoon@openwall.com>
Date: Wed, 02 Feb 2011 18:29:31 +0000
Subject: [PATCH] staging: rts_pstor: potential NULL dereference
Message-Id: <1296671372-1612-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, wwang <wei_wang@realsil.com.cn>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

pci_get_bus_and_slot() may return NULL, but the caller checks
wrong variable.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/staging/rts_pstor/rtsx.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/rts_pstor/rtsx.c b/drivers/staging/rts_pstor/rtsx.c
index 9864b1a..2b18379 100644
--- a/drivers/staging/rts_pstor/rtsx.c
+++ b/drivers/staging/rts_pstor/rtsx.c
@@ -334,7 +334,7 @@ int rtsx_read_pci_cfg_byte(u8 bus, u8 dev, u8 func, u8 offset, u8 *val)
 	u8 devfn = (dev << 3) | func;
 
 	pdev = pci_get_bus_and_slot(bus, devfn);
-	if (!dev)
+	if (!pdev)
 		return -1;
 
 	pci_read_config_byte(pdev, offset, &data);
-- 
1.7.0.4

