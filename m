From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:29 +0000
Subject: [KJ] [PATCH][8/26] drivers/isdn/pcbit/* - compile warning cleanup
Message-Id: <420BEF85.32126.5878BE@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97131169749867219=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97131169749867219==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle copy_to/from_user error 
returns

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/isdn/pcbit/drv.c linux-2.6.11-rc3-mm/drivers/isdn/pcbit/drv.c
--- linux-2.6.11-rc3-mm-original/drivers/isdn/pcbit/drv.c	2005-02-03 03:56:22.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/isdn/pcbit/drv.c	2005-02-07 20:21:43.000000000 +0200
@@ -727,23 +727,26 @@ int pcbit_stat(u_char __user *buf, int l
 
 	if (stat_st < stat_end)
 	{
-		copy_to_user(buf, statbuf + stat_st, len);
+		if(copy_to_user(buf, statbuf + stat_st, len))
+			return -EFAULT;
 		stat_st += len;	   
 	}
 	else
 	{
 		if (len > STATBUF_LEN - stat_st)
 		{
-			copy_to_user(buf, statbuf + stat_st, 
-				       STATBUF_LEN - stat_st);
-			copy_to_user(buf, statbuf, 
-				       len - (STATBUF_LEN - stat_st));
+			if(copy_to_user(buf, statbuf + stat_st, 
+				       STATBUF_LEN - stat_st) ||
+				copy_to_user(buf, statbuf, 
+				       len - (STATBUF_LEN - stat_st)))
+				return -EFAULT;
 
 			stat_st = len - (STATBUF_LEN - stat_st);
 		}
 		else
 		{
-			copy_to_user(buf, statbuf + stat_st, len);
+			if(copy_to_user(buf, statbuf + stat_st, len))
+				return -EFAULT;
 
 			stat_st += len;
 			




--===============97131169749867219==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97131169749867219==--
