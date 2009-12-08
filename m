From: Julia Lawall <julia@diku.dk>
Date: Tue, 08 Dec 2009 18:51:34 +0000
Subject: [PATCH] drivers/isdn: eliminate duplicated test
Message-Id: <Pine.LNX.4.64.0912081951140.28834@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: isdn@linux-pingi.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The code checked slot_rx twice.  Check slot_tx by analogy with the bank
case.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E;
@@

(
*E && E
|
*E || E
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/isdn/hardware/mISDN/hfcmulti.c         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/mISDN/hfcmulti.c
index a6624ad..1a1420d 100644
--- a/drivers/isdn/hardware/mISDN/hfcmulti.c
+++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
@@ -3152,7 +3152,7 @@ static void
 hfcmulti_pcm(struct hfc_multi *hc, int ch, int slot_tx, int bank_tx,
     int slot_rx, int bank_rx)
 {
-	if (slot_rx < 0 || slot_rx < 0 || bank_tx < 0 || bank_rx < 0) {
+	if (slot_tx < 0 || slot_rx < 0 || bank_tx < 0 || bank_rx < 0) {
 		/* disable PCM */
 		mode_hfcmulti(hc, ch, hc->chan[ch].protocol, -1, 0, -1, 0);
 		return;
