From: Dan Carpenter <error27@gmail.com>
Date: Wed, 03 Mar 2010 07:08:18 +0000
Subject: [patch] oxygen: change || to &&
Message-Id: <20100303070818.GD5086@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Clemens Ladisch <clemens@ladisch.de>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In the original code the condition was always true (hopefully) because
WM8776_HPLVOL is zero.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/pci/oxygen/xonar_wm87x6.c b/sound/pci/oxygen/xonar_wm87x6.c
index 7754db1..dbc4b89 100644
--- a/sound/pci/oxygen/xonar_wm87x6.c
+++ b/sound/pci/oxygen/xonar_wm87x6.c
@@ -68,7 +68,7 @@ static void wm8776_write(struct oxygen *chip,
 			 OXYGEN_SPI_CEN_LATCH_CLOCK_LO,
 			 (reg << 9) | value);
 	if (reg < ARRAY_SIZE(data->wm8776_regs)) {
-		if (reg >= WM8776_HPLVOL || reg <= WM8776_DACMASTER)
+		if (reg >= WM8776_HPLVOL && reg <= WM8776_DACMASTER)
 			value &= ~WM8776_UPDATE;
 		data->wm8776_regs[reg] = value;
 	}
