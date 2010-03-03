From: Dan Carpenter <error27@gmail.com>
Date: Wed, 03 Mar 2010 07:13:49 +0000
Subject: [patch] riptide: clean up while loop
Message-Id: <20100303071349.GG5086@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

If getpaths() returned an odd number this would be a buffer under-run and an 
endless loop.  It turns out that getpaths() can only return even numbers, but 
let's make it easy for people auditing code.  With the new code you don't 
need to look at getpaths().

This silences a smatch warning.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index e66ef2b..a5924af 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1974,9 +1974,9 @@ snd_riptide_proc_read(struct snd_info_entry *entry,
 	}
 	snd_iprintf(buffer, "Paths:\n");
 	i = getpaths(cif, p);
-	while (i--) {
-		snd_iprintf(buffer, "%x->%x ", p[i - 1], p[i]);
-		i--;
+	while (i >= 2) {
+		i -= 2;
+		snd_iprintf(buffer, "%x->%x ", p[i], p[i + 1]);
 	}
 	snd_iprintf(buffer, "\n");
 }
