From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 30 Jan 2004 12:43:56 +0000
Subject: [Kernel-janitors] [PATCH] Removes a not needed #ifdef/#endif
Message-Id: <1075466635.10543.32.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi all,

this #ifdef/#endif is not needed:

diff -X dontdiff -Nru linux-2.6.2-rc2-bk2/drivers/net/pppoe.c linux-2.6.2-rc2-bk2~/drivers/net/pppoe.c
--- linux-2.6.2-rc2-bk2/drivers/net/pppoe.c	2004-01-30 10:22:41.000000000 -0200
+++ linux-2.6.2-rc2-bk2~/drivers/net/pppoe.c	2004-01-30 10:20:24.000000000 -0200
@@ -1140,9 +1140,7 @@
 	dev_remove_pack(&pppoes_ptype);
 	dev_remove_pack(&pppoed_ptype);
 	unregister_netdevice_notifier(&pppoe_notifier);
-#ifdef CONFIG_PROC_FS
 	remove_proc_entry("pppoe", proc_net);
-#endif
 }
 
 module_init(pppoe_init);

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
