From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 15:14:45 +0000
Subject: [PATCH 33/34] [media] DaVinci-VPIF-Display: Delete an unnecessary variable initialisation in vpif_ch
Message-Id: <4d6bde65-54e8-7887-c9de-61dbf64d1ab9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
In-Reply-To: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 15:43:12 +0200

The local variable "channel_id" will be reassigned with the following
statement at the beginning. Thus omit the explicit initialisation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpif_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
index fff1ece..cd44990 100644
--- a/drivers/media/platform/davinci/vpif_display.c
+++ b/drivers/media/platform/davinci/vpif_display.c
@@ -363,7 +363,7 @@ static irqreturn_t vpif_channel_isr(int irq, void *dev_id)
 	struct channel_obj *ch;
 	struct common_obj *common;
 	int fid = -1, i;
-	int channel_id = 0;
+	int channel_id;
 
 	channel_id = *(int *)(dev_id);
 	if (!vpif_intr_status(channel_id + 2))
-- 
2.10.1

