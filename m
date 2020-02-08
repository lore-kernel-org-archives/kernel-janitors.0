From: Colin King <colin.king@canonical.com>
Date: Sat, 08 Feb 2020 22:27:56 +0000
Subject: [PATCH] ALSA: hda: remove redundant assignment to variable timeout
Message-Id: <20200208222756.37707-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Baolin Wang <baolin.wang@linaro.org>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable timeout is being assigned with the value 200 that is never
read, it is assigned a new value in a following do-loop. The assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/hda/hda_controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 2609e391ce54..9765652a73d7 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -373,7 +373,7 @@ static int azx_get_sync_time(ktime_t *device,
 	u32 wallclk_ctr, wallclk_cycles;
 	bool direction;
 	u32 dma_select;
-	u32 timeout = 200;
+	u32 timeout;
 	u32 retry_count = 0;
 
 	runtime = substream->runtime;
-- 
2.25.0
