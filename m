From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Aug 2017 08:54:17 +0000
Subject: [PATCH resend] thunderbolt: Fix reset response_type
Message-Id: <20170816085417.7xlnl54jkx2p36qs@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <735914a9-3d8f-7d98-35c3-6e2e046e70c2@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <yehezkel.bernat@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Colin King <colin.king@canonical.com>

There is a mistake here where we accidentally use sizeof(TB_CFG_PKG_RESET)
instead of just TB_CFG_PKG_RESET.  The size of an int is 4 so it's the
same as TB_CFG_PKG_NOTIFY_ACK.

Fixes: d7f781bfdbf4 ("thunderbolt: Rework control channel to be more reliable")
Reported-by: Colin King <colin.king@canonical.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Resending with Greg CC'd.  This was also:
Signed-off-by: Andreas Noever <andreas.noever@gmail.com>
But I wasn't sure if I should add that tag.

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 69c0232a22f8..fb40dd0588b9 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -804,7 +804,7 @@ struct tb_cfg_result tb_cfg_reset(struct tb_ctl *ctl, u64 route,
 	req->request_type = TB_CFG_PKG_RESET;
 	req->response = &reply;
 	req->response_size = sizeof(reply);
-	req->response_type = sizeof(TB_CFG_PKG_RESET);
+	req->response_type = TB_CFG_PKG_RESET;
 
 	res = tb_cfg_request_sync(ctl, req, timeout_msec);
 
