From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jan 2021 11:12:54 +0000
Subject: [PATCH v2 1/2] ALSA: oxfw: remove an unnecessary condition in hwdep_read()
Message-Id: <YA6ntkBxT/4DJ4YK@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20210122071354.GI20820@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

Smatch complains that "count" isn't clamped properly and
"oxfw->dev_lock_changed" is false then it leads to an information
leak.  But it turns out that "oxfw->dev_lock_changed" is always
set and the condition can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: this version just removes the condition

 sound/firewire/oxfw/oxfw-hwdep.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-hwdep.c b/sound/firewire/oxfw/oxfw-hwdep.c
index 9e1b3e151bad..a0fe99618554 100644
--- a/sound/firewire/oxfw/oxfw-hwdep.c
+++ b/sound/firewire/oxfw/oxfw-hwdep.c
@@ -35,13 +35,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
 	}
 
 	memset(&event, 0, sizeof(event));
-	if (oxfw->dev_lock_changed) {
-		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
-		event.lock_status.status = (oxfw->dev_lock_count > 0);
-		oxfw->dev_lock_changed = false;
+	event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
+	event.lock_status.status = (oxfw->dev_lock_count > 0);
+	oxfw->dev_lock_changed = false;
 
-		count = min_t(long, count, sizeof(event.lock_status));
-	}
+	count = min_t(long, count, sizeof(event.lock_status));
 
 	spin_unlock_irq(&oxfw->lock);
 
-- 
2.29.2
