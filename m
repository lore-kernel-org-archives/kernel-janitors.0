From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Mar 2016 10:09:12 +0000
Subject: [patch] sbp-target: checking for NULL instead of IS_ERR
Message-Id: <20160302100912.GD5533@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120417062946.GB26756@elgon.mountain>
In-Reply-To: <20120417062946.GB26756@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Boot <bootc@bootc.net>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: target-devel@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We changed this from kzalloc to sbp_mgt_get_req() so we need to change
from checking for NULL to check for error pointers.

Fixes: c064b2a78989 ('sbp-target: Conversion to percpu_ida tag pre-allocation')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/target/sbp/sbp_target.c b/drivers/target/sbp/sbp_target.c
index 251d532..a04b0605f 100644
--- a/drivers/target/sbp/sbp_target.c
+++ b/drivers/target/sbp/sbp_target.c
@@ -951,7 +951,7 @@ static void tgt_agent_fetch_work(struct work_struct *work)
 
 	while (next_orb && tgt_agent_check_active(agent)) {
 		req = sbp_mgt_get_req(sess, sess->card, next_orb);
-		if (!req) {
+		if (IS_ERR(req)) {
 			spin_lock_bh(&agent->lock);
 			agent->state = AGENT_STATE_DEAD;
 			spin_unlock_bh(&agent->lock);
