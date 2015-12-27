From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 27 Dec 2015 21:22:41 +0000
Subject: [PATCH] [media] bttv: Returning only value constants in two functions
Message-Id: <568056A1.8050602@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 27 Dec 2015 22:02:21 +0100

Return constant integer values without storing them in the local
variable "err" or "rc".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 9400e99..cd7d6ef 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -1726,22 +1726,15 @@ static int bttv_s_std(struct file *file, void *priv, v4l2_std_id id)
 	struct bttv_fh *fh  = priv;
 	struct bttv *btv = fh->btv;
 	unsigned int i;
-	int err = 0;
 
 	for (i = 0; i < BTTV_TVNORMS; i++)
 		if (id & bttv_tvnorms[i].v4l2_id)
 			break;
-	if (i = BTTV_TVNORMS) {
-		err = -EINVAL;
-		goto err;
-	}
-
+	if (i = BTTV_TVNORMS)
+		return -EINVAL;
 	btv->std = id;
 	set_tvnorm(btv, i);
-
-err:
-
-	return err;
+	return 0;
 }
 
 static int bttv_g_std(struct file *file, void *priv, v4l2_std_id *id)
@@ -1770,12 +1763,9 @@ static int bttv_enum_input(struct file *file, void *priv,
 {
 	struct bttv_fh *fh = priv;
 	struct bttv *btv = fh->btv;
-	int rc = 0;
 
-	if (i->index >= bttv_tvcards[btv->c.type].video_inputs) {
-		rc = -EINVAL;
-		goto err;
-	}
+	if (i->index >= bttv_tvcards[btv->c.type].video_inputs)
+		return -EINVAL;
 
 	i->type     = V4L2_INPUT_TYPE_CAMERA;
 	i->audioset = 0;
@@ -1799,10 +1789,7 @@ static int bttv_enum_input(struct file *file, void *priv,
 	}
 
 	i->std = BTTV_NORMS;
-
-err:
-
-	return rc;
+	return 0;
 }
 
 static int bttv_g_input(struct file *file, void *priv, unsigned int *i)
-- 
2.6.3

