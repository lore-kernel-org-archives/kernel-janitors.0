From: Amit Gud <amitg@calsoftinc.com>
Date: Thu, 20 Jan 2005 15:36:46 +0000
Subject: [KJ] [PATCH] unified spinlock initialization
Message-Id: <200501202054.49099.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34897126894642749=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org

--===============34897126894642749==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Unify the spinlock initialization as far as possible.

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>


--- vanilla-2.6.10/arch/um/drivers/net_kern.c	2005-01-19 11:19:23.000000000 +0530
+++ linux-2.6.10/arch/um/drivers/net_kern.c	2005-01-20 20:28:31.000000000 +0530
@@ -30,7 +30,7 @@
 #include "irq_user.h"
 #include "irq_kern.h"
 
-static spinlock_t opened_lock = SPIN_LOCK_UNLOCKED;
+static spinlock_t opened_lock;
 LIST_HEAD(opened);
 
 static int uml_net_rx(struct net_device *dev)
@@ -286,7 +286,7 @@ void uml_net_user_timer_expire(unsigned 
 #endif
 }
 
-static spinlock_t devices_lock = SPIN_LOCK_UNLOCKED;
+static spinlock_t devices_lock;
 static struct list_head devices = LIST_HEAD_INIT(devices);
 
 static int eth_configure(int n, void *init, char *mac,
@@ -371,7 +371,6 @@ static int eth_configure(int n, void *in
 	save = lp->user[0];
 	*lp = ((struct uml_net_private)
 		{ .list  		= LIST_HEAD_INIT(lp->list),
-		  .lock 		= SPIN_LOCK_UNLOCKED,
 		  .dev 			= dev,
 		  .fd 			= -1,
 		  .mac 			= { 0xfe, 0xfd, 0x0, 0x0, 0x0, 0x0},
@@ -387,6 +386,7 @@ static int eth_configure(int n, void *in
 		  .set_mtu 		= transport->user->set_mtu,
 		  .user  		= { save } });
 
+	spin_lock_init(&lp->lock);
 	init_timer(&lp->tl);
 	lp->tl.function = uml_net_user_timer_expire;
 	if (lp->have_mac)
@@ -679,6 +679,8 @@ static int uml_net_init(void)
 	struct in_device *ip;
 	struct in_ifaddr *in;
 
+	spin_lock_init(&opened_lock);
+	spin_lock_init(&devices_lock);
 	mconsole_register_dev(&net_mc);
 	register_inetaddr_notifier(&uml_inetaddr_notifier);
 


--===============34897126894642749==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34897126894642749==--
