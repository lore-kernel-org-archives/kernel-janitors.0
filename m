From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 29 Jan 2004 19:05:43 +0000
Subject: [Kernel-janitors] [PATCH] Fix warning in drivers/net/pppoe.c when
Message-Id: <1075403099.5628.61.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1074874158.5269.3.camel@telecentrolivre>
In-Reply-To: <1074874158.5269.3.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


hi,

When !CONFIG_PROC_FS, I'm getting this warning:

drivers/net/pppoe.c: In function `pppoe_init':
drivers/net/pppoe.c:1132: warning: label `out_unregister' defined but not used

this patch fixes that and removes a #ifdef/#endif inside a function. I
would like to hear comments about it.

diff -X dontdiff -Nru linux-2.6.2-rc2/drivers/net/pppoe.c linux-2.6.2-rc2~/drivers/net/pppoe.c
--- linux-2.6.2-rc2/drivers/net/pppoe.c	2004-01-29 09:19:48.000000000 -0200
+++ linux-2.6.2-rc2~/drivers/net/pppoe.c	2004-01-29 09:24:30.000000000 -0200
@@ -1076,6 +1076,20 @@
 	.llseek		= seq_lseek,
 	.release	= seq_release,
 };
+
+static int __init pppoe_proc_init(void)
+{
+	struct proc_dir_entry *p = create_proc_entry("pppoe", S_IRUGO,
+						     proc_net);
+
+	if (!p)
+		return 0;
+	
+	p->proc_fops = &pppoe_seq_fops;
+	return 1;
+}
+#else /* CONFIG_PROC_FS */
+static int inline pppoe_proc_init(void) { return 0; }
 #endif /* CONFIG_PROC_FS */
 
 /* ->ioctl are set at pppox_create */
@@ -1112,18 +1126,11 @@
 
 	if (err)
 		goto out;
-#ifdef CONFIG_PROC_FS
-{
-	struct proc_dir_entry *p = create_proc_entry("pppoe", S_IRUGO,
-						     proc_net);
+
 	err = -ENOMEM;
-	if (!p)
+	if (!(err = pppoe_proc_init()))
 		goto out_unregister;
 	
-	p->proc_fops = &pppoe_seq_fops;
-	err = 0;
-}
-#endif /* CONFIG_PROC_FS */
 	dev_add_pack(&pppoes_ptype);
 	dev_add_pack(&pppoed_ptype);
 	register_netdevice_notifier(&pppoe_notifier);


-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
