From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Oct 2017 11:53:21 +0000
Subject: [PATCH] ALSA: au88x0: remove redundant assignment of variable i
Message-Id: <20171017115321.19713-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment to variable i is redundant as it is never read
because it is updated a little later on. Remove this assignment.
Cleans up clang warning: Value stored to 'i' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/au88x0/au88x0_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/au88x0/au88x0_core.c b/sound/pci/au88x0/au88x0_core.c
index c308a4f70550..4083c8b01619 100644
--- a/sound/pci/au88x0/au88x0_core.c
+++ b/sound/pci/au88x0/au88x0_core.c
@@ -2628,7 +2628,7 @@ static void vortex_spdif_init(vortex_t * vortex, int spdif_sr, int spdif_mode)
 			else
 				edi = 0x1ffff;
 		} else {
-			i = edi = 0x800;
+			edi = 0x800;
 		}
 		/* this_04 and this_08 are the CASp4Src's (samplerate converters) */
 		vortex_src_setupchannel(vortex, this_04, edi, 0, 1,
-- 
2.14.1

