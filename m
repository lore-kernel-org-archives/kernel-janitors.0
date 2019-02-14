From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 14 Feb 2019 01:56:56 +0000
Subject: [PATCH -next] ALSA: es1688: Remove set but not used variable 'hw'
Message-Id: <20190214021033.89964-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: YueHaibing <yuehaibing@huawei.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

sound/isa/es1688/es1688_lib.c: In function 'snd_es1688_probe':
sound/isa/es1688/es1688_lib.c:124:31: warning:
 variable 'hw' set but not used [-Wunused-but-set-variable]
  unsigned short major, minor, hw;
                               ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/isa/es1688/es1688_lib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index da341969e650..1d9556c045e9 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -121,7 +121,7 @@ EXPORT_SYMBOL(snd_es1688_reset);
 static int snd_es1688_probe(struct snd_es1688 *chip)
 {
 	unsigned long flags;
-	unsigned short major, minor, hw;
+	unsigned short major, minor;
 	int i;
 
 	/*
@@ -166,14 +166,12 @@ static int snd_es1688_probe(struct snd_es1688 *chip)
 	if (!chip->version)
 		return -ENODEV;	/* probably SB */
 
-	hw = ES1688_HW_AUTO;
 	switch (chip->version & 0xfff0) {
 	case 0x4880:
 		snd_printk(KERN_ERR "[0x%lx] ESS: AudioDrive ES488 detected, "
 			   "but driver is in another place\n", chip->port);
 		return -ENODEV;
 	case 0x6880:
-		hw = (chip->version & 0x0f) >= 8 ? ES1688_HW_1688 : ES1688_HW_688;
 		break;
 	default:
 		snd_printk(KERN_ERR "[0x%lx] ESS: unknown AudioDrive chip "
