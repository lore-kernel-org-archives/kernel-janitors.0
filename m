From: Colin King <colin.king@canonical.com>
Date: Sat, 08 Feb 2020 22:42:06 +0000
Subject: [PATCH] ALSA: info: remove redundant assignment to variable c
Message-Id: <20200208224206.38540-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable c is being assigned with the value -1 that is never read,
it is assigned a new value in a following while-loop. The assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/core/info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index ca87ae4c30ba..8c6bc5241df5 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -604,7 +604,7 @@ int snd_info_card_free(struct snd_card *card)
  */
 int snd_info_get_line(struct snd_info_buffer *buffer, char *line, int len)
 {
-	int c = -1;
+	int c;
 
 	if (snd_BUG_ON(!buffer || !buffer->buffer))
 		return 1;
-- 
2.25.0
