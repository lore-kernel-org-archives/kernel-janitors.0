From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jan 2021 11:13:44 +0000
Subject: [PATCH v2 2/2] ALSA: fireface: remove unnecessary condition in hwdep_read()
Message-Id: <YA6n6I8EcNAO5ZFs@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20210122071354.GI20820@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

Smatch complains that "count" is not clamped when "ff->dev_lock_changed"
and it leads to an information leak.  Fortunately, that's not actually
possible and the condition can be deleted.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: just delet the condition

 sound/firewire/fireface/ff-hwdep.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
index 4b2e0dff5ddb..ea64a2a41eea 100644
--- a/sound/firewire/fireface/ff-hwdep.c
+++ b/sound/firewire/fireface/ff-hwdep.c
@@ -35,13 +35,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
 	}
 
 	memset(&event, 0, sizeof(event));
-	if (ff->dev_lock_changed) {
-		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
-		event.lock_status.status = (ff->dev_lock_count > 0);
-		ff->dev_lock_changed = false;
+	event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
+	event.lock_status.status = (ff->dev_lock_count > 0);
+	ff->dev_lock_changed = false;
 
-		count = min_t(long, count, sizeof(event.lock_status));
-	}
+	count = min_t(long, count, sizeof(event.lock_status));
 
 	spin_unlock_irq(&ff->lock);
 
-- 
2.29.2
