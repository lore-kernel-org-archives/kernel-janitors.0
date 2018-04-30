From: Colin King <colin.king@canonical.com>
Date: Mon, 30 Apr 2018 14:19:46 +0000
Subject: [PATCH][staging-next] staging: rtl8723bs: spelling mistake: "dismatch" -> "mismatch"
Message-Id: <20180430141946.12186-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Justin Vreeland <justin@jvreeland.com>, Bastien Nocera <hadess@hadess.net>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in message text and comment

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c | 2 +-
 drivers/staging/rtl8723bs/include/wifi.h        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 33610d39333f..828bc0d045a0 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -2198,7 +2198,7 @@ static void halbtc8723b2ant_TdmaDurationAdjust(
 			BTC_MSG_ALGORITHM,
 			ALGO_TRACE_FW_DETAIL,
 			(
-				"[BTCoex], PsTdma type dismatch!!!, curPsTdma =%d, recordPsTdma =%d\n",
+				"[BTCoex], PsTdma type mismatch!!!, curPsTdma =%d, recordPsTdma =%d\n",
 				pCoexDm->curPsTdma,
 				pCoexDm->psTdmaDuAdjType
 			)
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 530d698f50d9..c56f887df101 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -1087,7 +1087,7 @@ enum P2P_STATE {
 	P2P_STATE_PROVISIONING_DONE = 14,			/* 	Finish the P2P WPS */
 	P2P_STATE_TX_INVITE_REQ = 15,					/* 	Transmit the P2P Invitation request */
 	P2P_STATE_RX_INVITE_RESP_OK = 16,				/* 	Receiving the P2P Invitation response */
-	P2P_STATE_RECV_INVITE_REQ_DISMATCH = 17,	/* 	receiving the P2P Inviation request and dismatch with the profile. */
+	P2P_STATE_RECV_INVITE_REQ_DISMATCH = 17,	/* 	receiving the P2P Inviation request and mismatch with the profile. */
 	P2P_STATE_RECV_INVITE_REQ_GO = 18,			/* 	receiving the P2P Inviation request and this wifi is GO. */
 	P2P_STATE_RECV_INVITE_REQ_JOIN = 19,			/* 	receiving the P2P Inviation request to join an existing P2P Group. */
 	P2P_STATE_RX_INVITE_RESP_FAIL = 20,			/* 	recveing the P2P Inviation response with failure */
-- 
2.17.0

