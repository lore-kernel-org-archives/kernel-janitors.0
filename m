From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Jul 2016 18:30:10 +0000
Subject: [PATCH 9/9] staging: ks7010: Delete three unnecessary variable initialisations
Message-Id: <23b93bc6-f938-7f8c-8cf1-f70e453e06e6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
In-Reply-To: <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>, devel@driverdev.osuosl.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Jul 2016 19:40:47 +0200

Three variables will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/ks7010/ks7010_sdio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index e06bc3c..3c62c57 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -323,14 +323,14 @@ static void tx_device_task(void *dev)
 {
 	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev;
 	struct tx_device_buffer *sp;
-	int rc = 0;
 
 	DPRINTK(4, "\n");
 	if (cnt_txqbody(priv) > 0
 	    && atomic_read(&priv->psstatus.status) != PS_SNOOZE) {
 		sp = &priv->tx_dev.tx_dev_buff[priv->tx_dev.qhead];
 		if (priv->dev_state >= DEVICE_STATE_BOOT) {
-			rc = write_to_device(priv, sp->sendp, sp->size);
+			int rc = write_to_device(priv, sp->sendp, sp->size);
+
 			if (rc) {
 				DPRINTK(1, "write_to_device error !!(%d)\n",
 					rc);
@@ -358,7 +358,7 @@ int ks_wlan_hw_tx(struct ks_wlan_private *priv, void *p, unsigned long size,
 		  void (*complete_handler) (void *arg1, void *arg2),
 		  void *arg1, void *arg2)
 {
-	int result = 0;
+	int result;
 	struct hostif_hdr *hdr;
 	hdr = (struct hostif_hdr *)p;
 
@@ -737,7 +737,7 @@ free_buf:
 static int ks7010_upload_firmware(struct ks_wlan_private *priv,
 				  struct ks_sdio_card *card)
 {
-	unsigned int size, offset, n = 0;
+	unsigned int size, offset, n;
 	unsigned char *rom_buf;
 	unsigned char rw_data = 0;
 	int retval, rc = 0;
-- 
2.9.1

