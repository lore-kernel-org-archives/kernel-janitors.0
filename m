From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 14 Aug 2012 15:49:46 +0000
Subject: [PATCH 3/5] drivers/media/video/{s2255drv.c,tm6000/tm6000-alsa.c,tm6000/tm6000-input.c}: Remove pote
Message-Id: <1344959388-19719-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344959388-19719-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344959388-19719-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

If the NULL test is necessary, the initialization involving a dereference of
the tested value should be moved after the NULL test.

The sematic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/video/s2255drv.c            |    3 ++-
 drivers/media/video/tm6000/tm6000-alsa.c  |    3 ++-
 drivers/media/video/tm6000/tm6000-input.c |    3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/video/s2255drv.c b/drivers/media/video/s2255drv.c
index 6c7960c..a25513d 100644
--- a/drivers/media/video/s2255drv.c
+++ b/drivers/media/video/s2255drv.c
@@ -1861,11 +1861,12 @@ static int s2255_release(struct file *file)
 static int s2255_mmap_v4l(struct file *file, struct vm_area_struct *vma)
 {
 	struct s2255_fh *fh = file->private_data;
-	struct s2255_dev *dev = fh->dev;
+	struct s2255_dev *dev;
 	int ret;
 
 	if (!fh)
 		return -ENODEV;
+	dev = fh->dev;
 	dprintk(4, "%s, vma=0x%08lx\n", __func__, (unsigned long)vma);
 	if (mutex_lock_interruptible(&dev->lock))
 		return -ERESTARTSYS;
diff --git a/drivers/media/video/tm6000/tm6000-alsa.c b/drivers/media/video/tm6000/tm6000-alsa.c
index bd07ec7..813c1ec 100644
--- a/drivers/media/video/tm6000/tm6000-alsa.c
+++ b/drivers/media/video/tm6000/tm6000-alsa.c
@@ -487,10 +487,11 @@ error:
 
 static int tm6000_audio_fini(struct tm6000_core *dev)
 {
-	struct snd_tm6000_card	*chip = dev->adev;
+	struct snd_tm6000_card *chip;
 
 	if (!dev)
 		return 0;
+	chip = dev->adev;
 
 	if (!chip)
 		return 0;
diff --git a/drivers/media/video/tm6000/tm6000-input.c b/drivers/media/video/tm6000/tm6000-input.c
index e80b7e1..dffbd4b 100644
--- a/drivers/media/video/tm6000/tm6000-input.c
+++ b/drivers/media/video/tm6000/tm6000-input.c
@@ -319,12 +319,13 @@ static int tm6000_ir_change_protocol(struct rc_dev *rc, u64 rc_type)
 static int __tm6000_ir_int_start(struct rc_dev *rc)
 {
 	struct tm6000_IR *ir = rc->priv;
-	struct tm6000_core *dev = ir->dev;
+	struct tm6000_core *dev;
 	int pipe, size;
 	int err = -ENOMEM;
 
 	if (!ir)
 		return -ENODEV;
+	dev = ir->dev;
 
 	dprintk(2, "%s\n",__func__);
 

