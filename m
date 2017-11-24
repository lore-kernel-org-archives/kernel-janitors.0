From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Nov 2017 12:50:07 +0000
Subject: [PATCH] s390/drivers: use setup_timer instead of init_timer
Message-Id: <20171124125007.30704-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Wiedmann <jwi@linux.vnet.ibm.com>, Ursula Braun <ubraun@linux.vnet.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use setup_timer function instead of initializing timer with the
function and data fields.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/s390/net/fsm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/s390/net/fsm.c b/drivers/s390/net/fsm.c
index 8c14c6c3ad3d..16b81be1f07a 100644
--- a/drivers/s390/net/fsm.c
+++ b/drivers/s390/net/fsm.c
@@ -142,13 +142,11 @@ void
 fsm_settimer(fsm_instance *fi, fsm_timer *this)
 {
 	this->fi = fi;
-	this->tl.function = (void *)fsm_expire_timer;
-	this->tl.data = (long)this;
 #if FSM_TIMER_DEBUG
 	printk(KERN_DEBUG "fsm(%s): Create timer %p\n", fi->name,
 	       this);
 #endif
-	init_timer(&this->tl);
+	setup_timer(&this->tl, (void *)fsm_expire_timer, (long)this);
 }
 
 void
-- 
2.14.1

