From: Colin King <colin.king@canonical.com>
Date: Tue, 02 Jun 2020 12:10:30 +0000
Subject: [PATCH][next] clk: baikal-t1: fix spelling mistake "Uncompatible" -> "Incompatible"
Message-Id: <20200602121030.39132-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Serge Semin <Sergey.Semin@baikalelectronics.ru>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/baikal-t1/clk-ccu-div.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/baikal-t1/clk-ccu-div.c b/drivers/clk/baikal-t1/clk-ccu-div.c
index b479156e5e9b..f141fda12b09 100644
--- a/drivers/clk/baikal-t1/clk-ccu-div.c
+++ b/drivers/clk/baikal-t1/clk-ccu-div.c
@@ -316,7 +316,7 @@ static struct ccu_div_data *ccu_div_create_data(struct device_node *np)
 		data->rst_num = ARRAY_SIZE(sys_rst_map);
 		data->rst_map = sys_rst_map;
 	} else {
-		pr_err("Uncompatible DT node '%s' specified\n",
+		pr_err("Incompatible DT node '%s' specified\n",
 			of_node_full_name(np));
 		ret = -EINVAL;
 		goto err_kfree_data;
-- 
2.25.1
