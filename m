From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Apr 2015 13:19:46 +0000
Subject: [patch v2] ALSA: hda - potential (but unlikely) uninitialized variable
Message-Id: <20150417131946.GA24502@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <s5h383zx6xu.wl-tiwai@suse.de>
In-Reply-To: <s5h383zx6xu.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

This function is a bit unusual because it accepts negative values as
"conn_len".  It's theoretically possible for both "cache_len" and
"conn_len" to be -ENOSPC and in that case we would oops trying to run
memcmp() on the uninitialized "list" pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Don't print a negative error code as "In-driver Connection."

diff --git a/sound/pci/hda/hda_proc.c b/sound/pci/hda/hda_proc.c
index ee62307..2f00886 100644
--- a/sound/pci/hda/hda_proc.c
+++ b/sound/pci/hda/hda_proc.c
@@ -582,8 +582,8 @@ static void print_conn_list(struct snd_info_buffer *buffer,
 
 	/* Get Cache connections info */
 	cache_len = snd_hda_get_conn_list(codec, nid, &list);
-	if (cache_len != conn_len
-			|| memcmp(list, conn, conn_len)) {
+	if (cache_len >= 0 && (cache_len != conn_len ||
+			      memcmp(list, conn, conn_len) != 0)) {
 		snd_iprintf(buffer, "  In-driver Connection: %d\n", cache_len);
 		if (cache_len > 0) {
 			snd_iprintf(buffer, "    ");
