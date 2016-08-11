From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 05:54:24 +0000
Subject: [PATCH v2 10/10] staging: ks7010: Delete three unnecessary variable initialisations
Message-Id: <a1d2e1ea-5093-b319-ec4a-b7e07bcc6594@users.sourceforge.net>
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
 <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
In-Reply-To: <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Joe Perches <joe@perches.com>, Jean Delvare <jdelvare@suse.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Aug 2016 22:33:52 +0200

Three variables will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
v2: Rebased on the source files from Linux next-20160809.

    It was omitted to reduce the scope for the variable "rc"
    in the function "tx_device_task".

 drivers/staging/ks7010/ks7010_sdio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 1729f57..bb6294c 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -331,7 +331,7 @@ static void tx_device_task(void *dev)
 {
 	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev;
 	struct tx_device_buffer *sp;
-	int rc = 0;
+	int rc;
 
 	DPRINTK(4, "\n");
 	if (cnt_txqbody(priv) > 0
@@ -366,7 +366,7 @@ int ks_wlan_hw_tx(struct ks_wlan_private *priv, void *p, unsigned long size,
 		  void (*complete_handler) (void *arg1, void *arg2),
 		  void *arg1, void *arg2)
 {
-	int result = 0;
+	int result;
 	struct hostif_hdr *hdr;
 	hdr = (struct hostif_hdr *)p;
 
@@ -747,7 +747,7 @@ static int ks7010_sdio_data_compare(struct ks_wlan_private *priv, u32 address,
 static int ks7010_upload_firmware(struct ks_wlan_private *priv,
 				  struct ks_sdio_card *card)
 {
-	unsigned int size, offset, n = 0;
+	unsigned int size, offset, n;
 	unsigned char *rom_buf;
 	unsigned char rw_data = 0;
 	int retval, rc = 0;
-- 
2.9.2

