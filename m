From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 05:37:21 +0000
Subject: [PATCH v2 05/10] staging: ks7010: Delete unnecessary uses of the variable "retval"
Message-Id: <d7af5d69-81e3-5651-9e2d-8241b8210de4@users.sourceforge.net>
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
Date: Wed, 10 Aug 2016 18:56:31 +0200

A few return values can also be directly used for condition checks.
Thus remove a local variable for intermediate assignments.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
v2: Rebased on the source files from Linux next-20160809.

    Touched less source code places.

 drivers/staging/ks7010/ks7010_sdio.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 53df8f7..0f7ea76 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -489,7 +489,6 @@ static void ks7010_rw_function(struct work_struct *work)
 	struct hw_info_t *hw;
 	struct ks_wlan_private *priv;
 	unsigned char rw_data;
-	int retval;
 
 	hw = container_of(work, struct hw_info_t, rw_wq.work);
 	priv = container_of(hw, struct ks_wlan_private, ks_wlan_hw);
@@ -538,9 +537,7 @@ static void ks7010_rw_function(struct work_struct *work)
 	}
 
 	/* read (WriteStatus/ReadDataSize FN1:00_0014) */
-	retval -	    ks7010_sdio_read(priv, WSTATUS_RSIZE, &rw_data, sizeof(rw_data));
-	if (retval) {
+	if (ks7010_sdio_read(priv, WSTATUS_RSIZE, &rw_data, sizeof(rw_data))) {
 		DPRINTK(1, " error : WSTATUS_RSIZE=%02X psstatus=%d\n", rw_data,
 			atomic_read(&priv->psstatus.status));
 		goto release_host;
@@ -708,7 +705,6 @@ static void trx_device_exit(struct ks_wlan_private *priv)
 static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
 {
 	int rc = 0;
-	int retval;
 	unsigned char *data_buf;
 
 	data_buf = kmalloc(sizeof(u32), GFP_KERNEL);
@@ -716,14 +712,12 @@ static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
 		return 1;
 
 	memcpy(data_buf, &index, sizeof(index));
-	retval = ks7010_sdio_write(priv, WRITE_INDEX, data_buf, sizeof(index));
-	if (retval) {
+	if (ks7010_sdio_write(priv, WRITE_INDEX, data_buf, sizeof(index))) {
 		rc = 2;
 		goto free_buf;
 	}
 
-	retval = ks7010_sdio_write(priv, READ_INDEX, data_buf, sizeof(index));
-	if (retval)
+	if (ks7010_sdio_write(priv, READ_INDEX, data_buf, sizeof(index)))
 		rc = 3;
  free_buf:
 	kfree(data_buf);
-- 
2.9.2

