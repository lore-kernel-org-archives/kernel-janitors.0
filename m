From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 26 Dec 2014 14:35:48 +0000
Subject: [PATCH 18/27] iwl4965: Use setup_timer
Message-Id: <1419604558-29743-18-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislaw Gruszka <sgruszka@redhat.com>
Cc: kernel-janitors@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Convert a call to init_timer and accompanying intializations of
the timer's data and function fields to a call to setup_timer.

A simplified version of the semantic match that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression t,f,d;
@@

-init_timer(&t);
+setup_timer(&t,f,d);
-t.data = d;
-t.function = f;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/wireless/iwlegacy/4965-mac.c |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/iwlegacy/4965-mac.c b/drivers/net/wireless/iwlegacy/4965-mac.c
index 2748fde..976f65f 100644
--- a/drivers/net/wireless/iwlegacy/4965-mac.c
+++ b/drivers/net/wireless/iwlegacy/4965-mac.c
@@ -6247,13 +6247,10 @@ il4965_setup_deferred_work(struct il_priv *il)
 
 	INIT_WORK(&il->txpower_work, il4965_bg_txpower_work);
 
-	init_timer(&il->stats_periodic);
-	il->stats_periodic.data = (unsigned long)il;
-	il->stats_periodic.function = il4965_bg_stats_periodic;
+	setup_timer(&il->stats_periodic, il4965_bg_stats_periodic,
+		    (unsigned long)il);
 
-	init_timer(&il->watchdog);
-	il->watchdog.data = (unsigned long)il;
-	il->watchdog.function = il_bg_watchdog;
+	setup_timer(&il->watchdog, il_bg_watchdog, (unsigned long)il);
 
 	tasklet_init(&il->irq_tasklet,
 		     (void (*)(unsigned long))il4965_irq_tasklet,

