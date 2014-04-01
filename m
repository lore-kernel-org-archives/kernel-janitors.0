From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 01 Apr 2014 13:49:17 +0000
Subject: [PATCH 1/3] memstick: replace del_timer by del_timer_sync
Message-Id: <1396360159-16244-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1396360159-16244-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1396360159-16244-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Dubov <oakad@yahoo.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use del_timer_sync to ensure that the timer is stopped on all CPUs before
the driver exits.

This change was suggested by Thomas Gleixner.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier i,t,ex;
@@
struct t i = { .remove = ex, };

@@
identifier r.ex;
@@
ex(...) {
  <...
- del_timer
+ del_timer_sync
    (...)
  ...>
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Not tested.

 drivers/memstick/host/tifm_ms.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm_ms.c
index 7bafa72..bc643d7 100644
--- a/drivers/memstick/host/tifm_ms.c
+++ b/drivers/memstick/host/tifm_ms.c
@@ -605,7 +605,7 @@ static void tifm_ms_remove(struct tifm_dev *sock)
 	spin_lock_irqsave(&sock->lock, flags);
 	host->eject = 1;
 	if (host->req) {
-		del_timer(&host->timer);
+		del_timer_sync(&host->timer);
 		writel(TIFM_FIFO_INT_SETALL,
 		       sock->addr + SOCK_DMA_FIFO_INT_ENABLE_CLEAR);
 		writel(TIFM_DMA_RESET, sock->addr + SOCK_DMA_CONTROL);

