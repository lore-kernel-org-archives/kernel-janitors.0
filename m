From: irwan.djajadi@iname.com
Date: Mon, 03 Oct 2005 03:00:40 +0000
Subject: [KJ] [PATCH 2.6.13.2 1/1] pcf8563.c: removed MOD_INC/DEC_USE_COUNT
Message-Id: <20051003030040.GA25674@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13259888296807554=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============13259888296807554==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed MOD_INC/DEC_USE_COUNT from arch/cris/arch-v32/drivers/pcf8563.c. It
already has "owner: THIS_MODULE".

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruN 2.6/arch/cris/arch-v32/drivers/pcf8563.c mod-2.6/arch/cris/arch-v32/drivers/pcf8563.c
--- 2.6/arch/cris/arch-v32/drivers/pcf8563.c	2005-09-16 20:02:12.000000000 -0500
+++ mod-2.6/arch/cris/arch-v32/drivers/pcf8563.c	2005-10-02 16:58:58.000000000 -0500
@@ -326,14 +326,12 @@ pcf8563_ioctl(struct inode *inode, struc
 int
 pcf8563_open(struct inode *inode, struct file *filp)
 {
-	MOD_INC_USE_COUNT;
 	return 0;
 }
 
 int
 pcf8563_release(struct inode *inode, struct file *filp)
 {
-	MOD_DEC_USE_COUNT;
 	return 0;
 }
 

--===============13259888296807554==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13259888296807554==--
