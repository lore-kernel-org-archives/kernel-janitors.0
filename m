From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:54 +0000
Subject: [KJ] [PATCH][RESUBMIT][19/21]  kernel/* - compile warning cleanup
Message-Id: <42113C2E.7177.52C380@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50573869760903389=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50573869760903389==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle copy_to/from_user error 
returns

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/net/ipv6/ip6_flowlabel.c linux-2.6.11-rc3-mm2/net/ipv6/ip6_flowlabel.c
--- linux-2.6.11-rc3-mm2-original/net/ipv6/ip6_flowlabel.c	2005-02-12 12:06:27.000000000 +0200
+++ linux-2.6.11-rc3-mm2/net/ipv6/ip6_flowlabel.c	2005-02-12 19:17:48.000000000 +0200
@@ -537,9 +537,13 @@ release:
 			goto done;
 
 		/* Do not check for fault */
-		if (!freq.flr_label)
-			copy_to_user(&((struct in6_flowlabel_req __user *) optval)->flr_label,
-				     &fl->label, sizeof(fl->label));
+		if (!freq.flr_label) {
+			if (copy_to_user(&((struct in6_flowlabel_req __user *)optval)->flr_label,
+				     &fl->label, sizeof(fl->label))) {
+				err = -EFAULT;
+				goto done;
+			}
+		}
 
 		sfl1->fl = fl;
 		sfl1->next = np->ipv6_fl_list;




--===============50573869760903389==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50573869760903389==--
