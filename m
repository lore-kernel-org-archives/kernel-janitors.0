From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Tue, 28 Mar 2006 12:19:33 +0000
Subject: [KJ][Patch][update] fix kbuild warning in iptable_nat.o
Message-Id: <1143548373.14792.9.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83521472822563547=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83521472822563547==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

Sorry but I just noticed that the last patch removed a static from the
init function. It really should have one, so here is an updated patch.

WARNING: net/ipv4/netfilter/iptable_nat.o - Section mismatch: reference
to .init.text:ip_nat_rule_init from .text between 'init_or_cleanup' (at
offset 0x455) and 'nat_decode_session'

This seems to be caused by init_or_cleanup() in
net/ip4/netfilter/ip_nat_standalone.c calling ip_nat_rule_init() in
net/ip4/netfilter/ip_nat_rule.c.

The problem is that init_or_cleanup() is called from both __init and
__exit functions, so is not marked as __init.

As iptable_nat.o seems to be compiled into the kernel (from
ip_nat_rule.c and ip_nat_standalone.c) by default, I don't think we need
the __exit function (correct me if I am wrong).

So the patch below removes the unneeded module unload stuff and renames
init_or_cleanup() to init() and marks it __init.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- net/ipv4/netfilter/ip_nat_standalone.c.orig	2006-03-28 21:38:33.000000000 +1100
+++ net/ipv4/netfilter/ip_nat_standalone.c	2006-03-28 23:12:37.000000000 +1100
@@ -354,14 +354,12 @@ static struct nf_hook_ops ip_nat_adjust_
 };
 
 
-static int init_or_cleanup(int init)
+static int __init init(void)
 {
-	int ret = 0;
+	int ret;
 
 	need_conntrack();
 
-	if (!init) goto cleanup;
-
 #ifdef CONFIG_XFRM
 	BUG_ON(ip_nat_decode_session != NULL);
 	ip_nat_decode_session = nat_decode_session;
@@ -403,8 +401,6 @@ static int init_or_cleanup(int init)
 	}
 	return ret;
 
- cleanup:
-	nf_unregister_hook(&ip_nat_local_in_ops);
  cleanup_localoutops:
 	nf_unregister_hook(&ip_nat_local_out_ops);
  cleanup_adjustout_ops:
@@ -425,17 +421,7 @@ static int init_or_cleanup(int init)
 	return ret;
 }
 
-static int __init init(void)
-{
-	return init_or_cleanup(1);
-}
-
-static void __exit fini(void)
-{
-	init_or_cleanup(0);
-}
 
 module_init(init);
-module_exit(fini);
 
 MODULE_LICENSE("GPL");



--===============83521472822563547==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83521472822563547==--
