From: "Om Narasimhan" <om.turyx@gmail.com>
Date: Mon, 18 Sep 2006 00:54:17 +0000
Subject: [KJ] potential crash fix : drivers/pcmcia/au1000_generic
Message-Id: <6b4e42d10609171754p4054762bm5711c744b61e68a0@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Tested by compiling.

I have not subscribed to pcmcia list. Please cc me any comments.

Signed off by Om Narasimhan <om.turyx@gmail.com>

 drivers/pcmcia/au1000_generic.c |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pcmcia/au1000_generic.c b/drivers/pcmcia/au1000_generic.c
index d5dd0ce..9a87a87 100644
--- a/drivers/pcmcia/au1000_generic.c
+++ b/drivers/pcmcia/au1000_generic.c
@@ -4,7 +4,7 @@
  *
  * Copyright 2001-2003 MontaVista Software Inc.
  * Author: MontaVista Software, Inc.
- *         	ppopov@embeddedalley.com or source@mvista.com
+ *			ppopov@embeddedalley.com or source@mvista.com
  *
  * Copyright 2004 Pete Popov, Embedded Alley Solutions, Inc.
  * Updated the driver to 2.6. Followed the sa11xx API and largely
@@ -438,17 +438,16 @@ #endif
 	dev_set_drvdata(dev, sinfo);
 	return 0;

-	do {
+out_err:
+	flush_scheduled_work();
+	ops->hw_shutdown(skt);
+	while (i-- > 0) {
 		struct au1000_pcmcia_socket *skt = PCMCIA_SOCKET(i);
-
 		del_timer_sync(&skt->poll_timer);
 		pcmcia_unregister_socket(&skt->socket);
-out_err:
 		flush_scheduled_work();
 		ops->hw_shutdown(skt);
-
-		i--;
-	} while (i > 0);
+	}
 	kfree(sinfo);
 out:
 	return ret;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
