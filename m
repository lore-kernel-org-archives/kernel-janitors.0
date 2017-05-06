From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 08:41:59 +0000
Subject: [PATCH 05/10] dlm: Improve a size determination in dlm_recover_waiters_pre()
Message-Id: <34dae3fb-31e8-d8a9-7beb-77b40dc94388@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
In-Reply-To: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 08:48:29 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/dlm/lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index fd6fe55bedae..ffadb817ad39 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -5119,7 +5119,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 	int wait_type, stub_unlock_result, stub_cancel_result;
 	int dir_nodeid;
 
-	ms_stub = kmalloc(sizeof(struct dlm_message), GFP_KERNEL);
+	ms_stub = kmalloc(sizeof(*ms_stub), GFP_KERNEL);
 	if (!ms_stub) {
 		log_error(ls, "dlm_recover_waiters_pre no mem");
 		return;
-- 
2.12.2

