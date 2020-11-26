From: Colin King <colin.king@canonical.com>
Date: Thu, 26 Nov 2020 23:24:00 +0000
Subject: [PATCH] clk: qcom: Kconfig: Fix spelling mistake "dyanmic" -> "dynamic"
Message-Id: <20201126232400.15011-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 48c624a1eff1..8c8b568609d4 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -44,7 +44,7 @@ config QCOM_CLK_APCC_MSM8996
 	help
 	  Support for the CPU clock controller on msm8996 devices.
 	  Say Y if you want to support CPU clock scaling using CPUfreq
-	  drivers for dyanmic power management.
+	  drivers for dynamic power management.
 
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
-- 
2.29.2
