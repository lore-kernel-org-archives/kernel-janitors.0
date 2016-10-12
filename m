From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 15:00:27 +0000
Subject: [PATCH 22/34] [media] DaVinci-VPFE-Capture: Move two assignments in vpfe_s_input()
Message-Id: <bd43de6a-827d-7ec6-8b9b-1dc08875cf87@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
In-Reply-To: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 11:22:23 +0200

Move assignments for two local variables into an else branch so that
their setting will only be performed after corresponding data processing
succeeded by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpfe_capture.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index ba71310..f0467fe 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -1111,7 +1111,7 @@ static int vpfe_s_input(struct file *file, void *priv, unsigned int index)
 	struct vpfe_subdev_info *sdinfo;
 	int subdev_index, inp_index;
 	struct vpfe_route *route;
-	u32 input = 0, output = 0;
+	u32 input, output;
 	int ret;
 
 	v4l2_dbg(1, debug, &vpfe_dev->v4l2_dev, "vpfe_s_input\n");
@@ -1144,6 +1144,9 @@ static int vpfe_s_input(struct file *file, void *priv, unsigned int index)
 	if (route && sdinfo->can_route) {
 		input = route->input;
 		output = route->output;
+	} else {
+		input = 0;
+		output = 0;
 	}
 
 	if (sd)
-- 
2.10.1

