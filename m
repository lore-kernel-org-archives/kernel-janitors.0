From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 31 Aug 2016 13:45:04 +0000
Subject: [PATCH] [media] s5p_cec: Fix memory allocation failure check
Message-Id: <1472651104-17097-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

It is likely that checking the result of the memory allocation just above
is expected here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/media/s5p-cec/s5p_cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/s5p-cec/s5p_cec.c b/drivers/staging/media/s5p-cec/s5p_cec.c
index 78333273c4e5..636bac182e8e 100644
--- a/drivers/staging/media/s5p-cec/s5p_cec.c
+++ b/drivers/staging/media/s5p-cec/s5p_cec.c
@@ -173,7 +173,7 @@ static int s5p_cec_probe(struct platform_device *pdev)
 	int ret;
 
 	cec = devm_kzalloc(&pdev->dev, sizeof(*cec), GFP_KERNEL);
-	if (!dev)
+	if (!cec)
 		return -ENOMEM;
 
 	cec->dev = dev;
-- 
2.7.4

