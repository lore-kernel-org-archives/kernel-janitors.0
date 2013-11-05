From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Nov 2013 20:20:35 +0000
Subject: [patch] ath9k: fix SC_OP_INVALID test in ath9k_tx99_init()
Message-Id: <20131105202034.GC3949@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>
Cc: Jouni Malinen <jouni@qca.qualcomm.com>, Vasanthakumar Thiagarajan <vthiagar@qca.qualcomm.com>, Senthil Balasubramanian <senthilb@qca.qualcomm.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

SC_OP_INVALID is zero so the test is always false.  We're supposed to be
testing the lowest bit instead.

Fixes: 89f927af7f33 ('ath9k: add TX99 support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
index 74f452c..7ad4e11 100644
--- a/drivers/net/wireless/ath/ath9k/main.c
+++ b/drivers/net/wireless/ath/ath9k/main.c
@@ -2456,7 +2456,7 @@ int ath9k_tx99_init(struct ath_softc *sc)
 	struct ath_tx_control txctl;
 	int r;
 
-	if (sc->sc_flags & SC_OP_INVALID) {
+	if (test_bit(SC_OP_INVALID, &sc->sc_flags)) {
 		ath_err(common,
 			"driver is in invalid state unable to use TX99");
 		return -EINVAL;
