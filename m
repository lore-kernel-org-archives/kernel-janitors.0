From: Daniele Bellucci <bellucda@tiscali.it>
Date: Wed, 14 Jan 2004 23:01:52 +0000
Subject: [Kernel-janitors] [PATCH] better audit for: ipt_register_target
Message-Id: <20040114230152.GA16680@charlie.minidns.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org




Changes: ipt_register_target may return -EINTR too. If this happen let the module
         init function return ipt_register_target return value, rather than
         -EINVAL
	

Patch apply cleany (against 2.6.1-mm3) and compile good to me.

Please Apply.


--- linux-2.6.1-mm2/net/ipv4/netfilter/ipt_CLASSIFY.c~	2004-01-09 22:50:53.000000000 +0100
+++ linux-2.6.1-mm2/net/ipv4/netfilter/ipt_CLASSIFY.c	2004-01-14 23:48:48.000000000 +0100
@@ -71,10 +71,7 @@ static struct ipt_target ipt_classify_re
 
 static int __init init(void)
 {
-	if (ipt_register_target(&ipt_classify_reg))
-		return -EINVAL;
-
-	return 0;
+	return ipt_register_target(&ipt_classify_reg);
 }
 
 static void __exit fini(void)
--- linux-2.6.1-mm2/net/ipv4/netfilter/ipt_DSCP.c~	2004-01-09 22:50:53.000000000 +0100
+++ linux-2.6.1-mm2/net/ipv4/netfilter/ipt_DSCP.c	2004-01-14 23:49:16.000000000 +0100
@@ -91,10 +91,7 @@ static struct ipt_target ipt_dscp_reg = 
 
 static int __init init(void)
 {
-	if (ipt_register_target(&ipt_dscp_reg))
-		return -EINVAL;
-
-	return 0;
+	return ipt_register_target(&ipt_dscp_reg);
 }
 
 static void __exit fini(void)
--- linux-2.6.1-mm2/net/ipv4/netfilter/ipt_LOG.c~	2004-01-09 22:50:53.000000000 +0100
+++ linux-2.6.1-mm2/net/ipv4/netfilter/ipt_LOG.c	2004-01-14 23:50:05.000000000 +0100
@@ -404,10 +404,7 @@ static struct ipt_target ipt_log_reg = {
 
 static int __init init(void)
 {
-	if (ipt_register_target(&ipt_log_reg))
-		return -EINVAL;
-
-	return 0;
+	return ipt_register_target(&ipt_log_reg);
 }
 
 static void __exit fini(void)
--- linux-2.6.1-mm2/net/ipv4/netfilter/ipt_ECN.c~	2004-01-09 22:50:53.000000000 +0100
+++ linux-2.6.1-mm2/net/ipv4/netfilter/ipt_ECN.c	2004-01-14 23:49:46.000000000 +0100
@@ -155,10 +155,7 @@ static struct ipt_target ipt_ecn_reg = {
 
 static int __init init(void)
 {
-	if (ipt_register_target(&ipt_ecn_reg))
-		return -EINVAL;
-
-	return 0;
+	return ipt_register_target(&ipt_ecn_reg);
 }
 
 static void __exit fini(void)
--- linux-2.6.1-mm2/net/ipv4/netfilter/ipt_MARK.c~	2004-01-09 22:50:53.000000000 +0100
+++ linux-2.6.1-mm2/net/ipv4/netfilter/ipt_MARK.c	2004-01-14 23:50:25.000000000 +0100
@@ -59,10 +59,7 @@ static struct ipt_target ipt_mark_reg = 
 
 static int __init init(void)
 {
-	if (ipt_register_target(&ipt_mark_reg))
-		return -EINVAL;
-
-	return 0;
+	return ipt_register_target(&ipt_mark_reg);
 }
 
 static void __exit fini(void)
--- linux-2.6.1-mm2/net/ipv4/netfilter/ipt_REJECT.c~	2004-01-09 22:50:53.000000000 +0100
+++ linux-2.6.1-mm2/net/ipv4/netfilter/ipt_REJECT.c	2004-01-14 23:50:41.000000000 +0100
@@ -449,9 +449,7 @@ static struct ipt_target ipt_reject_reg 
 
 static int __init init(void)
 {
-	if (ipt_register_target(&ipt_reject_reg))
-		return -EINVAL;
-	return 0;
+	return ipt_register_target(&ipt_reject_reg);
 }
 
 static void __exit fini(void)
--- linux-2.6.1-mm2/net/ipv4/netfilter/ipt_TOS.c~	2004-01-09 22:50:53.000000000 +0100
+++ linux-2.6.1-mm2/net/ipv4/netfilter/ipt_TOS.c	2004-01-14 23:51:01.000000000 +0100
@@ -84,10 +84,7 @@ static struct ipt_target ipt_tos_reg = {
 
 static int __init init(void)
 {
-	if (ipt_register_target(&ipt_tos_reg))
-		return -EINVAL;
-
-	return 0;
+	return ipt_register_target(&ipt_tos_reg);
 }
 
 static void __exit fini(void)


-- 

Daniele.




"I could have made money this way, and perhaps amused myself writing code. 
But I knew that at the end of my career, I would look back on years of 
building walls to divide people, and feel I had spent my life making the 
world a worse place."                               
                                                          Richard Stallman

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
