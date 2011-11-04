From: Marcos Souza <marcos.mage@gmail.com>
Date: Fri, 04 Nov 2011 10:09:55 +0000
Subject: Fwd: [PATCH 2/4] drivers/staging/vt6656/upc.h: Remove ttype.h and
Message-Id: <CAGkUK2vW+MJmfisno1m8jpUvfMX3uFrgDy-hKXSHVJW6gatdsw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

I forgot to sent these patches to the janitors...

Removed ttype.h for TODO file, and removed some odd comments

Signed-off-by: Marcos Paulo de Souza <marcos.mage@gmail.com>
---
 drivers/staging/vt6656/upc.h |   38 ++++++++++----------------------------
 1 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/vt6656/upc.h b/drivers/staging/vt6656/upc.h
index b33aba4..67eaf13 100644
--- a/drivers/staging/vt6656/upc.h
+++ b/drivers/staging/vt6656/upc.h
@@ -30,14 +30,8 @@
 #define __UPC_H__

 #include "device.h"
-#include "ttype.h"

-/*---------------------  Export Definitions -------------------------*/
-
-
-//
-//  For IO mapped
-//
+/*  For IO mapped */

 #ifdef IO_MAP

@@ -70,13 +64,10 @@

 #else

-//
-//  For memory mapped IO
-//
-
+/* For memory mapped IO */

 #define VNSvInPortB(dwIOAddress, pbyData) {                     \
-	volatile BYTE* pbyAddr =3D ((PBYTE)(dwIOAddress));            \
+	volatile unsigned char* pbyAddr =3D ((unsigned char *)(dwIOAddress)); \
 	*(pbyData) =3D readb(pbyAddr);                           \
 }

@@ -87,14 +78,14 @@
 }

 #define VNSvInPortD(dwIOAddress, pdwData) {                     \
-	volatile DWORD* pdwAddr =3D ((PDWORD)(dwIOAddress));          \
+	volatile unsigned long* pdwAddr =3D ((unsigned long *)(dwIOAddress));    =
      \
 	*(pdwData) =3D readl(pdwAddr);                           \
 }


 #define VNSvOutPortB(dwIOAddress, byData) {                     \
-    volatile BYTE* pbyAddr =3D ((PBYTE)(dwIOAddress));            \
-    writeb((BYTE)byData, pbyAddr);							\
+	volatile unsigned char* pbyAddr =3D ((unsigned char *)(dwIOAddress));
          \
+	writeb((unsigned char)byData, pbyAddr);							\
 }


@@ -104,16 +95,14 @@
 }

 #define VNSvOutPortD(dwIOAddress, dwData) {                     \
-    volatile DWORD* pdwAddr =3D ((PDWORD)(dwIOAddress));          \
-    writel((DWORD)dwData, pdwAddr);					    \
+	volatile unsigned long* pdwAddr =3D ((unsigned long *)(dwIOAddress));    =
      \
+	writel((unsigned long)dwData, pdwAddr);					    \
 }

 #endif

+/*ALWAYS IO-Mapped IO when in 16-bit/32-bit environment */

-//
-// ALWAYS IO-Mapped IO when in 16-bit/32-bit environment
-//
 #define PCBvInPortB(dwIOAddress, pbyData) {     \
 	    *(pbyData) =3D inb(dwIOAddress);          \
 }
@@ -140,7 +129,7 @@


 #define PCAvDelayByIO(uDelayUnit) {             \
-    BYTE    byData;                             \
+	unsigned char    byData;                             \
     unsigned long   ii;                                 \
                                                 \
     if (uDelayUnit <=3D 50) {                     \
@@ -152,11 +141,4 @@
     }                                           \
 }

-
-/*---------------------  Export Classes  ----------------------------*/
-
-/*---------------------  Export Variables  --------------------------*/
-
-/*---------------------  Export Functions  --------------------------*/
-
 #endif /* __UPC_H__ */
--=20
1.7.4.4




--=20
Marcos Paulo de Souza

*Porque uma vida sem desafios =E9 uma vida sem raz=E3o.*
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
