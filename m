From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 07:43:19 +0000
Subject: [PATCH 01/16] ALSA: ad1816a: constify copied structure
Message-Id: <1577864614-5543-2-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org

The snd_ad1816a_timer_table structure is only copied into
another structure, so make it const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/isa/ad1816a/ad1816a_lib.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/ad1816a/ad1816a_lib.c b/sound/isa/ad1816a/ad1816a_lib.c
index e1aa5372c483..da6f68b8c248 100644
--- a/sound/isa/ad1816a/ad1816a_lib.c
+++ b/sound/isa/ad1816a/ad1816a_lib.c
@@ -409,7 +409,7 @@ static int snd_ad1816a_timer_stop(struct snd_timer *timer)
 	return 0;
 }
 
-static struct snd_timer_hardware snd_ad1816a_timer_table = {
+static const struct snd_timer_hardware snd_ad1816a_timer_table = {
 	.flags =	SNDRV_TIMER_HW_AUTO,
 	.resolution =	10000,
 	.ticks =	65535,
