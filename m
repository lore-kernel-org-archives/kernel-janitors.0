From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 19 Aug 2019 03:37:47 +0000
Subject: [PATCH v2 linux-next] qcom: qcs404: move COMPILE_TEST to INTERCONNECT_QCOM
Message-Id: <20190819033747.38339-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190818010905.7AD602173B@mail.kernel.org>
In-Reply-To: <20190818010905.7AD602173B@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: agross@kernel.org, georgi.djakov@linaro.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, sboyd@kernel.org
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
Fix this by moving COMPILE_TEST from CONFIG_INTERCONNECT_QCOM_QCS404 to
CONFIG_INTERCONNECT_QCOM, qcom's interconnect drivers can be compiled on
different platform.

Fixes: 5e4e6c4d3ae0 ("interconnect: qcom: Add QCS404 interconnect provider driver")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v2: change subject of patch, and move COMPILE_TEST to INTERCONNECT_QCOM.
 drivers/interconnect/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 339e8f1..7207248 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -1,14 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config INTERCONNECT_QCOM
 	bool "Qualcomm Network-on-Chip interconnect drivers"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for Qualcomm's Network-on-Chip interconnect hardware.
 
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
