From: Colin King <colin.king@canonical.com>
Date: Sat, 08 Feb 2020 22:20:06 +0000
Subject: [PATCH] ALSA: hdsp: remove redundant assignment to variable err
Message-Id: <20200208222006.37376-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable err is being assigned with a value that is never read, it is
assigned a new value in the next statement. The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/rme9652/hdsp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index cc06f0a1a7e4..227aece17e39 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -3353,7 +3353,8 @@ snd_hdsp_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffer)
 				return;
 			}
 		} else {
-			int err = -EINVAL;
+			int err;
+
 			err = hdsp_request_fw_loader(hdsp);
 			if (err < 0) {
 				snd_iprintf(buffer,
-- 
2.25.0
