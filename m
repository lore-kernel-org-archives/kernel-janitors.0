From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Jan 2021 06:10:47 +0000
Subject: [PATCH] ALSA: fireface: fix info leak in hwdep_read()
Message-Id: <YAka5xudQNQgRkuC@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

If "ff->dev_lock_changed" has not changed and "count" is too large then
this will copy data beyond the end of the struct to user space.

Fixes: f656edd5fb33 ("ALSA: fireface: add hwdep interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/firewire/fireface/ff-hwdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
index 4b2e0dff5ddb..b84dde609a03 100644
--- a/sound/firewire/fireface/ff-hwdep.c
+++ b/sound/firewire/fireface/ff-hwdep.c
@@ -35,12 +35,12 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
 	}
 
 	memset(&event, 0, sizeof(event));
+	count = min_t(long, count, sizeof(event.lock_status));
 	if (ff->dev_lock_changed) {
 		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
 		event.lock_status.status = (ff->dev_lock_count > 0);
 		ff->dev_lock_changed = false;
 
-		count = min_t(long, count, sizeof(event.lock_status));
 	}
 
 	spin_unlock_irq(&ff->lock);
-- 
2.29.2
