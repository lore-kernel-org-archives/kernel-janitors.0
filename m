From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Dec 2018 08:22:41 +0000
Subject: [PATCH] clk: tegra: dfll: Fix a potential Oop in remove()
Message-Id: <20181218082241.GA440@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

If tegra_dfll_unregister() fails then "soc" is an error pointer.  We
should just return instead of dereferencing it.

Fixes: 1752c9ee23fb ("clk: tegra: dfll: Fix drvdata overwriting issue")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 269d3595758b..edc31bb56674 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -133,9 +133,11 @@ static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
 	struct tegra_dfll_soc_data *soc;
 
 	soc = tegra_dfll_unregister(pdev);
-	if (IS_ERR(soc))
+	if (IS_ERR(soc)) {
 		dev_err(&pdev->dev, "failed to unregister DFLL: %ld\n",
 			PTR_ERR(soc));
+		return PTR_ERR(soc);
+	}
 
 	tegra_cvb_remove_opp_table(soc->dev, soc->cvb, soc->max_freq);
 
-- 
2.17.1
