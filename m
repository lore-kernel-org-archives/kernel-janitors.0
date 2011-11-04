From: Marcos Souza <marcos.mage@gmail.com>
Date: Fri, 04 Nov 2011 10:09:07 +0000
Subject: [PATCH 1/4] drivers/staging/vt6656/wpa2.h: Removed ttype.h and some
Message-Id: <CAGkUK2vuPMf7zWpBJosZdJLnFHsMN0f=St8dvgmrOzcA0JrPHA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

So, I forgot to include kernels janitors on theses patches, so, forwarding.=
..

Removed some old comments and removed ttype.h of the file.

Signed-off-by: Marcos Paulo de Souza <marcos.mage@gmail.com>
---
 drivers/staging/vt6656/wpa2.h |   20 +++++---------------
 1 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/vt6656/wpa2.h b/drivers/staging/vt6656/wpa2.h
index 46c2959..de80801 100644
--- a/drivers/staging/vt6656/wpa2.h
+++ b/drivers/staging/vt6656/wpa2.h
@@ -31,33 +31,23 @@
 #ifndef __WPA2_H__
 #define __WPA2_H__

-#include "ttype.h"
 #include "80211mgr.h"
 #include "80211hdr.h"
 #include "bssdb.h"

-/*---------------------  Export Definitions -------------------------*/
-#define MAX_PMKID_CACHE         16
+#define MAX_PMKID_CACHE 16

 typedef struct tagsPMKIDInfo {
-    BYTE    abyBSSID[6];
-    BYTE    abyPMKID[16];
+	unsigned char abyBSSID[6];
+	unsigned char abyPMKID[16];
 } PMKIDInfo, *PPMKIDInfo;

 typedef struct tagSPMKIDCache {
-    unsigned long       BSSIDInfoCount;
-    PMKIDInfo   BSSIDInfo[MAX_PMKID_CACHE];
+	unsigned long BSSIDInfoCount;
+	PMKIDInfo BSSIDInfo[MAX_PMKID_CACHE];
 } SPMKIDCache, *PSPMKIDCache;


-/*---------------------  Export Classes  ----------------------------*/
-
-/*---------------------  Export Variables  --------------------------*/
-
-/*---------------------  Export Types  ------------------------------*/
-
-/*---------------------  Export Functions  --------------------------*/
-
 void WPA2_ClearRSN(PKnownBSS pBSSNode);
 void WPA2vParseRSN(PKnownBSS pBSSNode, PWLAN_IE_RSN pRSN);

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
