From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 20 Dec 2005 13:17:49 +0000
Subject: [KJ] [Patch 4/5] Cleanup MIN/MAX Macro usage in eicon/istream.c
Message-Id: <1135084670.24065.10.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41019936993796557=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============41019936993796557==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

This patch changes eicon/istream.c from MIN/MAX usage
to min/max.

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc6/drivers/isdn/hardware/eicon/istream.c.orig	2005-12-20 09:57:37.000000000 +0100
+++ linux-2.6.15-rc6/drivers/isdn/hardware/eicon/istream.c	2005-12-20 10:11:11.000000000 +0100
@@ -92,7 +92,7 @@ int diva_istream_write (void* context,
     return (-1); /* was not able to write       */
    break;     /* only part of message was written */
   }
-  to_write = MIN(length, DIVA_DFIFO_DATA_SZ);
+  to_write = min(length, DIVA_DFIFO_DATA_SZ);
   if (to_write) {
    a->ram_out_buffer (a,
 #ifdef PLATFORM_GT_32BIT
@@ -176,7 +176,7 @@ int diva_istream_read (void* context,
     return (-1); /* was not able to read */
    break;
   }
-  to_read = MIN(max_length, tmp[1]);
+  to_read = min(max_length, (int)tmp[1]);
   if (to_read) {
    a->ram_in_buffer(a,
 #ifdef PLATFORM_GT_32BIT



--===============41019936993796557==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41019936993796557==--
