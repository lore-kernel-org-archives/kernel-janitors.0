From: Chuck Short <zulcss@gmail.com>
Date: Mon, 30 May 2005 02:09:23 +0000
Subject: [KJ] [PATCH] net/ipv4/route warnings
Message-Id: <429A75D3.3030808@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090308030607030408080500"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090308030607030408080500
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This patch fixes gcc4 warnings in net/ipv4/route.c

Signed-off by: Chuck Short <zulcss@gmail.com>



--------------090308030607030408080500
Content-Type: text/plain;
 name="ipv4-route_gcc4_warning"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipv4-route_gcc4_warning"

diff -Naur linux-source-2.6.12-2.6.11.93.orig/net/ipv4/route.c linux-source-2.6.12-2.6.11.93/net/ipv4/route.c
--- linux-source-2.6.12-2.6.11.93.orig/net/ipv4/route.c	2005-05-08 02:11:18.000000000 -0400
+++ linux-source-2.6.12-2.6.11.93/net/ipv4/route.c	2005-05-29 14:32:35.464664496 -0400
@@ -1767,7 +1767,7 @@
 				       struct in_device *in_dev,
 				       u32 daddr, u32 saddr, u32 tos)
 {
-	struct rtable* rth;
+	struct rtable* rth = NULL;
 	int err;
 	unsigned hash;
 
@@ -1794,7 +1794,7 @@
 				   u32 daddr, u32 saddr, u32 tos)
 {
 #ifdef CONFIG_IP_ROUTE_MULTIPATH_CACHED
-	struct rtable* rth;
+	struct rtable* rth = NULL;
 	unsigned char hop, hopcount, lasthop;
 	int err = -EINVAL;
 	unsigned int hash;
@@ -2239,7 +2239,7 @@
 					struct net_device *dev_out,
 					unsigned flags)
 {
-	struct rtable *rth;
+	struct rtable *rth = NULL;
 	int err = __mkroute_output(&rth, res, fl, oldflp, dev_out, flags);
 	unsigned hash;
 	if (err == 0) {
@@ -2267,7 +2267,7 @@
 	unsigned char hop;
 	unsigned hash;
 	int err = -EINVAL;
-	struct rtable *rth;
+	struct rtable *rth = NULL;
 
 	if (res->fi && res->fi->fib_nhs > 1) {
 		unsigned char hopcount = res->fi->fib_nhs;

--------------090308030607030408080500
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090308030607030408080500--
