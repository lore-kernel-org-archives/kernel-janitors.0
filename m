From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Dec 2020 14:54:40 +0000
Subject: [PATCH] drivers: base: Kconfig: fix spelling mistake "heterogenous" -> "heterogeneous"
Message-Id: <20201215145440.204362-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/base/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 040be48ce046..324aa03fed3c 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -161,7 +161,7 @@ config HMEM_REPORTING
 	default n
 	depends on NUMA
 	help
-	  Enable reporting for heterogenous memory access attributes under
+	  Enable reporting for heterogeneous memory access attributes under
 	  their non-uniform memory nodes.
 
 source "drivers/base/test/Kconfig"
-- 
2.29.2
