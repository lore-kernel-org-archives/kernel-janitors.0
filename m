From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 17 Jul 2015 17:54:35 +0000
Subject: [PATCH] soc: versatile: Add missing kfree in error path
Message-Id: <1437155675-29123-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linus.walleij@linaro.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'of_property_read_string' fails, then 'soc_dev_attr' should be freed,
otherwise, there is a memory leak.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/soc/versatile/soc-realview.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/versatile/soc-realview.c b/drivers/soc/versatile/soc-realview.c
index e642c45..48bc962 100644
--- a/drivers/soc/versatile/soc-realview.c
+++ b/drivers/soc/versatile/soc-realview.c
@@ -109,8 +109,10 @@ static int realview_soc_probe(struct platform_device *pdev)
 
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
2.1.4

