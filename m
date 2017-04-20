From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 08:29:43 +0000
Subject: [PATCH 6/8] clk: Improve a size determination in two functions
Message-Id: <599640c0-d9a1-f1a4-47f3-edaf98f407c1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
In-Reply-To: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 09:30:52 +0200

Replace the specification of two data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 684642ab4212..3f2ee0469d3e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2939,7 +2939,7 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
 
 	/* if clk wasn't in the notifier list, allocate new clk_notifier */
 	if (cn->clk != clk) {
-		cn = kzalloc(sizeof(struct clk_notifier), GFP_KERNEL);
+		cn = kzalloc(sizeof(*cn), GFP_KERNEL);
 		if (!cn)
 			goto out;
 
@@ -3087,7 +3087,7 @@ int of_clk_add_provider(struct device_node *np,
 	struct of_clk_provider *cp;
 	int ret;
 
-	cp = kzalloc(sizeof(struct of_clk_provider), GFP_KERNEL);
+	cp = kzalloc(sizeof(*cp), GFP_KERNEL);
 	if (!cp)
 		return -ENOMEM;
 
-- 
2.12.2

