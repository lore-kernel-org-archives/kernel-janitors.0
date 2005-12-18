From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Sun, 18 Dec 2005 22:54:49 +0000
Subject: [KJ] [Patch 3/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <1134946489.7394.9.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49023025706722123=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49023025706722123==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this removes LINUX_VERSION_CODE checks in irda/sir_kthread.c

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/net/irda/sir_kthread.c.orig	2005-12-18 23:47:24.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/net/irda/sir_kthread.c	2005-12-18 23:47:38.000000000 +0100
@@ -140,9 +140,6 @@ static int irda_thread(void *startup)
 		run_irda_queue();
 	}
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,35)
-	reparent_to_init();
-#endif
 	complete_and_exit(&irda_rq_queue.exit, 0);
 	/* never reached */
 	return 0;



--===============49023025706722123==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49023025706722123==--
