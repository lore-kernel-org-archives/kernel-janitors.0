From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Oct 2018 11:09:59 +0000
Subject: [PATCH] staging: speakup: clean up few indentation issues
Message-Id: <20181030110959.1471-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, speakup@linux-speakup.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up indentation issues across the driver

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/speakup/kobjects.c      | 2 +-
 drivers/staging/speakup/speakup_decpc.c | 6 +++---
 drivers/staging/speakup/speakup_keypc.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/speakup/kobjects.c b/drivers/staging/speakup/kobjects.c
index 08f11cc17371..2e36d872662c 100644
--- a/drivers/staging/speakup/kobjects.c
+++ b/drivers/staging/speakup/kobjects.c
@@ -545,7 +545,7 @@ ssize_t spk_var_show(struct kobject *kobj, struct kobj_attribute *attr,
 	int rv = 0;
 	struct st_var_header *param;
 	struct var_t *var;
-		char *cp1;
+	char *cp1;
 	char *cp;
 	char ch;
 	unsigned long flags;
diff --git a/drivers/staging/speakup/speakup_decpc.c b/drivers/staging/speakup/speakup_decpc.c
index 6649309e0342..459ee0c0bd57 100644
--- a/drivers/staging/speakup/speakup_decpc.c
+++ b/drivers/staging/speakup/speakup_decpc.c
@@ -302,12 +302,12 @@ static void synth_flush(struct spk_synth *synth)
 	while (dt_ctrl(CTRL_flush)) {
 		if (--timeout = 0)
 			break;
-udelay(50);
+		udelay(50);
 	}
 	for (timeout = 0; timeout < 10; timeout++) {
 		if (dt_waitbit(STAT_dma_ready))
 			break;
-udelay(50);
+		udelay(50);
 	}
 	outb_p(DMA_sync, speakup_info.port_tts + 4);
 	outb_p(0, speakup_info.port_tts + 4);
@@ -315,7 +315,7 @@ udelay(50);
 	for (timeout = 0; timeout < 10; timeout++) {
 		if (!(dt_getstatus() & STAT_flushing))
 			break;
-udelay(50);
+		udelay(50);
 	}
 	dma_state = dt_getstatus() & STAT_dma_state;
 	dma_state ^= STAT_dma_state;
diff --git a/drivers/staging/speakup/speakup_keypc.c b/drivers/staging/speakup/speakup_keypc.c
index 3901734982a4..b788272da4f9 100644
--- a/drivers/staging/speakup/speakup_keypc.c
+++ b/drivers/staging/speakup/speakup_keypc.c
@@ -177,7 +177,7 @@ static void do_catch_up(struct spk_synth *synth)
 	jiffy_delta = spk_get_var(JIFFY);
 	delay_time = spk_get_var(DELAY);
 	full_time = spk_get_var(FULL);
-spin_lock_irqsave(&speakup_info.spinlock, flags);
+	spin_lock_irqsave(&speakup_info.spinlock, flags);
 	jiffy_delta_val = jiffy_delta->u.n.value;
 	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
 
-- 
2.19.1
