From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 04 Sep 2017 20:11:22 +0000
Subject: [PATCH 5/6] [media] atmel-isi: Improve three size determinations
Message-Id: <2a5b21a7-91af-238a-0064-e382fb85afe3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88d0739c-fdc1-9d7d-fe53-b7c2eeed1849@users.sourceforge.net>
In-Reply-To: <88d0739c-fdc1-9d7d-fe53-b7c2eeed1849@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Songjun Wu <songjun.wu@microchip.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 4 Sep 2017 21:27:45 +0200

Replace the specification of data types by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/atmel/atmel-isi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 154e9c39b64f..ac40defce1e7 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1036,13 +1036,13 @@ static int isi_formats_init(struct atmel_isi *isi)
 
 	isi->num_user_formats = num_fmts;
 	isi->user_formats = devm_kcalloc(isi->dev,
-					 num_fmts, sizeof(struct isi_format *),
+					 num_fmts, sizeof(*isi->user_formats),
 					 GFP_KERNEL);
 	if (!isi->user_formats)
 		return -ENOMEM;
 
 	memcpy(isi->user_formats, isi_fmts,
-	       num_fmts * sizeof(struct isi_format *));
+	       num_fmts * sizeof(*isi->user_formats));
 	isi->current_fmt = isi->user_formats[0];
 
 	return 0;
@@ -1173,5 +1173,5 @@ static int atmel_isi_probe(struct platform_device *pdev)
 	struct resource *regs;
 	int ret, i;
 
-	isi = devm_kzalloc(&pdev->dev, sizeof(struct atmel_isi), GFP_KERNEL);
+	isi = devm_kzalloc(&pdev->dev, sizeof(*isi), GFP_KERNEL);
 	if (!isi)
-- 
2.14.1

