From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Feb 2013 08:28:48 +0000
Subject: [patch] ALSA: ice1712: fix boundary check in snd_wm8766_write()
Message-Id: <20130207082848.GB18610@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Ondrej Zary <linux@rainbow-software.org>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

The wm->regs[] array has WM8766_REG_COUNT (16) elements not
WM8766_REG_RESET (31).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker thing, I can't test it.

diff --git a/sound/pci/ice1712/wm8766.c b/sound/pci/ice1712/wm8766.c
index 8072ade..e473f8a 100644
--- a/sound/pci/ice1712/wm8766.c
+++ b/sound/pci/ice1712/wm8766.c
@@ -31,7 +31,7 @@
 
 static void snd_wm8766_write(struct snd_wm8766 *wm, u16 addr, u16 data)
 {
-	if (addr < WM8766_REG_RESET)
+	if (addr < WM8766_REG_COUNT)
 		wm->regs[addr] = data;
 	wm->ops.write(wm, addr, data);
 }
