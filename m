From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 18 Mar 2015 12:51:52 +0000
Subject: [PATCH] Staging: dgnc: release the lock before testing for nullity
Message-Id: <1426683112-24182-1-git-send-email-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lidza Louina <lidza.louina@gmail.com>
Cc: devel@driverdev.osuosl.org, Quentin Lambert <lambert.quentin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fixes: c84a083b995b ("Staging: dgnc: Use goto for spinlock release before return")

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 8445f84ddaa3..f1c4d07a0aaa 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -656,9 +656,9 @@ void dgnc_input(struct channel_t *ch)
 	return;
 
 exit_unlock:
+	spin_unlock_irqrestore(&ch->ch_lock, flags);
 	if (ld)
 		tty_ldisc_deref(ld);
-	spin_unlock_irqrestore(&ch->ch_lock, flags);
 }
 
 
-- 
2.3.2.223.g7a9409c

