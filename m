From: Dan Carpenter <error27@gmail.com>
Date: Fri, 27 Aug 2010 19:28:21 +0000
Subject: [patch] ALSA: pcm: add more format names
Message-Id: <20100827192821.GC9832@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There were some new formats added in commit 15c0cee6c809 "ALSA: pcm:
Define G723 3-bit and 5-bit formats".  That commit increased
SNDRV_PCM_FORMAT_LAST as well.  My concern is that there are a couple
places which do:

        for (i = 0; i < SNDRV_PCM_FORMAT_LAST; i++) {
                if (dummy->pcm_hw.formats & (1ULL << i))
                        snd_iprintf(buffer, " %s", snd_pcm_format_name(i));
        }

I haven't tested these but it looks like if "i" were equal to
SNDRV_PCM_FORMAT_G723_24 or higher then we might read past the end of
the array. 

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index cbe815d..204af48 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -203,10 +203,16 @@ static char *snd_pcm_format_names[] = {
 	FORMAT(S18_3BE),
 	FORMAT(U18_3LE),
 	FORMAT(U18_3BE),
+	FORMAT(G723_24),
+	FORMAT(G723_24_1B),
+	FORMAT(G723_40),
+	FORMAT(G723_40_1B),
 };
 
 const char *snd_pcm_format_name(snd_pcm_format_t format)
 {
+	if (format >= ARRAY_SIZE(snd_pcm_format_names))
+		return "Unknown";
 	return snd_pcm_format_names[format];
 }
 EXPORT_SYMBOL_GPL(snd_pcm_format_name);
