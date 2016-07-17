From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Jul 2016 18:17:21 +0000
Subject: [PATCH 3/9] staging: ks7010: Return directly after a failed kmalloc()
Message-Id: <3aa380a9-afe6-6dc8-7533-6747afeb1bdc@users.sourceforge.net>
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
Date: Sun, 17 Jul 2016 15:55:02 +0200

Return directly after a memory allocation failed at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/ks7010/ks7010_sdio.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 3622fba..9b954cb 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -713,10 +713,8 @@ static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
 	unsigned char *data_buf;
 
 	data_buf = kmalloc(sizeof(u32), GFP_KERNEL);
-	if (!data_buf) {
-		rc = 1;
-		goto error_out;
-	}
+	if (!data_buf)
+		return 1;
 
 	memcpy(data_buf, &index, sizeof(index));
 	retval = ks7010_sdio_write(priv, WRITE_INDEX, data_buf, sizeof(index));
@@ -744,10 +742,9 @@ static int ks7010_sdio_data_compare(struct ks_wlan_private *priv, u32 address,
 	unsigned char *read_buf;
 
 	read_buf = kmalloc(ROM_BUFF_SIZE, GFP_KERNEL);
-	if (!read_buf) {
-		rc = 1;
-		goto error_out;
-	}
+	if (!read_buf)
+		return 1;
+
 	retval = ks7010_sdio_read(priv, address, read_buf, size);
 	if (retval) {
 		rc = 2;
@@ -777,10 +774,8 @@ static int ks7010_upload_firmware(struct ks_wlan_private *priv,
 
 	/* buffer allocate */
 	rom_buf = kmalloc(ROM_BUFF_SIZE, GFP_KERNEL);
-	if (!rom_buf) {
-		rc = 3;
-		goto error_out0;
-	}
+	if (!rom_buf)
+		return 3;
 
 	sdio_claim_host(card->func);
 
-- 
2.9.1

