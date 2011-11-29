From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Tue, 29 Nov 2011 18:38:38 +0000
Subject: [PATCH] mfd: tc6393xb - add depend on HAVE_CLK
Message-Id: <1322591918.2182.35.camel@mars>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Dmitry Baryshkov <dbaryshkov@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This patch adds HAVE_CLK to the required dependencies of tc6393xb.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/mfd/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index f1391c2..833ed2c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -311,7 +311,7 @@ config MFD_TC6387XB
 
 config MFD_TC6393XB
 	bool "Support Toshiba TC6393XB"
-	depends on GPIOLIB && ARM
+	depends on GPIOLIB && ARM && HAVE_CLK
 	select MFD_CORE
 	select MFD_TMIO
 	help
-- 
1.7.2.5



