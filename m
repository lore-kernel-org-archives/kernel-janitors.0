From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Apr 2012 06:48:59 +0000
Subject: [patch] Staging: wlan-ng: off by one in prism2mgmt_scan_results()
Message-Id: <20120418064859.GB12831@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Count is used to cap "req->bssindex.data" which is used as an offset
into the hw->scanresults->info.hscanresult.result[] array.  The array
has only HFA384x_SCANRESULT_MAX (31) elements so the 32 is off by one.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Of course, it could be that we should make the array larger.  I'm not
sure.  But this patch is an improvement over the existing code even if
it's not a complete fix.

diff --git a/drivers/staging/wlan-ng/prism2mgmt.c b/drivers/staging/wlan-ng/prism2mgmt.c
index c3bb05d..4efa9bc 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.c
+++ b/drivers/staging/wlan-ng/prism2mgmt.c
@@ -380,8 +380,8 @@ int prism2mgmt_scan_results(wlandevice_t *wlandev, void *msgp)
 	}
 
 	count = (hw->scanresults->framelen - 3) / 32;
-	if (count > 32)
-		count = 32;
+	if (count > HFA384x_SCANRESULT_MAX)
+		count = HFA384x_SCANRESULT_MAX;
 
 	if (req->bssindex.data >= count) {
 		pr_debug("requested index (%d) out of range (%d)\n",
