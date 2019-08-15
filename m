From: Mao Wenan <maowenan@huawei.com>
Date: Thu, 15 Aug 2019 07:48:48 +0000
Subject: [PATCH linux-next] qcom: qcs404: remove COMPILE_TEST from CONFIG_INTERCONNECT_QCOM_QCS404
Message-Id: <20190815074848.195806-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: agross@kernel.org, georgi.djakov@linaro.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

There is one compilation error when CONFIG_INTERCONNECT_QCOM_QCS404=y and
CONFIG_INTERCONNECT_QCOM_SMD_RPM=y, as well as CONFIG_COMPILE_TEST=y,
but CONFIG_QCOM_SMD_RPM is not set, logs as below:

drivers/interconnect/qcom/smd-rpm.o: In function `qcom_icc_rpm_smd_send':
smd-rpm.c:(.text+0xe4): undefined reference to `qcom_rpm_smd_write'
Makefile:1071: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

This is because
INTERCONNECT_QCOM_QCS404 depends on QCOM_SMD_RPM || COMPILE_TEST.
Here CONFIG_COMPILE_TEST=y, so CONFIG_INTERCONNECT_QCOM_SMD_RPM
is selected. If CONFIG_QCOM_SMD_RPM is not set, then
qcom_rpm_smd_write() is not defined, and compilation error happen.
Fix this by removing COMPILE_TEST from CONFIG_INTERCONNECT_QCOM_QCS404.

Fixes: 5e4e6c4d3ae0 ("interconnect: qcom: Add QCS404 interconnect provider driver")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/interconnect/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 339e8f1..6ab4012 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -8,7 +8,7 @@ config INTERCONNECT_QCOM
 config INTERCONNECT_QCOM_QCS404
 	tristate "Qualcomm QCS404 interconnect driver"
 	depends on INTERCONNECT_QCOM
-	depends on QCOM_SMD_RPM || COMPILE_TEST
+	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs404-based
-- 
2.7.4
