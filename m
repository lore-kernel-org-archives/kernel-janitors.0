From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:27 +0000
Subject: [KJ] [PATCH][23/26] net/ipv6/* - compile warning cleanup
Message-Id: <420BEF83.675.5870BF@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16831229285836669=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============16831229285836669==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle copy_to/from_user error 
returns

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/net/ipv6/ip6_flowlabel.c linux-2.6.11-rc3-mm/net/ipv6/ip6_flowlabel.c
--- linux-2.6.11-rc3-mm-original/net/ipv6/ip6_flowlabel.c	2005-02-03 03:55:22.000000000 +0200
+++ linux-2.6.11-rc3-mm/net/ipv6/ip6_flowlabel.c	2005-02-08 15:51:16.000000000 +0200
@@ -537,9 +537,13 @@ release:
 			goto done;
 
 		/* Do not check for fault */
-		if (!freq.flr_label)
-			copy_to_user(&((struct in6_flowlabel_req __user *) optval)->flr_label,
-				     &fl->label, sizeof(fl->label));
+		if (!freq.flr_label) {
+			if(copy_to_user(&((struct in6_flowlabel_req __user *) optval)->flr_label,
+				     &fl->label, sizeof(fl->label))) {
+				err = -EFAULT;
+				goto done;
+			}
+		}
 
 		sfl1->fl = fl;
 		sfl1->next = np->ipv6_fl_list;




--===============16831229285836669==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16831229285836669==--
