From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 20 Dec 2005 16:45:11 +0000
Subject: [KJ] [Patch] Remove MOD_{INC,DEC}_USE_COUNT in pcf8563.c
Message-Id: <1135097111.27486.6.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11684129709799018=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1135097000.27486.3.camel@alice>
In-Reply-To: <1135097000.27486.3.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============11684129709799018==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this is removes the last usage of MOD_{INC,DEC}_USE_COUNT
from the kernel. 

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc6/arch/cris/arch-v32/drivers/pcf8563.c.orig	2005-12-20 17:27:41.000000000 +0100
+++ linux-2.6.15-rc6/arch/cris/arch-v32/drivers/pcf8563.c	2005-12-20 17:28:22.000000000 +0100
@@ -48,14 +48,11 @@ static const unsigned char days_in_month
 	{ 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
 
 int pcf8563_ioctl(struct inode *, struct file *, unsigned int, unsigned long);
-int pcf8563_open(struct inode *, struct file *);
-int pcf8563_release(struct inode *, struct file *);
 
 static struct file_operations pcf8563_fops = {
 	owner: THIS_MODULE,
 	ioctl: pcf8563_ioctl,
-	open: pcf8563_open,
-	release: pcf8563_release,
+	open: nonseekable_open,
 };
 
 unsigned char
@@ -322,19 +319,5 @@ pcf8563_ioctl(struct inode *inode, struc
 	return 0;
 }
 
-int
-pcf8563_open(struct inode *inode, struct file *filp)
-{
-	MOD_INC_USE_COUNT;
-	return 0;
-}
-
-int
-pcf8563_release(struct inode *inode, struct file *filp)
-{
-	MOD_DEC_USE_COUNT;
-	return 0;
-}
-
 module_init(pcf8563_init);
 module_exit(pcf8563_exit);



--===============11684129709799018==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11684129709799018==--
