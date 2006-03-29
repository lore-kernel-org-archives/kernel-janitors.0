From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 29 Mar 2006 09:31:58 +0000
Subject: Re: [KJ][Patch][update2] fix kbuild warning in iptable_nat.o
Message-Id: <1143624718.7779.8.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============037324171908396542=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============037324171908396542==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-03-28 at 10:07 -0800, Randy.Dunlap wrote:

> 
> The cleanest thing that I can see to do is to separate the init and exit
> functions (like you have done somewhat) and duplicate the exit/cleanup code
> in its own function (but without the labels:).
> And put a comment on the exit function that it must (or should) be the same
> as the init function's error/cleanup path.
> 
> > > > So the patch below removes the unneeded module unload stuff and renames
> > > > init_or_cleanup() to init() and marks it __init.
> 
> ---
> ~Randy

Thanks for the advice.

Is something like this appropriate ? If it is yell out and I will do the
same thing for this one

WARNING: net/ipv4/netfilter/ip_conntrack.o - Section mismatch: reference
to .init.text:ip_conntrack_init from .text between 'init_or_cleanup' (at
offset 0x7ea) and '__hash_conntrack'

which is the same problem.

Also yell out if you want me to put symbolic names in, I didn't think it
was required/helpful, but you might.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-git13/net/ipv4/netfilter/ip_nat_standalone.c.orig	2006-03-28 21:38:33.000000000 +1100
+++ linux-2.6.16-git13/net/ipv4/netfilter/ip_nat_standalone.c	2006-03-29 19:56:07.000000000 +1100
@@ -354,14 +354,45 @@ static struct nf_hook_ops ip_nat_adjust_
 };
 
 
-static int init_or_cleanup(int init)
+/*	Note: This is used to clean up on unload
+**	but is also used in the init() error path
+**	to relinquish resourses before exiting
+*/
+static void cleanup(int clean_level)
+{
+
+	switch (clean_level) {
+	
+	case 0:
+		nf_unregister_hook(&ip_nat_local_in_ops);
+	case 1:
+		nf_unregister_hook(&ip_nat_local_out_ops);
+	case 2:
+		nf_unregister_hook(&ip_nat_adjust_out_ops);
+	case 3:
+		nf_unregister_hook(&ip_nat_adjust_in_ops);
+	case 4:
+		nf_unregister_hook(&ip_nat_out_ops);
+	case 5:
+		nf_unregister_hook(&ip_nat_in_ops);
+	case 6:
+		ip_nat_rule_cleanup();
+	case 7:
+#ifdef CONFIG_XFRM
+		ip_nat_decode_session = NULL;
+		synchronize_net();
+#endif
+	break;
+	}
+}
+
+
+static int __init init(void)
 {
 	int ret = 0;
 
 	need_conntrack();
 
-	if (!init) goto cleanup;
-
 #ifdef CONFIG_XFRM
 	BUG_ON(ip_nat_decode_session != NULL);
 	ip_nat_decode_session = nat_decode_session;
@@ -369,70 +400,50 @@ static int init_or_cleanup(int init)
 	ret = ip_nat_rule_init();
 	if (ret < 0) {
 		printk("ip_nat_init: can't setup rules.\n");
-		goto cleanup_decode_session;
+		cleanup(7);
+		return ret;
 	}
 	ret = nf_register_hook(&ip_nat_in_ops);
 	if (ret < 0) {
 		printk("ip_nat_init: can't register in hook.\n");
-		goto cleanup_rule_init;
+		cleanup(6);
+		return ret;
 	}
 	ret = nf_register_hook(&ip_nat_out_ops);
 	if (ret < 0) {
 		printk("ip_nat_init: can't register out hook.\n");
-		goto cleanup_inops;
+		cleanup(5);
+		return ret;
 	}
 	ret = nf_register_hook(&ip_nat_adjust_in_ops);
 	if (ret < 0) {
 		printk("ip_nat_init: can't register adjust in hook.\n");
-		goto cleanup_outops;
+		cleanup(4);
+		return ret;
 	}
 	ret = nf_register_hook(&ip_nat_adjust_out_ops);
 	if (ret < 0) {
 		printk("ip_nat_init: can't register adjust out hook.\n");
-		goto cleanup_adjustin_ops;
+		cleanup(3);
+		return ret;
 	}
 	ret = nf_register_hook(&ip_nat_local_out_ops);
 	if (ret < 0) {
 		printk("ip_nat_init: can't register local out hook.\n");
-		goto cleanup_adjustout_ops;
+		cleanup(2);
+		return ret;
 	}
 	ret = nf_register_hook(&ip_nat_local_in_ops);
 	if (ret < 0) {
 		printk("ip_nat_init: can't register local in hook.\n");
-		goto cleanup_localoutops;
+		cleanup(1);
 	}
 	return ret;
-
- cleanup:
-	nf_unregister_hook(&ip_nat_local_in_ops);
- cleanup_localoutops:
-	nf_unregister_hook(&ip_nat_local_out_ops);
- cleanup_adjustout_ops:
-	nf_unregister_hook(&ip_nat_adjust_out_ops);
- cleanup_adjustin_ops:
-	nf_unregister_hook(&ip_nat_adjust_in_ops);
- cleanup_outops:
-	nf_unregister_hook(&ip_nat_out_ops);
- cleanup_inops:
-	nf_unregister_hook(&ip_nat_in_ops);
- cleanup_rule_init:
-	ip_nat_rule_cleanup();
- cleanup_decode_session:
-#ifdef CONFIG_XFRM
-	ip_nat_decode_session = NULL;
-	synchronize_net();
-#endif
-	return ret;
-}
-
-static int __init init(void)
-{
-	return init_or_cleanup(1);
 }
 
 static void __exit fini(void)
 {
-	init_or_cleanup(0);
+	cleanup(0);
 }
 
 module_init(init);



--===============037324171908396542==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============037324171908396542==--
