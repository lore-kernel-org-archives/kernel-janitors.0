From: Colin King <colin.king@canonical.com>
Date: Fri, 14 Apr 2017 14:25:40 +0000
Subject: [PATCH] staging: media: atomisp: fix range checking on clk_num
Message-Id: <20170414142540.8465-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Cox <alan@linux.intel.com>, =?UTF-8?q?J=C3=A9r=C3=A9my=20Lefaure?= <jeremy.lefaure@lse.epita.fr>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The range checking on clk_num is incorrect; fix these so that invalid
clk_num values are detected correctly.

Detected by static analysis with by PVS-Studio

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/atomisp/platform/clock/vlv2_plat_clock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/platform/clock/vlv2_plat_clock.c b/drivers/staging/media/atomisp/platform/clock/vlv2_plat_clock.c
index 25e939c50aef..9efdf5790f90 100644
--- a/drivers/staging/media/atomisp/platform/clock/vlv2_plat_clock.c
+++ b/drivers/staging/media/atomisp/platform/clock/vlv2_plat_clock.c
@@ -67,7 +67,7 @@ int vlv2_plat_set_clock_freq(int clk_num, int freq_type)
 {
 	void __iomem *addr;
 
-	if (clk_num < 0 && clk_num > MAX_CLK_COUNT) {
+	if (clk_num < 0 || clk_num >= MAX_CLK_COUNT) {
 		pr_err("Clock number out of range (%d)\n", clk_num);
 		return -EINVAL;
 	}
@@ -103,7 +103,7 @@ int vlv2_plat_get_clock_freq(int clk_num)
 {
 	u32 ret;
 
-	if (clk_num < 0 && clk_num > MAX_CLK_COUNT) {
+	if (clk_num < 0 || clk_num >= MAX_CLK_COUNT) {
 		pr_err("Clock number out of range (%d)\n", clk_num);
 		return -EINVAL;
 	}
@@ -133,7 +133,7 @@ int vlv2_plat_configure_clock(int clk_num, u32 conf)
 {
 	void __iomem *addr;
 
-	if (clk_num < 0 && clk_num > MAX_CLK_COUNT) {
+	if (clk_num < 0 || clk_num >= MAX_CLK_COUNT) {
 		pr_err("Clock number out of range (%d)\n", clk_num);
 		return -EINVAL;
 	}
@@ -169,7 +169,7 @@ int vlv2_plat_get_clock_status(int clk_num)
 {
 	int ret;
 
-	if (clk_num < 0 && clk_num > MAX_CLK_COUNT) {
+	if (clk_num < 0 || clk_num >= MAX_CLK_COUNT) {
 		pr_err("Clock number out of range (%d)\n", clk_num);
 		return -EINVAL;
 	}
-- 
2.11.0

