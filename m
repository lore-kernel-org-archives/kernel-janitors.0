From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 20 Apr 2014 09:48:33 +0000
Subject: [PATCH] hisax/icc: add missing semicolon after label
Message-Id: <1397987313-27579-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

A label just before a brace needs a following semicolon (empty statement).

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/isdn/hisax/icc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/isdn/hisax/icc.c b/drivers/isdn/hisax/icc.c
index 51dae91..96d1df0 100644
--- a/drivers/isdn/hisax/icc.c
+++ b/drivers/isdn/hisax/icc.c
@@ -425,7 +425,7 @@ afterXPR:
 				if (cs->debug & L1_DEB_MONITOR)
 					debugl1(cs, "ICC %02x -> MOX1", cs->dc.icc.mon_tx[cs->dc.icc.mon_txp - 1]);
 			}
-		AfterMOX1:
+		AfterMOX1: ;
 #endif
 		}
 	}

