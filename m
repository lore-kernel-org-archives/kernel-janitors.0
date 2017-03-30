From: Colin King <colin.king@canonical.com>
Date: Thu, 30 Mar 2017 09:22:31 +0000
Subject: [PATCH] locking/ww_mutex: fix spelling mistake: "cylic" -> "cyclic"
Message-Id: <20170330092231.18590-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

trivial fix to spelling mistake in pr_err error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/locking/test-ww_mutex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index 90d8d8879969..2a977be632dd 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -324,7 +324,7 @@ static int __test_cycle(unsigned int nthreads)
 		if (!cycle->result)
 			continue;
 
-		pr_err("cylic deadlock not resolved, ret[%d/%d] = %d\n",
+		pr_err("cyclic deadlock not resolved, ret[%d/%d] = %d\n",
 		       n, nthreads, cycle->result);
 		ret = -EINVAL;
 		break;
-- 
2.11.0

