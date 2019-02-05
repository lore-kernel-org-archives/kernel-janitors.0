From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Feb 2019 09:07:18 +0000
Subject: [PATCH] dlm: Fix test for -ERESTARTSYS
Message-Id: <20190205090718.GA20043@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The minus sign is missing so this condition is never true.

Fixes: 5c1597bfeb2c ("dlm: retry wait_event_interruptible in event of ERESTARTSYS")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  Not tested.

 fs/dlm/lockspace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 7aae23afdd3a..738136a762d4 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -213,7 +213,7 @@ static int do_uevent(struct dlm_ls *ls, int in)
 	do {
 		error = wait_event_interruptible(ls->ls_uevent_wait,
 						 test_and_clear_bit(LSFL_UEVENT_WAIT, &ls->ls_flags));
-	} while (error = ERESTARTSYS);
+	} while (error = -ERESTARTSYS);
 
 	log_rinfo(ls, "group event done %d %d", error, ls->ls_uevent_result);
 
-- 
2.17.1
