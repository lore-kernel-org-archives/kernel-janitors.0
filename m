From: Colin King <colin.king@canonical.com>
Date: Wed, 02 May 2018 13:59:40 +0000
Subject: [PATCH] ALSA: sc6000: fix spelling mistake: "iomaped" -> "iomapped"
Message-Id: <20180502135940.30915-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in KERN_ERR error messages

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/isa/sc6000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/isa/sc6000.c b/sound/isa/sc6000.c
index c09d9b914efe..a985e9183be9 100644
--- a/sound/isa/sc6000.c
+++ b/sound/isa/sc6000.c
@@ -592,7 +592,7 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 	*vport = devm_ioport_map(devptr, port[dev], 0x10);
 	if (*vport = NULL) {
 		snd_printk(KERN_ERR PFX
-			   "I/O port cannot be iomaped.\n");
+			   "I/O port cannot be iomapped.\n");
 		err = -EBUSY;
 		goto err_unmap1;
 	}
@@ -607,7 +607,7 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 	vmss_port = devm_ioport_map(devptr, mss_port[dev], 4);
 	if (!vmss_port) {
 		snd_printk(KERN_ERR PFX
-			   "MSS port I/O cannot be iomaped.\n");
+			   "MSS port I/O cannot be iomapped.\n");
 		err = -EBUSY;
 		goto err_unmap2;
 	}
-- 
2.17.0

