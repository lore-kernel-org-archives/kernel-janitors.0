From: Vasiliy Kulikov <segooon@gmail.com>
Date: Thu, 28 Oct 2010 20:01:47 +0000
Subject: [PATCH 3/8] staging: dream: fix information leak to userland
Message-Id: <1288296107-19068-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Tejun Heo <tj@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Structure msm_audio_stats is copied to userland with some fields unitialized.
It leads to leaking of contents of kernel stack memory.
Also struct msm_audio_config has field "unused" of type array of 3 elements,
not 4.  Instead of this, initialize field "type".

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 drivers/staging/dream/qdsp5/audio_evrc.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/dream/qdsp5/audio_evrc.c b/drivers/staging/dream/qdsp5/audio_evrc.c
index 24a8926..b1f9233 100644
--- a/drivers/staging/dream/qdsp5/audio_evrc.c
+++ b/drivers/staging/dream/qdsp5/audio_evrc.c
@@ -481,6 +481,7 @@ static long audevrc_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd = AUDIO_GET_STATS) {
 		struct msm_audio_stats stats;
+		memset(&stats, 0, sizeof(stats));
 		stats.byte_count = audpp_avsync_byte_count(audio->dec_id);
 		stats.sample_count = audpp_avsync_sample_count(audio->dec_id);
 		if (copy_to_user((void *)arg, &stats, sizeof(stats)))
@@ -515,10 +516,10 @@ static long audevrc_ioctl(struct file *file, unsigned int cmd,
 			config.buffer_count = 2;
 			config.sample_rate = 8000;
 			config.channel_count = 1;
+			config.type = 0;
 			config.unused[0] = 0;
 			config.unused[1] = 0;
 			config.unused[2] = 0;
-			config.unused[3] = 0;
 			if (copy_to_user((void *)arg, &config, sizeof(config)))
 				rc = -EFAULT;
 			else
-- 
1.7.0.4

