From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 30 Jan 2004 12:43:24 +0000
Subject: [Kernel-janitors] [REDIFF] Fix warning in drivers/net/pppoe.c when
Message-Id: <1075466604.10543.30.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073582302.6115.42.camel@telecentrolivre>
In-Reply-To: <1073582302.6115.42.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

 Here goes the rediff, it fixes this warning:

drivers/net/pppoe.c: In function `pppoe_init':
drivers/net/pppoe.c:1132: warning: label `out_unregister' defined but not used

 Look that I had changed the return values of pppoe_proc_init() to
match with the driver behaviour. Thus, when CONFIG_PROC_FS is not set,
pppoe_proc_init() is returning 1, instead of 0.

diff -X dontdiff -Nru linux-2.6.2-rc2-bk2/drivers/net/pppoe.c linux-2.6.2-rc2-bk2~/drivers/net/pppoe.c
--- linux-2.6.2-rc2-bk2/drivers/net/pppoe.c	2004-01-30 09:33:19.000000000 -0200
+++ linux-2.6.2-rc2-bk2~/drivers/net/pppoe.c	2004-01-30 09:53:40.000000000 -0200
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
+		return 1;
+	
+	p->proc_fops = &pppoe_seq_fops;
+	return 0;
+}
+#else /* CONFIG_PROC_FS */
+static int inline pppoe_proc_init(void) { return 1; }
 #endif /* CONFIG_PROC_FS */
 
 /* ->ioctl are set at pppox_create */
@@ -1112,26 +1126,18 @@
 
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
+	if ((err = pppoe_proc_init())) {
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
