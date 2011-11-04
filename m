From: Marcos Souza <marcos.mage@gmail.com>
Date: Fri, 04 Nov 2011 10:11:28 +0000
Subject: Fwd: [PATCH 4/4] drivers/staging/vt6656/rf.h: Remove ttype.h and some
Message-Id: <CAGkUK2vaCWbH=S_RzKPvLz6iKE=rwV-Bxj7vC88ddZHZPDo24w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

I forgot to sent these patches, so I'm sending now

Removed ttype.h for the TODO file, and some dead comments.

Signed-off-by: Marcos Paulo de Souza <marcos.mage@gmail.com>
---
 drivers/staging/vt6656/rf.h |   38 +++++++++++---------------------------
 1 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/vt6656/rf.h b/drivers/staging/vt6656/rf.h
index f5ba8fd..b7c6c19 100644
--- a/drivers/staging/vt6656/rf.h
+++ b/drivers/staging/vt6656/rf.h
@@ -30,13 +30,10 @@
 #ifndef __RF_H__
 #define __RF_H__

-#include "ttype.h"
 #include "device.h"

-/*---------------------  Export Definitions -------------------------*/
-//
-// Baseband RF pair definition in eeprom (Bits 6..0)
-//
+/* Baseband RF pair definition in eeprom (Bits 6..0) */
+
 #define RF_RFMD2959         0x01
 #define RF_MAXIMAG          0x02
 #define RF_AL2230           0x03
@@ -48,37 +45,24 @@
 #define RF_VT3226           0x09
 #define RF_AIROHA7230       0x0a
 #define RF_UW2453           0x0b
-#define RF_VT3226D0         0x0c //RobertYu:20051114
-#define RF_VT3342A0         0x0d //RobertYu:20060609
+#define RF_VT3226D0         0x0c
+#define RF_VT3342A0         0x0d
 #define RF_AL2230S          0x0e

 #define RF_EMU              0x80
 #define RF_MASK             0x7F

+extern const unsigned char RFaby11aChannelIndex[200];

+int IFRFbWriteEmbeded(PSDevice pDevice, unsigned long dwData);
+int RFbSetPower(PSDevice pDevice, unsigned int uRATE, unsigned int uCH);

-/*---------------------  Export Classes  ----------------------------*/
-
-/*---------------------  Export Variables  --------------------------*/
-extern const BYTE RFaby11aChannelIndex[200];
-/*---------------------  Export Functions  --------------------------*/
-
-BOOL IFRFbWriteEmbeded(PSDevice pDevice, DWORD dwData);
-BOOL RFbSetPower(PSDevice pDevice, unsigned int uRATE, unsigned int uCH);
-
-BOOL RFbRawSetPower(
-      PSDevice  pDevice,
-      BYTE      byPwr,
-      unsigned int      uRATE
-    );
+int RFbRawSetPower(PSDevice pDevice, unsigned char byPwr, unsigned int uRA=
TE);

-void RFvRSSITodBm(PSDevice pDevice, BYTE byCurrRSSI, long *pldBm);
+void RFvRSSITodBm(PSDevice pDevice, unsigned char byCurrRSSI, long *pldBm);
 void RFbRFTableDownload(PSDevice pDevice);

-BOOL s_bVT3226D0_11bLoCurrentAdjust(
-      PSDevice    pDevice,
-      BYTE        byChannel,
-      BOOL        b11bMode
-    );
+int s_bVT3226D0_11bLoCurrentAdjust(PSDevice pDevice, unsigned char byChann=
el,
+				   int b11bMode);

 #endif /* __RF_H__ */
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
