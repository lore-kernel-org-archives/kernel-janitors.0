From: Greg Aumann <Greg_Aumann@sil.org>
Date: Fri, 09 Apr 2004 12:57:39 +0000
Subject: [Kernel-janitors] com90xx error message patch
Message-Id: <40769DC3.9090409@sil.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000500010506060209030607"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000500010506060209030607
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

As there were no comments about yesterday's patch I will take it as good 
news and continue with another similar one.

This patch updates two error messages to reflect changes in the code.

The patch is against 2.6.5

I have compiled it successfully.

comments appreciated

Greg

--------------000500010506060209030607
Content-Type: text/x-patch;
 name="com90xx_error_msg.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="com90xx_error_msg.patch"

diff -x tags -Naur linux-2.6.5/drivers/net/arcnet/com90xx.c linux-2.6.5-kj/drivers/net/arcnet/com90xx.c
--- linux-2.6.5/drivers/net/arcnet/com90xx.c	2004-04-04 11:37:37.000000000 +0800
+++ linux-2.6.5-kj/drivers/net/arcnet/com90xx.c	2004-04-09 20:20:40.000000000 +0800
@@ -155,7 +155,7 @@
 		ioaddr = *port;
 
 		if (!request_region(*port, ARCNET_TOTAL_SIZE, "arcnet (90xx)")) {
-			BUGMSG2(D_INIT_REASONS, "(check_region)\n");
+			BUGMSG2(D_INIT_REASONS, "(request_region)\n");
 			BUGMSG2(D_INIT_REASONS, "S1: ");
 			BUGLVL(D_INIT_REASONS) numprint = 0;
 			*port-- = ports[--numports];
@@ -214,7 +214,7 @@
 		BUGMSG2(D_INIT, "%lXh ", *p);
 
 		if (!request_mem_region(*p, BUFFER_SIZE, "arcnet (90xx)")) {
-			BUGMSG2(D_INIT_REASONS, "(check_mem_region)\n");
+			BUGMSG2(D_INIT_REASONS, "(request_mem_region)\n");
 			BUGMSG2(D_INIT_REASONS, "Stage 3: ");
 			BUGLVL(D_INIT_REASONS) numprint = 0;
 			*p-- = shmems[--numshmems];

--------------000500010506060209030607
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000500010506060209030607--
