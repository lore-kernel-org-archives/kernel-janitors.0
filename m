From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 30 Jan 2004 18:07:59 +0000
Subject: [Kernel-janitors] [REDIFF] Fix warning in drivers/net/pppoe.c when
Message-Id: <1075486079.2354.40.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073582302.6115.42.camel@telecentrolivre>
In-Reply-To: <1073582302.6115.42.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


hi all,

this version have the Matthew's hints.

diff -X dontdiff -Nru linux-2.6.2-rc2-bk4/drivers/net/pppoe.c linux-2.6.2-rc2-bk4~/drivers/net/pppoe.c
--- linux-2.6.2-rc2-bk4/drivers/net/pppoe.c	2004-01-30 15:14:28.000000000 -0200
+++ linux-2.6.2-rc2-bk4~/drivers/net/pppoe.c	2004-01-30 13:24:15.000000000 -0200
@@ -1076,6 +1076,20 @@
 	.llseek		= seq_lseek,
 	.release	= seq_release,
 };
+
+static int __init pppoe_proc_init(void)
+{
+	struct proc_dir_entry *p;
+
+	p = create_proc_entry("pppoe", S_IRUGO, proc_net);
+	if (!p)
+		return 1;
+	
+	p->proc_fops = &pppoe_seq_fops;
+	return 0;
+}
+#else /* CONFIG_PROC_FS */
+static inline int pppoe_proc_init(void) { return 1; }
 #endif /* CONFIG_PROC_FS */
 
 /* ->ioctl are set at pppox_create */
@@ -1112,26 +1126,19 @@
 
 	if (err)
 		goto out;
-#ifdef CONFIG_PROC_FS
-{
-	struct proc_dir_entry *p = create_proc_entry("pppoe", S_IRUGO,
-						     proc_net);
-	err = -ENOMEM;
-	if (!p)
-		goto out_unregister;
+
+	err = pppoe_proc_init();
+	if (err) {
+		unregister_pppox_proto(PX_PROTO_OE);
+		err = -ENOMEM;
+		goto out;
+	}
 	
-	p->proc_fops = &pppoe_seq_fops;
-	err = 0;
-}
-#endif /* CONFIG_PROC_FS */
 	dev_add_pack(&pppoes_ptype);
 	dev_add_pack(&pppoed_ptype);
 	register_netdevice_notifier(&pppoe_notifier);
 out:
 	return err;
-out_unregister:
-	unregister_pppox_proto(PX_PROTO_OE);
-	goto out;
 }
 
 static void __exit pppoe_exit(void)


-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
