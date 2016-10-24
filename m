From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 24 Oct 2016 20:43:25 +0000
Subject: [PATCH 2/3] clk: keystone: Fix some error messages
Message-Id: <23b6ab7eef2d29d21b1e023c5bee72fa7f5ed424.1477339880.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1477339880.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1477339880.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lars@metafoo.de, dan.carpenter@oracle.com, ssantosh@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Report 'bit-shift' in the error message as it is the property we are
looking for.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/keystone/pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
index 70d6fb2d23bc..35c0e2b011d1 100644
--- a/drivers/clk/keystone/pll.c
+++ b/drivers/clk/keystone/pll.c
@@ -271,7 +271,7 @@ static void __init of_pll_div_clk_init(struct device_node *node)
 	}
 
 	if (of_property_read_u32(node, "bit-shift", &shift)) {
-		pr_err("%s: missing 'shift' property\n", __func__);
+		pr_err("%s: missing 'bit-shift' property\n", __func__);
 		return;
 	}
 
@@ -315,7 +315,7 @@ static void __init of_pll_mux_clk_init(struct device_node *node)
 	}
 
 	if (of_property_read_u32(node, "bit-shift", &shift)) {
-		pr_err("%s: missing 'shift' property\n", __func__);
+		pr_err("%s: missing 'bit-shift' property\n", __func__);
 		return;
 	}
 
-- 
2.9.3

