From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:28 +0000
Subject: [KJ] [PATCH][16/26] drivers/telephony/* - compile warning cleanup
Message-Id: <420BEF84.15430.587449@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91562396903436472=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============91562396903436472==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - give RCS id string "unused" 
attribute to silence compiler warning

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/telephony/ixj.h linux-2.6.11-rc3-mm/drivers/telephony/ixj.h
--- linux-2.6.11-rc3-mm-original/drivers/telephony/ixj.h	2005-02-03 03:57:04.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/telephony/ixj.h	2005-02-08 15:32:32.000000000 +0200
@@ -38,7 +38,7 @@
  * TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
  *
  *****************************************************************************/
-static char ixj_h_rcsid[] = "$Id: ixj.h,v 4.1 2001/08/04 14:49:27 craigs Exp $";
+static char __attribute__((__unused__)) ixj_h_rcsid[] = "$Id: ixj.h,v 4.1 2001/08/04 14:49:27 craigs Exp $";
 
 #define IXJ_VERSION 3031
 




--===============91562396903436472==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91562396903436472==--
