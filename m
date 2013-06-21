From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Jun 2013 12:25:33 +0000
Subject: [patch] ALSA: vx_core: off by one in vx_read_status()
Message-Id: <20130621122533.GA24059@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

This code is older than git, and I haven't tested it, but if size =
SIZE_MAX_STATUS then we would write one space past the end of the
rmh->Stat[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
index c39961c..8359689 100644
--- a/sound/drivers/vx/vx_core.c
+++ b/sound/drivers/vx/vx_core.c
@@ -205,7 +205,7 @@ static int vx_read_status(struct vx_core *chip, struct vx_rmh *rmh)
 
 	if (size < 1)
 		return 0;
-	if (snd_BUG_ON(size > SIZE_MAX_STATUS))
+	if (snd_BUG_ON(size >= SIZE_MAX_STATUS))
 		return -EINVAL;
 
 	for (i = 1; i <= size; i++) {
