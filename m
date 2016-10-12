From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 14:43:27 +0000
Subject: [PATCH 08/34] [media] DaVinci-VPBE: Return the success indication only as a constant in vpbe_set_mod
Message-Id: <bcd9c829-4a3b-22d8-e5fa-c530615a8921@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
In-Reply-To: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 09:51:29 +0200

* Return a success code without storing it in an intermediate variable.

* Delete the local variable "ret" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpbe.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/davinci/vpbe.c b/drivers/media/platform/davinci/vpbe.c
index 9fdd8c0..d6a0221 100644
--- a/drivers/media/platform/davinci/vpbe.c
+++ b/drivers/media/platform/davinci/vpbe.c
@@ -509,7 +509,6 @@ static int vpbe_set_mode(struct vpbe_device *vpbe_dev,
 	struct v4l2_dv_timings dv_timings;
 	struct osd_state *osd_device;
 	int out_index = vpbe_dev->current_out_index;
-	int ret = 0;
 	int i;
 
 	if (!mode_info || !mode_info->name)
@@ -549,8 +548,7 @@ static int vpbe_set_mode(struct vpbe_device *vpbe_dev,
 		vpbe_dev->current_timings.upper_margin);
 
 	mutex_unlock(&vpbe_dev->lock);
-
-	return ret;
+	return 0;
 }
 
 static int vpbe_set_default_mode(struct vpbe_device *vpbe_dev)
-- 
2.10.1

