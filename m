From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 12 Sep 2010 18:56:57 +0000
Subject: [PATCH] staging: solo6010: fix signess bug
Message-Id: <1284317820-4937-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Ben Collins <bcollins@bluecherry.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

video_nr is unsigned, so check video_nr >= 0 doesn't make sense.
The only "negative" value may be -1, so explicitly check for it.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/staging/solo6x10/solo6010-v4l2-enc.c |    2 +-
 drivers/staging/solo6x10/solo6010-v4l2.c     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/solo6x10/solo6010-v4l2-enc.c b/drivers/staging/solo6x10/solo6010-v4l2-enc.c
index f114b4b..bbf3d9c 100644
--- a/drivers/staging/solo6x10/solo6010-v4l2-enc.c
+++ b/drivers/staging/solo6x10/solo6010-v4l2-enc.c
@@ -1497,7 +1497,7 @@ static struct solo_enc_dev *solo_enc_alloc(struct solo6010_dev *solo_dev, u8 ch)
 		 "%s-enc (%i/%i)", SOLO6010_NAME, solo_dev->vfd->num,
 		 solo_enc->vfd->num);
 
-	if (video_nr >= 0)
+	if (video_nr != -1)
 		video_nr++;
 
 	spin_lock_init(&solo_enc->lock);
diff --git a/drivers/staging/solo6x10/solo6010-v4l2.c b/drivers/staging/solo6x10/solo6010-v4l2.c
index 9537cc6..9731fa0 100644
--- a/drivers/staging/solo6x10/solo6010-v4l2.c
+++ b/drivers/staging/solo6x10/solo6010-v4l2.c
@@ -825,7 +825,7 @@ int solo_v4l2_init(struct solo6010_dev *solo_dev)
 	snprintf(solo_dev->vfd->name, sizeof(solo_dev->vfd->name), "%s (%i)",
 		 SOLO6010_NAME, solo_dev->vfd->num);
 
-	if (video_nr >= 0)
+	if (video_nr != -1)
 		video_nr++;
 
 	dev_info(&solo_dev->pdev->dev, "Display as /dev/video%d with "
-- 
1.7.0.4

