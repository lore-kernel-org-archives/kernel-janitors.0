From: Mao Wenan <maowenan@huawei.com>
Date: Fri, 19 Jul 2019 01:29:38 +0000
Subject: [PATCH -next] infiniband: siw: remove set but not used variables 'rv'
Message-Id: <20190719012938.100628-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bmt@zurich.ibm.com, dledford@redhat.com, jgg@ziepe.ca
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/infiniband/sw/siw/siw_cm.c: In function siw_cep_set_inuse:
drivers/infiniband/sw/siw/siw_cm.c:223:6: warning: variable rv set but not used [-Wunused-but-set-variable]

It is not used since commit 6c52fdc244b5("rdma/siw: connection management")

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/infiniband/sw/siw/siw_cm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/infiniband/sw/siw/siw_cm.c b/drivers/infiniband/sw/siw/siw_cm.c
index a7cde98..9ce8a1b 100644
--- a/drivers/infiniband/sw/siw/siw_cm.c
+++ b/drivers/infiniband/sw/siw/siw_cm.c
@@ -220,13 +220,12 @@ static void siw_put_work(struct siw_cm_work *work)
 static void siw_cep_set_inuse(struct siw_cep *cep)
 {
 	unsigned long flags;
-	int rv;
 retry:
 	spin_lock_irqsave(&cep->lock, flags);
 
 	if (cep->in_use) {
 		spin_unlock_irqrestore(&cep->lock, flags);
-		rv = wait_event_interruptible(cep->waitq, !cep->in_use);
+		wait_event_interruptible(cep->waitq, !cep->in_use);
 		if (signal_pending(current))
 			flush_signals(current);
 		goto retry;
-- 
2.7.4
