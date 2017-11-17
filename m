From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 17 Nov 2017 09:49:12 +0000
Subject: [PATCH 2/4] ALSA: riptide: Delete an unnecessary variable initialisation in snd_riptide_proc_read()
Message-Id: <1662947b-17be-10f4-50ef-2902d9470f53@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0eef2699-f28a-c1e0-9351-268b5eb7e0c1@users.sourceforge.net>
In-Reply-To: <0eef2699-f28a-c1e0-9351-268b5eb7e0c1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, David Howells <dhowells@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 17 Nov 2017 09:50:52 +0100

The variable "cif" will be set to an appropriate pointer a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/pci/riptide/riptide.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 22d15ea7e210..3d00488ff137 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1917,5 +1917,5 @@ snd_riptide_proc_read(struct snd_info_entry *entry,
 	struct snd_riptide *chip = entry->private_data;
 	struct pcmhw *data;
 	int i;
-	struct cmdif *cif = NULL;
+	struct cmdif *cif;
 	unsigned char p[256];
-- 
2.15.0

