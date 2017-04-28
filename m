From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Apr 2017 12:56:09 +0000
Subject: [PATCH net] qed: Unlock on error in qed_vf_pf_acquire()
Message-Id: <20170428125608.djln5r7h4d53it5s@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuval Mintz <Yuval.Mintz@cavium.com>
Cc: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that we're holding a mutex on this error
path.  Let's goto exit instead of returning directly.

Fixes: b0bccb69eba3 ("qed: Change locking scheme for VF channel")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Yuval, could you review this one a bit carefully and also check that my
Fixes tag is correct because I'm not certain.

diff --git a/drivers/net/ethernet/qlogic/qed/qed_vf.c b/drivers/net/ethernet/qlogic/qed/qed_vf.c
index c4c4a408b40b..11d71e5eea14 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_vf.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_vf.c
@@ -234,7 +234,7 @@ static int qed_vf_pf_acquire(struct qed_hwfn *p_hwfn)
 		/* send acquire request */
 		rc = qed_send_msg2pf(p_hwfn, &resp->hdr.status, sizeof(*resp));
 		if (rc)
-			return rc;
+			goto exit;
 
 		/* copy acquire response from buffer to p_hwfn */
 		memcpy(&p_iov->acquire_resp, resp, sizeof(p_iov->acquire_resp));
