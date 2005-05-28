From: Chuck Short <zulcss@gmail.com>
Date: Sat, 28 May 2005 01:32:49 +0000
Subject: [KJ] [PATCH] net/ipv6/* - compile warning cleanup
Message-Id: <4297CA41.60901@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030506090201050906010704"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030506090201050906010704
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

compile warning cleanup - handle copy_to/from_user error
returns

Signed-off-by: Chuck Short <zulcss@gmail.com>


--------------030506090201050906010704
Content-Type: text/x-patch;
 name="return_code-net_ipv6.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="return_code-net_ipv6.patch"

diff -Naur linux-source-2.6.12-2.6.11.93.orig/net/ipv6/ip6_flowlabel.c linux-source-2.6.12-2.6.11.93/net/ipv6/ip6_flowlabel.c
--- linux-source-2.6.12-2.6.11.93.orig/net/ipv6/ip6_flowlabel.c	2005-04-07 08:57:19.000000000 -0400
+++ linux-source-2.6.12-2.6.11.93/net/ipv6/ip6_flowlabel.c	2005-05-27 21:15:57.628039336 -0400
@@ -537,8 +537,10 @@
 
 		/* Do not check for fault */
 		if (!freq.flr_label)
-			copy_to_user(&((struct in6_flowlabel_req __user *) optval)->flr_label,
-				     &fl->label, sizeof(fl->label));
+			if(copy_to_user(&((struct in6_flowlabel_req __user *) optval)->flr_label,&fl->label, sizeof(fl->label))) {
+				err = -EFAULT;
+				goto done;
+			}
 
 		sfl1->fl = fl;
 		sfl1->next = np->ipv6_fl_list;

--------------030506090201050906010704
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030506090201050906010704--
