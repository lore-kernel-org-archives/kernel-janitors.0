From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 09 Oct 2016 19:58:16 +0000
Subject: [PATCH 2/2] [media] blackfin-capture: Delete an error message for a failed memory allocation
Message-Id: <d38d82b8-a234-3fd6-01ec-d021e317f2de@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ae9a008f-35e2-e4e0-be18-635050c8277e@users.sourceforge.net>
In-Reply-To: <ae9a008f-35e2-e4e0-be18-635050c8277e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adi-buildroot-devel@lists.sourceforge.net, linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Scott Jiang <scott.jiang.linux@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 9 Oct 2016 21:30:18 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus remove such a statement here.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/blackfin/bfin_capture.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/blackfin/bfin_capture.c b/drivers/media/platform/blackfin/bfin_capture.c
index c5e1043..2e6edc0 100644
--- a/drivers/media/platform/blackfin/bfin_capture.c
+++ b/drivers/media/platform/blackfin/bfin_capture.c
@@ -802,10 +802,8 @@ static int bcap_probe(struct platform_device *pdev)
 	}
 
 	bcap_dev = kzalloc(sizeof(*bcap_dev), GFP_KERNEL);
-	if (!bcap_dev) {
-		v4l2_err(pdev->dev.driver, "Unable to alloc bcap_dev\n");
+	if (!bcap_dev)
 		return -ENOMEM;
-	}
 
 	bcap_dev->cfg = config;
 
-- 
2.10.1

