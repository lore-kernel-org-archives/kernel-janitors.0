From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Jun 2016 12:04:16 +0000
Subject: [patch -next] qed: potential overflow in qed_cxt_src_t2_alloc()
Message-Id: <20160607120416.GA2175@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuval Mintz <Yuval.Mintz@qlogic.com>
Cc: Ariel Elior <Ariel.Elior@qlogic.com>, everest-linux-l2@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

In the current code "ent_per_page" could be more than "conn_num" making
"conn_num" negative after the subtraction.  In the next iteration
through the loop then the negative is treated as a very high positive
meaning we don't put a limit on "ent_num".  It could lead to memory
corruption.

Fixes: dbb799c39717 ('qed: Initialize hardware for new protocols')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qed/qed_cxt.c b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
index d85b7ba..1c35f37 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_cxt.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
@@ -850,7 +850,7 @@ static int qed_cxt_src_t2_alloc(struct qed_hwfn *p_hwfn)
 			val = 0;
 		entries[j].next = cpu_to_be64(val);
 
-		conn_num -= ent_per_page;
+		conn_num -= ent_num;
 	}
 
 	return 0;
