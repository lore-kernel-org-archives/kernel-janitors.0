From: Dan Carpenter <error27@gmail.com>
Date: Fri, 12 Feb 2010 11:48:01 +0000
Subject: [patch] staging: vt6655: add missing curly braces
Message-Id: <20100212114801.GA5975@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

It's clear from the indent levels and the context that there are supposed to
be curly braces here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index db78614..bf4fd49 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -2788,16 +2788,18 @@ void CARDvUpdateBasicTopRate (PVOID pDeviceHandler)
 
      //Determines the highest basic rate.
      for (ii = RATE_54M; ii >= RATE_6M; ii --) {
-         if ( (pDevice->wBasicRate) & ((WORD)(1<<ii)) )
+         if ( (pDevice->wBasicRate) & ((WORD)(1<<ii)) ) {
              byTopOFDM = ii;
              break;
+         }
      }
      pDevice->byTopOFDMBasicRate = byTopOFDM;
 
      for (ii = RATE_11M;; ii --) {
-         if ( (pDevice->wBasicRate) & ((WORD)(1<<ii)) )
+         if ( (pDevice->wBasicRate) & ((WORD)(1<<ii)) ) {
              byTopCCK = ii;
              break;
+         }
          if (ii = RATE_1M)
             break;
      }
