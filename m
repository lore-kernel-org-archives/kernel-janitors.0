From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:18 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 5/16] ifdefs:
Message-Id: <20040508233818.GA4106@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24824525707605405=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24824525707605405==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- c/drivers/net/hamradio/dmascc.c	2004-04-04 05:36:57.000000000 +0200
+++ a/drivers/net/hamradio/dmascc.c	2004-05-08 22:44:02.000000000 +0200
@@ -48,21 +48,6 @@
 #include "z8530.h"
 
 
-/* Linux 2.2 and 2.3 compatibility */
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,14)
-#define net_device device
-#endif
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,43)
-#define netif_start_queue(dev) { dev->tbusy = 0; }
-#define netif_stop_queue(dev) { dev->tbusy = 1; }
-#define netif_wake_queue(dev) { dev->tbusy = 0; mark_bh(NET_BH); }
-#endif
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,47)
-#define netif_running(dev) (dev->flags & IFF_UP)
-#endif
-
-
 /* Number of buffers per channel */
 
 #define NUM_TX_BUF      2          /* NUM_TX_BUF >= 1 (min. 2 recommended) */
@@ -210,9 +195,6 @@
 };
 
 struct scc_priv {
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,0)
-  char name[IFNAMSIZ];
-#endif
   int type;
   int chip;
   struct net_device *dev;

--===============24824525707605405==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24824525707605405==--
