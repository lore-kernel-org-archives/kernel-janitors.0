From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Apr 2012 09:04:46 +0000
Subject: [RFC] ath9k_hw: precedence bug in ath9k_hw_set_ofdm_nil()
Message-Id: <20120410090445.GB26832@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>, Rajkumar Manoharan <rmanohar@qca.qualcomm.com>
Cc: Jouni Malinen <jouni@qca.qualcomm.com>, Vasanthakumar Thiagarajan <vthiagar@qca.qualcomm.com>, Senthil Balasubramanian <senthilb@qca.qualcomm.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

This was introduced in 54da20d83f "ath9k_hw: improve ANI processing and
rx desensitizing parameters".  It triggers a Smatch complaint because
the "if (!x != y) { ..." formation is a common precedence error.

In this case, maybe the code was intended to be as it is.  The
"->ofdmWeakSigDetectOff" and "->ofdm_weak_signal_on" variables are both
boolean.

Or perhaps based we could change the != to an = and remove the negate?

But normally when I see this formation it is a precedence bug so that's
the patch I've sent.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath9k/ani.c b/drivers/net/wireless/ath/ath9k/ani.c
index 47a9fb4..8304e27 100644
--- a/drivers/net/wireless/ath/ath9k/ani.c
+++ b/drivers/net/wireless/ath/ath9k/ani.c
@@ -291,7 +291,7 @@ static void ath9k_hw_set_ofdm_nil(struct ath_hw *ah, u8 immunityLevel)
 				     entry_ofdm->fir_step_level);
 
 	if ((aniState->noiseFloor >= aniState->rssiThrHigh) &&
-	    (!aniState->ofdmWeakSigDetectOff !+	    (aniState->ofdmWeakSigDetectOff ! 	     entry_ofdm->ofdm_weak_signal_on)) {
 			ath9k_hw_ani_control(ah,
 				ATH9K_ANI_OFDM_WEAK_SIGNAL_DETECTION,
