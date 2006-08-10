From: Steven Jones <stevenj@mbase.com.au>
Date: Thu, 10 Aug 2006 06:29:27 +0000
Subject: [KJ] First cleanup patch
Message-Id: <1155191368.10382.20.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0002475672=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0002475672==
Content-Type: multipart/alternative;
    boundary="----------=_1155191417-17530-569"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1155191417-17530-569
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

G'day,
        This is my first attempt at patching something in the kernel so
be gentle. Actually, don't be gentle, but please be very descriptive in
exactly what it is I'm doing wrong. (I know there will be something).

This is a patch to check the return value of copy_to_user. I have got as
far as linking an allyes kernel with the patch applied but have not
booted it (I don't have the card in question). The only thing I was not
certain about in the patch is the possibility that the function could
infinite loop if copy_to_user continually failed completely. I don't
know if this is a real posibility, would anyone like to comment.

The patch is against 2.6.18-rc3.

PS. I am having difficulties fighting with evolution over line wraps,
can someone let me know if this ends up being html or clean text.

Signed-off-by: Steven Jones <sej@dohdo.com>


diff -ruNp orig/drivers/isdn/hisax/config.c work/drivers/isdn/hisax/config.c
--- orig/drivers/isdn/hisax/config.c	2006-08-09 14:57:00.000000000 +1000
+++ work/drivers/isdn/hisax/config.c	2006-08-10 13:27:25.000000000 +1000
@@ -619,6 +619,7 @@ struct IsdnCardState *hisax_get_card(int
 static int HiSax_readstatus(u_char __user *buf, int len, int id, int channel)
 {
 	int count, cnt;
+	int missed;
 	u_char __user *p = buf;
 	struct IsdnCardState *cs = hisax_findcard(id);
 
@@ -631,7 +632,8 @@ static int HiSax_readstatus(u_char __use
 		count = cs->status_end - cs->status_read + 1;
 		if (count >= len)
 			count = len;
-		copy_to_user(p, cs->status_read, count);
+		missed = copy_to_user(p, cs->status_read, count);
+		count -= missed;
 		cs->status_read += count;
 		if (cs->status_read > cs->status_end)
 			cs->status_read = cs->status_buf;
@@ -642,7 +644,8 @@ static int HiSax_readstatus(u_char __use
 				cnt = HISAX_STATUS_BUFSIZE;
 			else
 				cnt = count;
-			copy_to_user(p, cs->status_read, cnt);
+			missed = copy_to_user(p, cs->status_read, cnt);
+			cnt -= missed;
 			p += cnt;
 			cs->status_read += cnt % HISAX_STATUS_BUFSIZE;
 			count -= cnt;


------------=_1155191417-17530-569
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.10.3">
</HEAD>
<BODY>
<TT>G'day,</TT><BR>
<TT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This is my first attempt at patching something in the kernel so be gentle. Actually, don't be gentle, but please be very descriptive in exactly what it is I'm doing wrong. (I know there will be something).</TT><BR>
<BR>
<TT>This is a patch to check the return value of copy_to_user. I have got as far as linking an allyes kernel with the patch applied but have not booted it (I don't have the card in question). The only thing I was not certain about in the patch is the possibility that the function could</TT><BR>
<TT>infinite loop if copy_to_user continually failed completely. I don't know if this is a real posibility, would anyone like to comment.</TT><BR>
<BR>
<TT>The patch is against 2.6.18-rc3.</TT><BR>
<BR>
PS. I am having difficulties fighting with evolution over line wraps, can someone let me know if this ends up being html or clean text.<BR>
<BR>
<TT>Signed-off-by: Steven Jones &lt;<A HREF="mailto:sej@dohdo.com">sej@dohdo.com</A>&gt;</TT><BR>
<BR>
<PRE>
diff -ruNp orig/drivers/isdn/hisax/config.c work/drivers/isdn/hisax/config.c
--- orig/drivers/isdn/hisax/config.c	2006-08-09 14:57:00.000000000 +1000
+++ work/drivers/isdn/hisax/config.c	2006-08-10 13:27:25.000000000 +1000
@@ -619,6 +619,7 @@ struct IsdnCardState *hisax_get_card(int
 static int HiSax_readstatus(u_char __user *buf, int len, int id, int channel)
 {
 	int count, cnt;
+	int missed;
 	u_char __user *p = buf;
 	struct IsdnCardState *cs = hisax_findcard(id);
 
@@ -631,7 +632,8 @@ static int HiSax_readstatus(u_char __use
 		count = cs-&gt;status_end - cs-&gt;status_read + 1;
 		if (count &gt;= len)
 			count = len;
-		copy_to_user(p, cs-&gt;status_read, count);
+		missed = copy_to_user(p, cs-&gt;status_read, count);
+		count -= missed;
 		cs-&gt;status_read += count;
 		if (cs-&gt;status_read &gt; cs-&gt;status_end)
 			cs-&gt;status_read = cs-&gt;status_buf;
@@ -642,7 +644,8 @@ static int HiSax_readstatus(u_char __use
 				cnt = HISAX_STATUS_BUFSIZE;
 			else
 				cnt = count;
-			copy_to_user(p, cs-&gt;status_read, cnt);
+			missed = copy_to_user(p, cs-&gt;status_read, cnt);
+			cnt -= missed;
 			p += cnt;
 			cs-&gt;status_read += cnt % HISAX_STATUS_BUFSIZE;
 			count -= cnt;

</PRE>
</BODY>
</HTML>

------------=_1155191417-17530-569--

--===============0002475672==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0002475672==--
