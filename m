From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Fri, 04 Mar 2005 12:58:03 +0000
Subject: [KJ] [UPDATED PATCH] ixj* - compile warning cleanup
Message-Id: <4228777B.16022.2FAA16@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62129561653619714=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62129561653619714==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Domen,

Please, PLEASE immediately push this patch upstream to replace the 
previous patch that I submitted and seems to have been accepted for 
2.6.11-kj.  This has a fix for the dumb bug I introduced with a fix for 
"copy_to_user".

This is an urgent patch, since execution of the previously submitted code 
can cause a kernel crash/oops.

Sorry I was so slow to react to this.

Domen: note that there are very many strange things that happen when I 
try to apply the -kj patch to linux-2.6.11-rc5-mm1.  Lots of rejects and 
reversals, even one that halts "patch".

Thanks.

Stephen Biggs

Description: compile warning cleanup - suggested by Adrian Bunk; remove 
unmaintained rcs char strings from source and handle the occurrences of 
their use, make sure kernel-userspace issues taken care of; break out 
into separate patch

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc5-mm1-original/drivers/telephony/ixj.c linux-2.6.11-rc5-mm1/drivers/telephony/ixj.c
--- linux-2.6.11-rc5-mm1-original/drivers/telephony/ixj.c	2005-03-04 05:13:36.000000000 +0200
+++ linux-2.6.11-rc5-mm1/drivers/telephony/ixj.c	2005-03-04 10:55:16.000000000 +0200
@@ -41,9 +41,6 @@
  *
  ***************************************************************************/
 
-static char ixj_c_rcsid[] = "$Id: ixj.c,v 4.7 2001/08/13 06:19:33 craigs Exp $";
-static char ixj_c_revision[] = "$Revision: 4.7 $";
-
 /*
  * $Log: ixj.c,v $
  *
@@ -6172,8 +6169,14 @@ static int ixj_ioctl(struct inode *inode
 		retval = j->serial;
 		break;
 	case IXJCTL_VERSION:
-		if (copy_to_user(argp, ixj_c_revision, strlen(ixj_c_revision))) 
-			retval = -EFAULT;
+		{
+			char arg_str[100];
+			snprintf(arg_str, sizeof(arg_str),
+				"\nDriver version %i.%i.%i", IXJ_VER_MAJOR,
+				IXJ_VER_MINOR, IXJ_BLD_VER);
+			if (copy_to_user(argp, arg_str, strlen(arg_str))) 
+				retval = -EFAULT;
+		}
 		break;
 	case PHONE_RING_CADENCE:
 		j->ring_cadence = arg;
@@ -7168,9 +7171,6 @@ static int ixj_get_status_proc(char *buf
 	int cnt;
 	IXJ *j;
 	len = 0;
-	len += sprintf(buf + len, "%s", ixj_c_rcsid);
-	len += sprintf(buf + len, "\n%s", ixj_h_rcsid);
-	len += sprintf(buf + len, "\n%s", ixjuser_h_rcsid);
 	len += sprintf(buf + len, "\nDriver version %i.%i.%i", IXJ_VER_MAJOR, IXJ_VER_MINOR, IXJ_BLD_VER);
 	len += sprintf(buf + len, "\nsizeof IXJ struct %Zd bytes", sizeof(IXJ));
 	len += sprintf(buf + len, "\nsizeof DAA struct %Zd bytes", sizeof(DAA_REGS));
@@ -7790,7 +7790,7 @@ static int __init ixj_init(void)
 	if ((probe = ixj_probe_pci(&cnt)) < 0) {
 		return probe;
 	}
-	printk("%s\n", ixj_c_rcsid);
+	printk(KERN_INFO "ixj driver initialized.\n");
 	create_proc_read_entry ("ixj", 0, NULL, ixj_read_proc, NULL);
 	return probe;
 }
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc5-mm1-original/drivers/telephony/ixj.h linux-2.6.11-rc5-mm1/drivers/telephony/ixj.h
--- linux-2.6.11-rc5-mm1-original/drivers/telephony/ixj.h	2004-12-24 23:35:40.000000000 +0200
+++ linux-2.6.11-rc5-mm1/drivers/telephony/ixj.h	2005-03-04 05:20:11.000000000 +0200
@@ -38,8 +38,6 @@
  * TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
  *
  *****************************************************************************/
-static char ixj_h_rcsid[] = "$Id: ixj.h,v 4.1 2001/08/04 14:49:27 craigs Exp $";
-
 #define IXJ_VERSION 3031
 
 #include <linux/version.h>
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc5-mm1-original/include/linux/ixjuser.h 
--- linux-2.6.11-rc5-mm1-original/include/linux/ixjuser.h       2004-12-24 23:35:50.000000000 +0200
+++ linux-2.6.11-rc5-mm1/include/linux/ixjuser.h        2005-03-04 05:20:31.000000000 +0200
@@ -42,8 +42,6 @@
  *
  *****************************************************************************/
 
-static char ixjuser_h_rcsid[] = "$Id: ixjuser.h,v 4.1 2001/08/05 00:17:37 craigs Exp $";
-
 #include <linux/telephony.h>
 
 


--===============62129561653619714==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62129561653619714==--
