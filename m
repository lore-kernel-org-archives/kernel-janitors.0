From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Dec 2020 19:34:11 +0000
Subject: [PATCH] remoteproc: fix spelling mistake "Peripherial" -> "Peripherial" in Kconfig
Message-Id: <20201204193411.1152006-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/remoteproc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index d99548fb5dde..d45be05640ea 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -183,7 +183,7 @@ config QCOM_Q6V5_PAS
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
-	  Say y here to support the TrustZone based Peripherial Image Loader
+	  Say y here to support the TrustZone based Peripheral Image Loader
 	  for the Qualcomm Hexagon v5 based remote processors. This is commonly
 	  used to control subsystems such as ADSP, Compute and Sensor.
 
-- 
2.29.2
