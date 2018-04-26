From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 26 Apr 2018 11:21:08 +0000
Subject: [PATCH -next] clk: npcm7xx: fix return value check in npcm7xx_clk_init()
Message-Id: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tali Perry <tali.perry1@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: fcfd14369856 ("clk: npcm7xx: add clock controller")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/clk-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index dba5384..740af90 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -555,7 +555,7 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 	}
 
 	clk_base = ioremap(res.start, resource_size(&res));
-	if (IS_ERR(clk_base))
+	if (!clk_base)
 		goto npcm7xx_init_error;
 
 	npcm7xx_clk_data = kzalloc(sizeof(*npcm7xx_clk_data->hws) *

