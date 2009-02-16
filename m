From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 16 Feb 2009 09:54:38 +0000
Subject: [PATCH] drivers/net/sfc: fix sparse warnings: Should it be static?
Message-Id: <20090216095351.391.49056.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0902160138n255616a0xb963dfd990d912b@mail.gmail.com>
In-Reply-To: <154e089b0902160138n255616a0xb963dfd990d912b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Ben Hutchings <bhutchings@solarflare.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Include the header file.  If CONFIG_SFC_MTD is not defined
then the functions 'efx_mtd_remove' and 'efx_mtd_rename' are defined
'static inline' with an empty function body in the header file, but
the the whole file mtd.c is not built in this case.

Fix this sparse warnings:
  drivers/net/sfc/mtd.c:204:6: warning: symbol 'efx_mtd_remove' was not declared. Should it be static?
  drivers/net/sfc/mtd.c:221:6: warning: symbol 'efx_mtd_rename' was not declared. Should it be static?
  drivers/net/sfc/mtd.c:230:5: warning: symbol 'efx_mtd_probe' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/sfc/mtd.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/sfc/mtd.c b/drivers/net/sfc/mtd.c
index 665cafb..820c233 100644
--- a/drivers/net/sfc/mtd.c
+++ b/drivers/net/sfc/mtd.c
@@ -15,6 +15,7 @@
 #define EFX_DRIVER_NAME "sfc_mtd"
 #include "net_driver.h"
 #include "spi.h"
+#include "efx.h"
 
 #define EFX_SPI_VERIFY_BUF_LEN 16
 

