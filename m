From: Rememberme <rememberme@systol.god.lan>
Date: Thu, 24 Feb 2005 12:11:35 +0000
Subject: [KJ] [PATCH 1/2] include/linux/fb.h
Message-Id: <20050224121135.GA4090@systol.god.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="r5Pyd7+fXNt84Ff3"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi KJ's,

I want to propose to localize the maintenance and registration of the
FB_ACCEL_ id's and remove it from the public fb.h include file.

Motivation:
- This removes an unneeded dependency to fb.h if an additional cards/chips are
  introduced. (These id's are only interesting for the driver anyhow. 
  Only fbset will print out the id, but I'll doubt this is used by anyone.)
- It relieves maintenance of the common frambuffer code, because we don't have
  to keep fb.h in sync.
- It also relieves the maintenance for the  driver developer
  because he can add new cards without having to request modifications
  to public framebuffer code.
  => cleaner fb.h
- removes 
  (To my knowledge there(The only use of this id outside 

Could we make this a general guideline?


I have created a patch for the savage driver and fb.h to give an idea
how this would look like. It has no impact on the other fb drivers.

Best regards,

Henk Vergonet


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="patch-2.6.11-rc4-fb_h"

diff -urpN linux-2.6.11-rc4-vanilla/include/linux/fb.h linux-2.6.11-rc4/include/linux/fb.h
--- linux-2.6.11-rc4-vanilla/include/linux/fb.h	2005-02-23 10:09:26.000000000 +0100
+++ linux-2.6.11-rc4/include/linux/fb.h	2005-02-24 11:49:55.000000000 +0100
@@ -60,6 +60,14 @@
 #define FB_VISUAL_DIRECTCOLOR		4	/* Direct color */
 #define FB_VISUAL_STATIC_PSEUDOCOLOR	5	/* Pseudo color readonly */
 
+/*
+   The maintenance and registration of a global FB_ACCEL_ accelerator table is
+   deprecated. The driver specific chip identifier should be local to the driver
+   and not be exported via public include files.
+   For userspace applications the use of the sys interface is recommended.
+*/
+#define FB_ACCEL_DUMMY		0xffff	/* Placeholder value until all global */
+					/* administration is removed.	*/
 #define FB_ACCEL_NONE		0	/* no hardware accelerator	*/
 #define FB_ACCEL_ATARIBLITT	1	/* Atari Blitter		*/
 #define FB_ACCEL_AMIGABLITT	2	/* Amiga Blitter                */
@@ -114,22 +122,6 @@
 #define FB_ACCEL_NEOMAGIC_NM2360 97	/* NeoMagic NM2360              */
 #define FB_ACCEL_NEOMAGIC_NM2380 98	/* NeoMagic NM2380              */
 
-#define FB_ACCEL_SAVAGE4        0x80	/* S3 Savage4                   */
-#define FB_ACCEL_SAVAGE3D       0x81	/* S3 Savage3D                  */
-#define FB_ACCEL_SAVAGE3D_MV    0x82	/* S3 Savage3D-MV               */
-#define FB_ACCEL_SAVAGE2000     0x83	/* S3 Savage2000                */
-#define FB_ACCEL_SAVAGE_MX_MV   0x84	/* S3 Savage/MX-MV              */
-#define FB_ACCEL_SAVAGE_MX      0x85	/* S3 Savage/MX                 */
-#define FB_ACCEL_SAVAGE_IX_MV   0x86	/* S3 Savage/IX-MV              */
-#define FB_ACCEL_SAVAGE_IX      0x87	/* S3 Savage/IX                 */
-#define FB_ACCEL_PROSAVAGE_PM   0x88	/* S3 ProSavage PM133           */
-#define FB_ACCEL_PROSAVAGE_KM   0x89	/* S3 ProSavage KM133           */
-#define FB_ACCEL_S3TWISTER_P    0x8a	/* S3 Twister                   */
-#define FB_ACCEL_S3TWISTER_K    0x8b	/* S3 TwisterK                  */
-#define FB_ACCEL_SUPERSAVAGE    0x8c    /* S3 Supersavage               */
-#define FB_ACCEL_PROSAVAGE_DDR  0x8d	/* S3 ProSavage DDR             */
-#define FB_ACCEL_PROSAVAGE_DDRK 0x8e	/* S3 ProSavage DDR-K           */
-
 struct fb_fix_screeninfo {
 	char id[16];			/* identification string eg "TT Builtin" */
 	unsigned long smem_start;	/* Start of frame buffer mem */
@@ -145,8 +137,10 @@ struct fb_fix_screeninfo {
 	unsigned long mmio_start;	/* Start of Memory Mapped I/O   */
 					/* (physical address) */
 	__u32 mmio_len;			/* Length of Memory Mapped I/O  */
-	__u32 accel;			/* Indicate to driver which	*/
-					/*  specific chip/card we have	*/
+	__u32 accel;			/* OBSOLETE please use FB_ACCEL_DUMMY */
+					/* as a placeholder see explanation   */
+					/* above. (Used to indicate to driver */
+					/* which specific chip/card we had.)  */
 	__u16 reserved[3];		/* Reserved for future compatibility */
 };
 

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--r5Pyd7+fXNt84Ff3--
