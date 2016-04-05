From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Tue, 05 Apr 2016 09:29:43 +0000
Subject: [PATCH 1/2] staging: dgnc: return -ENOMEM when kzalloc failed
Message-Id: <20160405092943.GA25140@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The kzalloc can be failed when memory is not enough
to allocate. When kzalloc failed, it need to return
error code with ENOMEM

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 074988d..e97faaa 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1106,6 +1106,14 @@ static int dgnc_tty_open(struct tty_struct *tty, struct file *file)
 	if (!ch->ch_wqueue)
 		ch->ch_wqueue = kzalloc(WQUEUESIZE, GFP_KERNEL);
 
+	if (!ch->ch_rqueue || !ch->ch_equeue || !ch->ch_wqueue) {
+		kfree(ch->ch_rqueue);
+		kfree(ch->ch_equeue);
+		kfree(ch->ch_wqueue);
+
+		return -ENOMEM;
+	}
+
 	spin_lock_irqsave(&ch->ch_lock, flags);
 
 	ch->ch_flags &= ~(CH_OPENING);
-- 
1.9.1

