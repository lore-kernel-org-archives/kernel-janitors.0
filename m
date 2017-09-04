From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 04 Sep 2017 20:05:54 +0000
Subject: [PATCH 1/6] [media] atmel-isc: Delete an error message for a failed memory allocation in isc_formats
Message-Id: <d79fe512-cd52-698f-e212-d987ba2cd533@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88d0739c-fdc1-9d7d-fe53-b7c2eeed1849@users.sourceforge.net>
In-Reply-To: <88d0739c-fdc1-9d7d-fe53-b7c2eeed1849@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Songjun Wu <songjun.wu@microchip.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 4 Sep 2017 20:33:58 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/atmel/atmel-isc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc.c b/drivers/media/platform/atmel/atmel-isc.c
index d4df3d4ccd85..f1e635edef72 100644
--- a/drivers/media/platform/atmel/atmel-isc.c
+++ b/drivers/media/platform/atmel/atmel-isc.c
@@ -1510,7 +1510,5 @@ static int isc_formats_init(struct isc_device *isc)
-	if (!isc->user_formats) {
-		v4l2_err(&isc->v4l2_dev, "could not allocate memory\n");
+	if (!isc->user_formats)
 		return -ENOMEM;
-	}
 
 	fmt = &isc_formats[0];
 	for (i = 0, j = 0; i < ARRAY_SIZE(isc_formats); i++) {
-- 
2.14.1

