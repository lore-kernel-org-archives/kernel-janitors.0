From: Domen Puncer <domen@coderock.org>
Date: Tue, 22 Feb 2005 12:24:51 +0000
Subject: [KJ] [patch] remove unused LOCAL_END_REQUEST
Message-Id: <20050222122451.GC4174@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93132383051044254=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============93132383051044254==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove last occurence of LOCAL_END_REQUEST.

domen@nd47:~/kernel/c$ grep LOCAL_END_REQUEST -R .
./drivers/block/floppy.c:#define LOCAL_END_REQUEST

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/block/floppy.c	2005-02-16 13:41:47.000000000 +0100
+++ a/drivers/block/floppy.c	2005-02-22 13:21:46.000000000 +0100
@@ -242,7 +242,6 @@ static int allowed_drive_mask = 0x33;
 
 static int irqdma_allocated;
 
-#define LOCAL_END_REQUEST
 #define DEVICE_NAME "floppy"
 
 #include <linux/blkdev.h>

--===============93132383051044254==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93132383051044254==--
