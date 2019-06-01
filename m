From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 01 Jun 2019 04:12:14 +0000
Subject: [PATCH -next] ALSA: lx6464es - Remove set but not used variables 'orun_mask, urun_mask'
Message-Id: <20190601041214.99366-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Cc: YueHaibing <yuehaibing@huawei.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

sound/pci/lx6464es/lx_core.c: In function 'lx_interrupt_handle_async_events':
sound/pci/lx6464es/lx_core.c:990:6: warning:
 variable 'urun_mask' set but not used [-Wunused-but-set-variable]
sound/pci/lx6464es/lx_core.c:989:6: warning:
 variable 'orun_mask' set but not used [-Wunused-but-set-variable]

They are never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/pci/lx6464es/lx_core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
index 9236a1a8c49b..dd3a873777eb 100644
--- a/sound/pci/lx6464es/lx_core.c
+++ b/sound/pci/lx6464es/lx_core.c
@@ -986,8 +986,6 @@ static int lx_interrupt_handle_async_events(struct lx6464es *chip, u32 irqsrc,
 	 * Stat[8]	LSB overrun
 	 * */
 
-	u64 orun_mask;
-	u64 urun_mask;
 	int eb_pending_out = (irqsrc & MASK_SYS_STATUS_EOBO) ? 1 : 0;
 	int eb_pending_in  = (irqsrc & MASK_SYS_STATUS_EOBI) ? 1 : 0;
 
@@ -1010,9 +1008,6 @@ static int lx_interrupt_handle_async_events(struct lx6464es *chip, u32 irqsrc,
 			    *r_notified_out_pipe_mask);
 	}
 
-	orun_mask = ((u64)stat[7] << 32) + stat[8];
-	urun_mask = ((u64)stat[5] << 32) + stat[6];
-
 	/* todo: handle xrun notification */
 
 	return err;
