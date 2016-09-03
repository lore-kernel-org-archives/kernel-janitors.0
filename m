From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 03 Sep 2016 05:33:29 +0000
Subject: [PATCH] RDS: Simplify code
Message-Id: <1472880809-29216-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>

Calling 'list_splice' followed by 'INIT_LIST_HEAD' is equivalent to
'list_splice_init'.

This has been spotted with the following coccinelle script:
/////
@@
expression y,z;
@@

-   list_splice(y,z);
-   INIT_LIST_HEAD(y);
+   list_splice_init(y,z);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/rds/loop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/rds/loop.c b/net/rds/loop.c
index f2bf78de5688..c3e6da4fdf97 100644
--- a/net/rds/loop.c
+++ b/net/rds/loop.c
@@ -167,8 +167,7 @@ void rds_loop_exit(void)
 
 	/* avoid calling conn_destroy with irqs off */
 	spin_lock_irq(&loop_conns_lock);
-	list_splice(&loop_conns, &tmp_list);
-	INIT_LIST_HEAD(&loop_conns);
+	list_splice_init(&loop_conns, &tmp_list);
 	spin_unlock_irq(&loop_conns_lock);
 
 	list_for_each_entry_safe(lc, _lc, &tmp_list, loop_node) {
-- 
2.7.4

