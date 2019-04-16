From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Apr 2019 11:56:16 +0000
Subject: [PATCH] clk: mvebu: fix spelling mistake "gatable" -> "gateable"
Message-Id: <20190416115616.31861-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a few spelling mistakes in comments and a pr_err
error message. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/mvebu/common.c                  | 2 +-
 drivers/clk/mvebu/cp110-system-controller.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 6ab3c2e627c7..785dbede4835 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -240,7 +240,7 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 	int n;
 
 	if (ctrl) {
-		pr_err("mvebu-clk-gating: cannot instantiate more than one gatable clock device\n");
+		pr_err("mvebu-clk-gating: cannot instantiate more than one gateable clock device\n");
 		return;
 	}
 
diff --git a/drivers/clk/mvebu/cp110-system-controller.c b/drivers/clk/mvebu/cp110-system-controller.c
index 9235a331b588..b6de283f45e3 100644
--- a/drivers/clk/mvebu/cp110-system-controller.c
+++ b/drivers/clk/mvebu/cp110-system-controller.c
@@ -21,7 +21,7 @@
  *    - Equal to SDIO clock
  *    - 2/5 PLL0
  *
- * CP110 has 32 gatable clocks, for the various peripherals in the IP.
+ * CP110 has 32 gateable clocks, for the various peripherals in the IP.
  */
 
 #define pr_fmt(fmt) "cp110-system-controller: " fmt
@@ -57,7 +57,7 @@ enum {
 #define CP110_CORE_NAND			4
 #define CP110_CORE_SDIO			5
 
-/* A number of gatable clocks need special handling */
+/* A number of gateable clocks need special handling */
 #define CP110_GATE_AUDIO		0
 #define CP110_GATE_COMM_UNIT		1
 #define CP110_GATE_NAND			2
-- 
2.20.1
