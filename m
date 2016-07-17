From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Jul 2016 18:28:44 +0000
Subject: [PATCH 8/9] staging: ks7010: Delete a variable in write_to_device()
Message-Id: <749c981a-c649-2b24-bd47-8511d0cc95b9@users.sourceforge.net>
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

From 01291121668ccb54f1a784765a8d2b5811afa75a Mon Sep 17 00:00:00 2001
From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Jul 2016 19:26:15 +0200
Subject: [PATCH 8/9] staging: ks7010: Delete a variable in write_to_device()

The local variable "rc" was assigned a zero at one place.
But it was not read within this function. Thus delete it.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/ks7010/ks7010_sdio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 4b15aec..e06bc3c 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -291,11 +291,10 @@ static int enqueue_txdev(struct ks_wlan_private *priv, unsigned char *p,
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
2.9.1

