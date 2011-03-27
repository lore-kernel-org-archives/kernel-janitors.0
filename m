From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 27 Mar 2011 02:42:32 +0000
Subject: [PATCH 2/3] tg3: Don't use IRQF_SAMPLE_RANDOM
Message-Id: <1301193753-10045-2-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301193753-10045-1-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1301193753-10045-1-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Carlson <mcarlson@broadcom.com>
Cc: Michael Chan <mchan@broadcom.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Javier Martinez Canillas <martinez.javier@gmail.com>

This flag is scheduled for removal so we shouldn't used it.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/net/tg3.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/tg3.c b/drivers/net/tg3.c
index c67eb19..58c6049 100644
--- a/drivers/net/tg3.c
+++ b/drivers/net/tg3.c
@@ -8844,12 +8844,11 @@ static int tg3_request_irq(struct tg3 *tp, int irq_num)
 		fn = tg3_msi;
 		if (tp->tg3_flags2 & TG3_FLG2_1SHOT_MSI)
 			fn = tg3_msi_1shot;
-		flags = IRQF_SAMPLE_RANDOM;
 	} else {
 		fn = tg3_interrupt;
 		if (tp->tg3_flags & TG3_FLAG_TAGGED_STATUS)
 			fn = tg3_interrupt_tagged;
-		flags = IRQF_SHARED | IRQF_SAMPLE_RANDOM;
+		flags = IRQF_SHARED;
 	}
 
 	return request_irq(tnapi->irq_vec, fn, flags, name, tnapi);
@@ -8880,7 +8879,7 @@ static int tg3_test_interrupt(struct tg3 *tp)
 	}
 
 	err = request_irq(tnapi->irq_vec, tg3_test_isr,
-			  IRQF_SHARED | IRQF_SAMPLE_RANDOM, dev->name, tnapi);
+			  IRQF_SHARED, dev->name, tnapi);
 	if (err)
 		return err;
 
-- 
1.7.2.3

