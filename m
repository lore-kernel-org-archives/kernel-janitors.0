From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:52 +0000
Subject: [KJ] [PATCH][RESUBMIT][5/21] drivers/isdn/hisax/* - compile warning
Message-Id: <42113C2C.16731.52BBCF@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54997730886043161=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54997730886043161==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle copy_to/from_user error 
returns

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/isdn/hisax/config.c linux-2.6.11-rc3-mm2/drivers/isdn/hisax/config.c
--- linux-2.6.11-rc3-mm2-original/drivers/isdn/hisax/config.c	2005-02-12 12:06:24.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/isdn/hisax/config.c	2005-02-13 21:21:52.000000000 +0200
@@ -631,7 +631,12 @@ int HiSax_readstatus(u_char __user *buf,
 		count = cs->status_end - cs->status_read + 1;
 		if (count >= len)
 			count = len;
-		copy_to_user(p, cs->status_read, count);
+		if (copy_to_user(p, cs->status_read, count)) {
+			printk(KERN_ERR
+				"HiSax:%s: copy_to_user failed!\n",
+				__FUNCTION__);
+			return -EFAULT;
+		}
 		cs->status_read += count;
 		if (cs->status_read > cs->status_end)
 			cs->status_read = cs->status_buf;
@@ -642,7 +647,12 @@ int HiSax_readstatus(u_char __user *buf,
 				cnt = HISAX_STATUS_BUFSIZE;
 			else
 				cnt = count;
-			copy_to_user(p, cs->status_read, cnt);
+			if (copy_to_user(p, cs->status_read, cnt)) {
+				printk(KERN_ERR
+					"HiSax:%s: copy_to_user failed!\n",
+					__FUNCTION__);
+				return -EFAULT;
+			}
 			p += cnt;
 			cs->status_read += cnt % HISAX_STATUS_BUFSIZE;
 			count -= cnt;




--===============54997730886043161==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54997730886043161==--
