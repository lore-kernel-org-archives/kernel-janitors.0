From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Jan 2013 07:19:14 +0000
Subject: [patch] ntb: off by one sanity checks
Message-Id: <20130122071914.GA8966@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Mason <jon.mason@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kbuild@01.org

These tests are off by one.  If "mw" is equal to NTB_NUM_MW then we
would go beyond the end of the ndev->mw[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/ntb/ntb_hw.c b/drivers/ntb/ntb_hw.c
index 4c71b17..5bf54f3 100644
--- a/drivers/ntb/ntb_hw.c
+++ b/drivers/ntb/ntb_hw.c
@@ -359,7 +359,7 @@ int ntb_read_remote_spad(struct ntb_device *ndev, unsigned int idx, u32 *val)
  */
 void *ntb_get_mw_vbase(struct ntb_device *ndev, unsigned int mw)
 {
-	if (mw > NTB_NUM_MW)
+	if (mw >= NTB_NUM_MW)
 		return NULL;
 
 	return ndev->mw[mw].vbase;
@@ -376,7 +376,7 @@ void *ntb_get_mw_vbase(struct ntb_device *ndev, unsigned int mw)
  */
 resource_size_t ntb_get_mw_size(struct ntb_device *ndev, unsigned int mw)
 {
-	if (mw > NTB_NUM_MW)
+	if (mw >= NTB_NUM_MW)
 		return 0;
 
 	return ndev->mw[mw].bar_sz;
@@ -394,7 +394,7 @@ resource_size_t ntb_get_mw_size(struct ntb_device *ndev, unsigned int mw)
  */
 void ntb_set_mw_addr(struct ntb_device *ndev, unsigned int mw, u64 addr)
 {
-	if (mw > NTB_NUM_MW)
+	if (mw >= NTB_NUM_MW)
 		return;
 
 	dev_dbg(&ndev->pdev->dev, "Writing addr %Lx to BAR %d\n", addr,
