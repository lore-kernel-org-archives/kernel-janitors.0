From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 18 Feb 2019 06:52:44 +0000
Subject: [PATCH -next] clk: tegra: dfll: Make symbol 'tegra210_cpu_cvb_tables' static
Message-Id: <20190218070609.167535-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/clk/tegra/clk-tegra124-dfll-fcpu.c:244:18: warning:
 symbol 'tegra210_cpu_cvb_tables' was not declared. Should it be static?

Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 4b6dd2b3767f..e8ec42bf8638 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -241,7 +241,7 @@ static const unsigned long tegra210_cpu_max_freq_table[] = {
 		{          0UL,	{       0, 0, 0 } }, \
 	}
 
-struct cvb_table tegra210_cpu_cvb_tables[] = {
+static struct cvb_table tegra210_cpu_cvb_tables[] = {
 	{
 		.speedo_id = 10,
 		.process_id = 0,
