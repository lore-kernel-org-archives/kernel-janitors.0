From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 06 Jul 2005 23:07:05 +0000
Subject: [KJ] [PATCH 8/15] FlashPoint: use standard fixed size types.
Message-Id: <200507070307.05993.adobriyan@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============077925694538350854=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============077925694538350854==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/scsi/FlashPoint.c |   20 +++++++-------------
 1 files changed, 7 insertions(+), 13 deletions(-)

Index: linux-flashpoint/drivers/scsi/FlashPoint.c
===================================================================
--- linux-flashpoint.orig/drivers/scsi/FlashPoint.c	2005-07-06 23:47:18.000000000 +0400
+++ linux-flashpoint/drivers/scsi/FlashPoint.c	2005-07-06 23:50:22.000000000 +0400
@@ -44,13 +44,7 @@
 
 
 
-#define s08bits	char
-#define s16bits 	short
-#define s32bits	long
-
-#define u08bits	unsigned s08bits
-#define u16bits	unsigned s16bits
-#define u32bits	unsigned s32bits
+
 
 
 
@@ -245,12 +239,12 @@ typedef struct _SCCB {
 #define SG_ELEMENT_SIZE 8              /*Eight byte per element. */
 
 
-#define RD_HARPOON(ioport)          inb((u32bits)ioport)
-#define RDW_HARPOON(ioport)         inw((u32bits)ioport)
-#define RD_HARP32(ioport,offset,data) (data = inl((u32bits)(ioport + offset)))
-#define WR_HARPOON(ioport,val)      outb((u08bits) val, (u32bits)ioport)
-#define WRW_HARPOON(ioport,val)       outw((u16bits)val, (u32bits)ioport)
-#define WR_HARP32(ioport,offset,data)  outl(data, (u32bits)(ioport + offset))
+#define RD_HARPOON(ioport)          inb((u32)ioport)
+#define RDW_HARPOON(ioport)         inw((u32)ioport)
+#define RD_HARP32(ioport,offset,data) (data = inl((u32)(ioport + offset)))
+#define WR_HARPOON(ioport,val)      outb((u8) val, (u32)ioport)
+#define WRW_HARPOON(ioport,val)       outw((u16)val, (u32)ioport)
+#define WR_HARP32(ioport,offset,data)  outl(data, (u32)(ioport + offset))
 
 
 #define  TAR_SYNC_MASK     (BIT(7)+BIT(6))

--===============077925694538350854==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============077925694538350854==--
