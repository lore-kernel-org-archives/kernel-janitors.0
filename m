From: Richard <h.vanberkum@chello.nl>
Date: Mon, 10 Jul 2006 15:30:43 +0000
Subject: [KJ] [PATCH] drivers/isdn/sc/init.c: check request_region for
Message-Id: <20060710172805.GA9866@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Check request_region() for return value

Signed-off-by: Richard van Berkum <h.vanberkum at chello.nl> 
---

The whole region is scaned for I/O ports and that same regions is
released at module_exit. So I let module_exit clean up the mess. Is
there a better way to solve this problem? 


 init.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)


--- linux-2.6/drivers/isdn/sc/init.c	2006-07-06 16:58:09.160792896 +0200
+++ mytree/drivers/isdn/sc/init.c	2006-07-09 15:07:36.371362184 +0200
@@ -354,8 +354,15 @@ static int __init sc_init(void)
 		sc_adapter[cinst]->iobase = io[b];
 		for(i = 0 ; i < MAX_IO_REGS - 1 ; i++) {
 			sc_adapter[cinst]->ioport[i] = io[b] + i * 0x400;
-			request_region(sc_adapter[cinst]->ioport[i], 1,
-					interface->id);
+			/*
+			 *check return value and let module_exit handle the release of the resources
+			 */
+			if (!(request_region(sc_adapter[cinst]->ioport[i], 1,
+					interface->id))) {
+				printk(KERN_ERR "Can't get I/O %X\n",sc_adapter[cinst]->ioport[i]);
+				return -ENODEV;
+			}
+			
 			pr_debug("Requesting I/O Port %#x\n",
 				sc_adapter[cinst]->ioport[i]);
 		}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
