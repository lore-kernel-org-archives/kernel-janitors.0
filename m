From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Jul 2016 18:15:11 +0000
Subject: [PATCH 2/9] staging: ks7010: Delete unnecessary assignments for buffer variables
Message-Id: <c7b39a66-bff0-b17f-c705-0220b0ae4e26@users.sourceforge.net>
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
Date: Sun, 17 Jul 2016 13:38:46 +0200

A few variables were assigned a null pointer despite of the detail
that they were immediately reassigned by the following statement.
Thus remove such unnecessary assignments.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/ks7010/ks7010_sdio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 7da6c84..3622fba 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -711,7 +711,6 @@ static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
 	int rc = 0;
 	int retval;
 	unsigned char *data_buf;
-	data_buf = NULL;
 
 	data_buf = kmalloc(sizeof(u32), GFP_KERNEL);
 	if (!data_buf) {
@@ -743,7 +742,7 @@ static int ks7010_sdio_data_compare(struct ks_wlan_private *priv, u32 address,
 	int rc = 0;
 	int retval;
 	unsigned char *read_buf;
-	read_buf = NULL;
+
 	read_buf = kmalloc(ROM_BUFF_SIZE, GFP_KERNEL);
 	if (!read_buf) {
 		rc = 1;
@@ -776,8 +775,6 @@ static int ks7010_upload_firmware(struct ks_wlan_private *priv,
 	int length;
 	const struct firmware *fw_entry = NULL;
 
-	rom_buf = NULL;
-
 	/* buffer allocate */
 	rom_buf = kmalloc(ROM_BUFF_SIZE, GFP_KERNEL);
 	if (!rom_buf) {
-- 
2.9.1

