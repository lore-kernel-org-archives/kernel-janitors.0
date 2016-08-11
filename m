From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 05:50:40 +0000
Subject: [PATCH v2 09/10] staging: ks7010: Delete a variable in write_to_device()
Message-Id: <f72244ed-eab3-9ed5-cd7c-08fc66fc4b0b@users.sourceforge.net>
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
Date: Wed, 10 Aug 2016 22:10:20 +0200

The local variable "rc" was assigned a zero at one place.
But it was not read within this function. Thus delete it.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Reviewed-by: Wolfram Sang <wsa@the-dreams.de>
---
v2: Rebased on the source files from Linux next-20160809.

 drivers/staging/ks7010/ks7010_sdio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index bfca6a7..1729f57 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -299,11 +299,10 @@ static int enqueue_txdev(struct ks_wlan_private *priv, unsigned char *p,
 static int write_to_device(struct ks_wlan_private *priv, unsigned char *buffer,
 			   unsigned long size)
 {
-	int rc, retval;
+	int retval;
 	unsigned char rw_data;
 	struct hostif_hdr *hdr;
 	hdr = (struct hostif_hdr *)buffer;
-	rc = 0;
 
 	DPRINTK(4, "size=%d\n", hdr->size);
 	if (hdr->event < HIF_DATA_REQ || HIF_REQ_MAX < hdr->event) {
-- 
2.9.2

