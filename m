From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 May 2020 08:36:56 +0000
Subject: [PATCH] staging: wfx: unlock on error path
Message-Id: <20200512083656.GA251760@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org

We need to release the tx_lock on the error path before returning.

Fixes: d1c015b4ef6f ("staging: wfx: rewrite wfx_hw_scan()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

 drivers/staging/wfx/scan.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/scan.c b/drivers/staging/wfx/scan.c
index 76761e4960dd7..eff1be9fb28f8 100644
--- a/drivers/staging/wfx/scan.c
+++ b/drivers/staging/wfx/scan.c
@@ -57,8 +57,10 @@ static int send_scan_req(struct wfx_vif *wvif,
 	wvif->scan_abort = false;
 	reinit_completion(&wvif->scan_complete);
 	timeout = hif_scan(wvif, req, start_idx, i - start_idx);
-	if (timeout < 0)
+	if (timeout < 0) {
+		wfx_tx_unlock(wvif->wdev);
 		return timeout;
+	}
 	ret = wait_for_completion_timeout(&wvif->scan_complete, timeout);
 	if (req->channels[start_idx]->max_power != wvif->vif->bss_conf.txpower)
 		hif_set_output_power(wvif, wvif->vif->bss_conf.txpower);
-- 
2.26.2
