From: Dan Carpenter <error27@gmail.com>
Date: Fri, 17 Jun 2011 10:25:09 +0000
Subject: [patch] Staging: easycap: use after free in easycap_delete()
Message-Id: <20110617102508.GD2520@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The JOM() macro dereferences peasycap, so I moved the free down some
lines.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/easycap/easycap_main.c b/drivers/staging/easycap/easycap_main.c
index 62e07f6..84d4f77 100644
--- a/drivers/staging/easycap/easycap_main.c
+++ b/drivers/staging/easycap/easycap_main.c
@@ -913,8 +913,6 @@ static void easycap_delete(struct kref *pkref)
 	allocation_audio_struct = peasycap->allocation_audio_struct;
 	registered_audio        = peasycap->registered_audio;
 
-	kfree(peasycap);
-
 	if (0 <= kd && DONGLE_MANY > kd) {
 		if (mutex_lock_interruptible(&mutex_dongle)) {
 			SAY("ERROR: cannot down mutex_dongle\n");
@@ -929,6 +927,9 @@ static void easycap_delete(struct kref *pkref)
 	} else {
 		SAY("ERROR: cannot purge dongle[].peasycap");
 	}
+
+	kfree(peasycap);
+
 /*---------------------------------------------------------------------------*/
 	SAY("%8i=video urbs    after all deletions\n", allocation_video_urb);
 	SAY("%8i=video pages   after all deletions\n", allocation_video_page);
