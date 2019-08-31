From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 31 Aug 2019 06:42:58 +0000
Subject: [PATCH] media: seco-cec: Add a missing 'release_region()' in an error handling path
Message-Id: <20190831064258.916-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ek5.chimenti@gmail.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

At the beginning of the probe function, we have a call to
'request_muxed_region(BRA_SMB_BASE_ADDR, 7, "CEC00001")()'

A corresponding 'release_region()' is performed in the remove function but
is lacking in the error handling path.

Add it.

Fixes: b03c2fb97adc ("media: add SECO cec driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/seco-cec/seco-cec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/seco-cec/seco-cec.c b/drivers/media/platform/seco-cec/seco-cec.c
index 9cd60fe1867c..a86b6e8f9196 100644
--- a/drivers/media/platform/seco-cec/seco-cec.c
+++ b/drivers/media/platform/seco-cec/seco-cec.c
@@ -675,6 +675,7 @@ static int secocec_probe(struct platform_device *pdev)
 err_delete_adapter:
 	cec_delete_adapter(secocec->cec_adap);
 err:
+	release_region(BRA_SMB_BASE_ADDR, 7);
 	dev_err(dev, "%s device probe failed\n", dev_name(dev));
 
 	return ret;
-- 
2.20.1
