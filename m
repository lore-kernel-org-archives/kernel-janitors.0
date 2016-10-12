From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 15:08:32 +0000
Subject: [PATCH 29/34] [media] DaVinci-VPIF-Capture: Delete an unnecessary variable initialisation in vpif_ch
Message-Id: <9103b007-6abe-06e0-397b-28cf70c0885f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
In-Reply-To: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 15:25:08 +0200

The local variable "channel_id" will be set to an appropriate value
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpif_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index 4197ca4..d3e2235 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -375,7 +375,7 @@ static irqreturn_t vpif_channel_isr(int irq, void *dev_id)
 	struct vpif_device *dev = &vpif_obj;
 	struct common_obj *common;
 	struct channel_obj *ch;
-	int channel_id = 0;
+	int channel_id;
 	int fid = -1, i;
 
 	channel_id = *(int *)(dev_id);
-- 
2.10.1

