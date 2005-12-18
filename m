From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Sun, 18 Dec 2005 22:52:51 +0000
Subject: [KJ] [Patch 1/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <1134946371.7394.5.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63044341757670197=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63044341757670197==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this removes LINUX_VERSION_CODE checks in typhoon.c

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/net/typhoon.c.orig	2005-12-18 23:42:15.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/net/typhoon.c	2005-12-18 23:44:37.000000000 +0100
@@ -333,11 +333,7 @@ enum state_values {
 #define TYPHOON_RESET_TIMEOUT_NOSLEEP	((6 * 1000000) / TYPHOON_UDELAY)
 #define TYPHOON_WAIT_TIMEOUT		((1000000 / 2) / TYPHOON_UDELAY)
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 5, 28)
-#define typhoon_synchronize_irq(x) synchronize_irq()
-#else
 #define typhoon_synchronize_irq(x) synchronize_irq(x)
-#endif
 
 #if defined(NETIF_F_TSO)
 #define skb_tso_size(x)		(skb_shinfo(x)->tso_size)



--===============63044341757670197==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63044341757670197==--
