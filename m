From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Jul 2014 09:29:18 +0000
Subject: [patch] staging: comedi: ni_tio: remove some dead code
Message-Id: <20140731092918.GD30276@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These conditions can never be true because "i" is always one more than
NI_660X_MAX_RTSI_CHAN after the loop.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers/ni_tio.c b/drivers/staging/comedi/drivers/ni_tio.c
index f9f6320..9d4b46c 100644
--- a/drivers/staging/comedi/drivers/ni_tio.c
+++ b/drivers/staging/comedi/drivers/ni_tio.c
@@ -1041,14 +1041,10 @@ static unsigned ni_660x_gate_to_generic_gate(unsigned gate)
 			if (gate = NI_660X_RTSI_GATE_SEL(i))
 				return NI_GPCT_RTSI_GATE_SELECT(i);
 		}
-		if (i <= NI_660X_MAX_RTSI_CHAN)
-			break;
 		for (i = 0; i <= NI_660X_MAX_GATE_PIN; ++i) {
 			if (gate = NI_660X_PIN_GATE_SEL(i))
 				return NI_GPCT_GATE_PIN_GATE_SELECT(i);
 		}
-		if (i <= NI_660X_MAX_GATE_PIN)
-			break;
 		BUG();
 		break;
 	}
@@ -1081,14 +1077,10 @@ static unsigned ni_m_gate_to_generic_gate(unsigned gate)
 			if (gate = NI_M_RTSI_GATE_SEL(i))
 				return NI_GPCT_RTSI_GATE_SELECT(i);
 		}
-		if (i <= NI_M_MAX_RTSI_CHAN)
-			break;
 		for (i = 0; i <= NI_M_MAX_PFI_CHAN; ++i) {
 			if (gate = NI_M_PFI_GATE_SEL(i))
 				return NI_GPCT_PFI_GATE_SELECT(i);
 		}
-		if (i <= NI_M_MAX_PFI_CHAN)
-			break;
 		BUG();
 		break;
 	}
@@ -1117,14 +1109,10 @@ static unsigned ni_660x_gate2_to_generic_gate(unsigned gate)
 			if (gate = NI_660X_RTSI_GATE2_SEL(i))
 				return NI_GPCT_RTSI_GATE_SELECT(i);
 		}
-		if (i <= NI_660X_MAX_RTSI_CHAN)
-			break;
 		for (i = 0; i <= NI_660X_MAX_UP_DOWN_PIN; ++i) {
 			if (gate = NI_660X_UD_PIN_GATE2_SEL(i))
 				return NI_GPCT_UP_DOWN_PIN_GATE_SELECT(i);
 		}
-		if (i <= NI_660X_MAX_UP_DOWN_PIN)
-			break;
 		BUG();
 		break;
 	}
