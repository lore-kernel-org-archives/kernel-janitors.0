From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:27 +0000
Subject: [KJ] [PATCH][20/26] include/linux/* - compile warning cleanup
Message-Id: <420BEF83.21250.587255@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============066323408075949164=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============066323408075949164==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - give RCS id string "unused" 
attribute to silence compiler warning

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/include/linux/ixjuser.h linux-2.6.11-rc3-mm/include/linux/ixjuser.h
--- linux-2.6.11-rc3-mm-original/include/linux/ixjuser.h	2005-02-03 03:57:05.000000000 +0200
+++ linux-2.6.11-rc3-mm/include/linux/ixjuser.h	2005-02-08 15:32:55.000000000 +0200
@@ -42,7 +42,7 @@
  *
  *****************************************************************************/
 
-static char ixjuser_h_rcsid[] = "$Id: ixjuser.h,v 4.1 2001/08/05 00:17:37 craigs Exp $";
+static char  __attribute__((__unused__)) ixjuser_h_rcsid[] = "$Id: ixjuser.h,v 4.1 2001/08/05 00:17:37 craigs Exp $";
 
 #include <linux/telephony.h>
 




--===============066323408075949164==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============066323408075949164==--
