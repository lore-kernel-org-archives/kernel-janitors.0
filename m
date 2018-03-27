From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Mar 2018 13:07:52 +0000
Subject: [PATCH] ALSA: pcm: potential uninitialized return values
Message-Id: <20180327130752.GA31841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Smatch complains that "tmp" can be uninitialized if we do a zero size
write.

Fixes: 02a5d6925cd3 ("ALSA: pcm: Avoid potential races between OSS ioctls and read/write")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index a9082f219561..40852c595453 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -1364,7 +1364,7 @@ static ssize_t snd_pcm_oss_write2(struct snd_pcm_substream *substream, const cha
 static ssize_t snd_pcm_oss_write1(struct snd_pcm_substream *substream, const char __user *buf, size_t bytes)
 {
 	size_t xfer = 0;
-	ssize_t tmp;
+	ssize_t tmp = 0;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	if (atomic_read(&substream->mmap_count))
@@ -1474,7 +1474,7 @@ static ssize_t snd_pcm_oss_read2(struct snd_pcm_substream *substream, char *buf,
 static ssize_t snd_pcm_oss_read1(struct snd_pcm_substream *substream, char __user *buf, size_t bytes)
 {
 	size_t xfer = 0;
-	ssize_t tmp;
+	ssize_t tmp = 0;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	if (atomic_read(&substream->mmap_count))
