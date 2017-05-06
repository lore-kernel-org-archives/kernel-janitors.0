From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 08:43:47 +0000
Subject: [PATCH 06/10] dlm: Delete an error message for a failed memory allocation in dlm_recover_waiters_pre
Message-Id: <115ac618-840d-1be4-0e1d-c07f2541bd58@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
In-Reply-To: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 08:55:43 +0200

Omit an extra message for a memory allocation failure in this function.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/dlm/lock.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index ffadb817ad39..d4aaddec1b16 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -5120,10 +5120,8 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 	int dir_nodeid;
 
 	ms_stub = kmalloc(sizeof(*ms_stub), GFP_KERNEL);
-	if (!ms_stub) {
-		log_error(ls, "dlm_recover_waiters_pre no mem");
+	if (!ms_stub)
 		return;
-	}
 
 	mutex_lock(&ls->ls_waiters_mutex);
 
-- 
2.12.2

