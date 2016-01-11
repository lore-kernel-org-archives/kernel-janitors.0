From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 11 Jan 2016 06:16:14 +0000
Subject: [PATCH 1/2] soc: versatile: Add missing kfree in error path
Message-Id: <1452492975-8402-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'of_property_read_string' fails, then 'soc_dev_attr' should be freed,
otherwise, there is a memory leak.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch has already been
   Acked-by: Linus Walleij <linus.walleij@linaro.org>
on 17/07/2015
---
 drivers/soc/versatile/soc-realview.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/versatile/soc-realview.c b/drivers/soc/versatile/soc-realview.c
index c337764..39ffe18 100644
--- a/drivers/soc/versatile/soc-realview.c
+++ b/drivers/soc/versatile/soc-realview.c
@@ -113,8 +113,10 @@ static int realview_soc_probe(struct platform_device *pdev)
 
 	ret = of_property_read_string(np, "compatible",
 				      &soc_dev_attr->soc_id);
-	if (ret)
+	if (ret) {
+		kfree(soc_dev_attr);
 		return -EINVAL;
+	}
 
 	soc_dev_attr->machine = "RealView";
 	soc_dev_attr->family = "Versatile";
-- 
2.5.0

