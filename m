From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Feb 2017 23:15:44 +0000
Subject: [patch] staging: bcm2835-audio: allocate enough data for work queues
Message-Id: <20170214231544.GA9284@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We accidentally allocate sizeof(void *) bytes instead of 112 bytes.  It
results in memory corruption.

Fixes: 23b028c871e1 ("staging: bcm2835-audio: initial staging submission")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/bcm2835-audio/bcm2835-vchiq.c
index d11f2cdd1014..f5c6a83569f3 100644
--- a/drivers/staging/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/bcm2835-audio/bcm2835-vchiq.c
@@ -134,8 +134,9 @@ int bcm2835_audio_start(struct bcm2835_alsa_stream *alsa_stream)
 	int ret = -1;
 	LOG_DBG(" .. IN\n");
 	if (alsa_stream->my_wq) {
-		struct bcm2835_audio_work *work -			kmalloc(sizeof(struct bcm2835_audio_work *), GFP_ATOMIC);
+		struct bcm2835_audio_work *work;
+
+		work = kmalloc(sizeof(*work), GFP_ATOMIC);
 		/*--- Queue some work (item 1) ---*/
 		if (work) {
 			INIT_WORK(&work->my_work, my_wq_function);
@@ -155,8 +156,9 @@ int bcm2835_audio_stop(struct bcm2835_alsa_stream *alsa_stream)
 	int ret = -1;
 	LOG_DBG(" .. IN\n");
 	if (alsa_stream->my_wq) {
-		struct bcm2835_audio_work *work -			kmalloc(sizeof(struct bcm2835_audio_work *), GFP_ATOMIC);
+		struct bcm2835_audio_work *work;
+
+		work = kmalloc(sizeof(*work), GFP_ATOMIC);
 		/*--- Queue some work (item 1) ---*/
 		if (work) {
 			INIT_WORK(&work->my_work, my_wq_function);
@@ -177,8 +179,9 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
 	int ret = -1;
 	LOG_DBG(" .. IN\n");
 	if (alsa_stream->my_wq) {
-		struct bcm2835_audio_work *work -			kmalloc(sizeof(struct bcm2835_audio_work *), GFP_ATOMIC);
+		struct bcm2835_audio_work *work;
+
+		work = kmalloc(sizeof(*work), GFP_ATOMIC);
 		/*--- Queue some work (item 1) ---*/
 		if (work) {
 			INIT_WORK(&work->my_work, my_wq_function);
