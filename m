From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 07:47:21 +0000
Subject: [PATCH] thunderbolt: Fix reset response_type
Message-Id: <20170614074720.GA29175@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <yehezkel.bernat@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a mistake here where we accidentally use sizeof(TB_CFG_PKG_RESET)
instead of just TB_CFG_PKG_RESET.  The size of an int is 4 so it's the
same as TB_CFG_PKG_NOTIFY_ACK.

Fixes: d7f781bfdbf4 ("thunderbolt: Rework control channel to be more reliable")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
 
