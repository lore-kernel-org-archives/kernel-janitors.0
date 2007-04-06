From: Borislav Petkov <petkov@math.uni-muenster.de>
Date: Fri, 06 Apr 2007 07:44:18 +0000
Subject: [KJ] [PATCH 3/5] Fix warnings when building 'xmldocs' target:
Message-Id: <20070406074418.GA4857@gollum.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Signed-off-by: Borislav Petkov <bbpetkov@yahoo.de>

--- kernel.orig/20-rc5/drivers/message/fusion/mptspi.c	2007-04-05 09:47:36.=
000000000 +0200
+++ kernel/20-rc5/drivers/message/fusion/mptspi.c	2007-04-05 09:48:06.00000=
0000 +0200
@@ -101,7 +101,7 @@
  *	and NVRAM settings
  *
  *	@hd: Pointer to a SCSI Host Structure
- *	@vtarget: per target private data
+ *	@target: per target private data
  *	@sdev: SCSI device
  *
  **/
@@ -234,7 +234,7 @@
 /**
  * 	mptspi_writeIOCPage4  - write IOC Page 4
  *	@hd: Pointer to a SCSI Host Structure
- *	@channel:
+ *	@channel: volume channel
  *	@id: write IOC Page4 for this ID & Bus
  *
  *	Return: -EAGAIN if unable to obtain a Message Frame

--=20
Regards/Gru=DF,
    Boris.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
