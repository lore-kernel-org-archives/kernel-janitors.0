From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Aug 2017 08:29:52 +0000
Subject: [PATCH 6/6] ALSA: timer: Adjust 13 checks for null pointers
Message-Id: <6ce55a29-f414-fec4-0a5e-2ddd54e40bed@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b8c9e41b-a47e-1d99-3d1a-5d39772e4b54@users.sourceforge.net>
 <s5h378isw2d.wl-tiwai@suse.de>
 <800d7aa6-d8f2-cbf5-caaa-7e4006976e68@users.sourceforge.net>
In-Reply-To: <800d7aa6-d8f2-cbf5-caaa-7e4006976e68@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Vegard Nossum <vegard.nossum@oracle.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Aug 2017 09:54:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/core/timer.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 6cdd04a45962..ff94842f7b01 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -106,7 +106,7 @@ static struct snd_timer_instance *snd_timer_instance_new(char *owner,
 {
 	struct snd_timer_instance *timeri;
 	timeri = kzalloc(sizeof(*timeri), GFP_KERNEL);
-	if (timeri = NULL)
+	if (!timeri)
 		return NULL;
 	timeri->owner = kstrdup(owner, GFP_KERNEL);
 	if (! timeri->owner) {
@@ -141,7 +141,7 @@ static struct snd_timer *snd_timer_find(struct snd_timer_id *tid)
 			continue;
 		if ((timer->tmr_class = SNDRV_TIMER_CLASS_CARD ||
 		     timer->tmr_class = SNDRV_TIMER_CLASS_PCM) &&
-		    (timer->card = NULL ||
+		    (!timer->card ||
 		     timer->card->number != tid->card))
 			continue;
 		if (timer->tmr_device != tid->device)
@@ -391,5 +391,5 @@ unsigned long snd_timer_resolution(struct snd_timer_instance *timeri)
 {
 	struct snd_timer * timer;
 
-	if (timeri = NULL)
+	if (!timeri)
 		return 0;
@@ -425,7 +425,7 @@ static void snd_timer_notify1(struct snd_timer_instance *ti, int event)
 	if (ti->flags & SNDRV_TIMER_IFLG_SLAVE)
 		return;
 	timer = ti->timer;
-	if (timer = NULL)
+	if (!timer)
 		return;
 	if (timer->hw.flags & SNDRV_TIMER_HW_SLAVE)
 		return;
@@ -586,7 +586,7 @@ static int snd_timer_stop_slave(struct snd_timer_instance *timeri, bool stop)
  */
 int snd_timer_start(struct snd_timer_instance *timeri, unsigned int ticks)
 {
-	if (timeri = NULL || ticks < 1)
+	if (!timeri || ticks < 1)
 		return -EINVAL;
 	if (timeri->flags & SNDRV_TIMER_IFLG_SLAVE)
 		return snd_timer_start_slave(timeri, true);
@@ -722,7 +722,7 @@ void snd_timer_interrupt(struct snd_timer * timer, unsigned long ticks_left)
 	unsigned long flags;
 	int use_tasklet = 0;
 
-	if (timer = NULL)
+	if (!timer)
 		return;
 
 	if (timer->card && timer->card->shutdown)
@@ -856,7 +856,7 @@ int snd_timer_new(struct snd_card *card, char *id, struct snd_timer_id *tid,
 	spin_lock_init(&timer->lock);
 	tasklet_init(&timer->task_queue, snd_timer_tasklet,
 		     (unsigned long)timer);
-	if (card != NULL) {
+	if (card) {
 		timer->module = card->module;
 		err = snd_device_new(card, SNDRV_DEV_TIMER, timer, &ops);
 		if (err < 0) {
@@ -909,7 +909,7 @@ static int snd_timer_dev_register(struct snd_device *dev)
 	if (snd_BUG_ON(!timer || !timer->hw.start || !timer->hw.stop))
 		return -ENXIO;
 	if (!(timer->hw.flags & SNDRV_TIMER_HW_SLAVE) &&
-	    !timer->hw.resolution && timer->hw.c_resolution = NULL)
+	    !timer->hw.resolution && !timer->hw.c_resolution)
 	    	return -EINVAL;
 
 	mutex_lock(&register_mutex);
@@ -1114,7 +1114,7 @@ static int snd_timer_register_system(void)
 	strcpy(timer->name, "system timer");
 	timer->hw = snd_timer_system;
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (priv = NULL) {
+	if (!priv) {
 		snd_timer_free(timer);
 		return -ENOMEM;
 	}
@@ -1182,7 +1182,7 @@ static void __init snd_timer_proc_init(void)
 	struct snd_info_entry *entry;
 
 	entry = snd_info_create_module_entry(THIS_MODULE, "timers", NULL);
-	if (entry != NULL) {
+	if (entry) {
 		entry->c.text.read = snd_timer_proc_read;
 		if (snd_info_register(entry) < 0) {
 			snd_info_free_entry(entry);
@@ -1378,7 +1378,7 @@ static int snd_timer_user_open(struct inode *inode, struct file *file)
 		return err;
 
 	tu = kzalloc(sizeof(*tu), GFP_KERNEL);
-	if (tu = NULL)
+	if (!tu)
 		return -ENOMEM;
 	spin_lock_init(&tu->qlock);
 	init_waitqueue_head(&tu->qchange_sleep);
@@ -1537,7 +1537,7 @@ static int snd_timer_user_ginfo(struct file *file,
 	ginfo->tid = tid;
 	mutex_lock(&register_mutex);
 	t = snd_timer_find(&tid);
-	if (t != NULL) {
+	if (t) {
 		ginfo->card = t->card ? t->card->number : -1;
 		if (t->hw.flags & SNDRV_TIMER_HW_SLAVE)
 			ginfo->flags |= SNDRV_TIMER_FLG_SLAVE;
@@ -1611,7 +1611,7 @@ static int snd_timer_user_gstatus(struct file *file,
 	gstatus.tid = tid;
 	mutex_lock(&register_mutex);
 	t = snd_timer_find(&tid);
-	if (t != NULL) {
+	if (t) {
 		if (t->hw.c_resolution)
 			gstatus.resolution = t->hw.c_resolution(t);
 		else
-- 
2.14.0

