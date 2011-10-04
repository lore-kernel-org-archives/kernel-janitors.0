From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Oct 2011 06:29:39 +0000
Subject: [patch] ALSA: oss-mixer - use strlcpy() instead strcpy()
Message-Id: <20111004062939.GA29901@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>

This is mostly a static checker fix more than anything else.  We're
copying from a 64 char buffer into a 44 char buffer.

The 64 character buffer is str[] in snd_mixer_oss_build_test_all().
The call tree is:
	snd_mixer_oss_build_test_all()
	-> snd_mixer_oss_build_test()
	   -> snd_mixer_oss_build_test().

We never actually do fill str[] buffer all the way to 64 characters.
The longest string is:
	sprintf(str, "%s Playback Switch", ptr->name);
ptr->name is a 32 character buffer so 32 plus 16 characters for
" Playback Switch" still puts us over the 44 limit from "id.name".

Most likely ptr->name never gets filled to the limit, but we can't
really change the size of that buffer so lets just use strlcpy() here
and be safe.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 27ac611..18297f7 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -500,7 +500,7 @@ static struct snd_kcontrol *snd_mixer_oss_test_id(struct snd_mixer_oss *mixer, c
 	
 	memset(&id, 0, sizeof(id));
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(id.name, name);
+	strlcpy(id.name, name, sizeof(id.name));
 	id.index = index;
 	return snd_ctl_find_id(card, &id);
 }
