From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 27 Aug 2019 14:09:42 +0000
Subject: [PATCH] media: stm32-dcmi: Delete an unnecessary of_node_put() call in dcmi_probe()
Message-Id: <129a4933-2171-7ed9-c84c-8e56b6d05270@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Alexandre Torgue <alexandre.torgue@st.com>, Hugues Fruchet <hugues.fruchet@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 16:00:13 +0200

A null pointer would be passed to a call of the function “of_node_put”
immediately after a call of the function “of_graph_get_next_endpoint”
failed at one place.
Remove this superfluous function call.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index cb1daf8217ff..9392e3409fba 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1861,7 +1861,6 @@ static int dcmi_probe(struct platform_device *pdev)
 	np = of_graph_get_next_endpoint(np, NULL);
 	if (!np) {
 		dev_err(&pdev->dev, "Could not find the endpoint\n");
-		of_node_put(np);
 		return -ENODEV;
 	}

--
2.23.0
