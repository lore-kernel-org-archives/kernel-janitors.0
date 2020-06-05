From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2020 11:01:34 +0000
Subject: [PATCH] ALSA: emu10k1: delete an unnecessary condition
Message-Id: <20200605110134.GC978434@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org

The "val" variable is an unsigned int so it's always <= UINT_MAX.  This
check is always true so it can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/pci/emu10k1/emu10k1x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index ddb7c2ce3f7c9..def8161cde4c2 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -1040,7 +1040,7 @@ static void snd_emu10k1x_proc_reg_write(struct snd_info_entry *entry,
 		if (sscanf(line, "%x %x %x", &reg, &channel_id, &val) != 3)
 			continue;
 
-		if (reg < 0x49 && val <= 0xffffffff && channel_id <= 2)
+		if (reg < 0x49 && channel_id <= 2)
 			snd_emu10k1x_ptr_write(emu, reg, channel_id, val);
 	}
 }
-- 
2.26.2
