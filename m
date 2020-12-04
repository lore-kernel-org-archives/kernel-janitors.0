From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Dec 2020 19:22:50 +0000
Subject: [PATCH] firmware: fix a spelling mistake "managament" -> "management" in Kconfig
Message-Id: <20201204192250.1151316-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/firmware/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 3315e3c21586..3f14dffb9669 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -51,7 +51,7 @@ config ARM_SCPI_PROTOCOL
 	  provides a mechanism for inter-processor communication between SCP
 	  and AP.
 
-	  SCP controls most of the power managament on the Application
+	  SCP controls most of the power management on the Application
 	  Processors. It offers control and management of: the core/cluster
 	  power states, various power domain DVFS including the core/cluster,
 	  certain system clocks configuration, thermal sensors and many
-- 
2.29.2
