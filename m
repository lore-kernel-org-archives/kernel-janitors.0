From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 26 Mar 2014 21:33:45 +0000
Subject: [PATCH 7/7] yam: replace del_timer by del_timer_sync
Message-Id: <1395869625-15209-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1395869625-15209-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1395869625-15209-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Paul Roubelat <jpr@f6fbb.org>
Cc: kernel-janitors@vger.kernel.org, tglx@linutronix.de, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use del_timer_sync to ensure that the timer is stopped on all CPUs before
the driver exists.

This change was suggested by Thomas Gleixner

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
declarer name module_exit;
identifier ex;
@@

module_exit(ex);

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

 drivers/net/hamradio/yam.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index 61dd244..8190165 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -1184,7 +1184,7 @@ static void __exit yam_cleanup_driver(void)
 	struct yam_mcs *p;
 	int i;
 
-	del_timer(&yam_timer);
+	del_timer_sync(&yam_timer);
 	for (i = 0; i < NR_PORTS; i++) {
 		struct net_device *dev = yam_devs[i];
 		if (dev) {

