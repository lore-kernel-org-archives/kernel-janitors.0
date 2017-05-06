From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 08:38:18 +0000
Subject: [PATCH 02/10] dlm: Add spaces for better code readability
Message-Id: <a2121565-e4cc-301a-5c95-a09da709aa99@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
In-Reply-To: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 08:22:35 +0200

The script "checkpatch.pl" pointed information out like the following.

CHECK: spaces preferred around that '+' (ctx:VxV)

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/dlm/debug_fs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 464218c6b502..551e0f8dbe0d 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -741,7 +741,7 @@ void dlm_delete_debug_file(struct dlm_ls *ls)
 
 int dlm_create_debug_file(struct dlm_ls *ls)
 {
-	char name[DLM_LOCKSPACE_LEN+8];
+	char name[DLM_LOCKSPACE_LEN + 8];
 
 	/* format 1 */
 
@@ -756,7 +756,7 @@ int dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 2 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN+8, "%s_locks", ls->ls_name);
+	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_locks", ls->ls_name);
 
 	ls->ls_debug_locks_dentry = debugfs_create_file(name,
 							S_IFREG | S_IRUGO,
@@ -769,7 +769,7 @@ int dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 3 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN+8, "%s_all", ls->ls_name);
+	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_all", ls->ls_name);
 
 	ls->ls_debug_all_dentry = debugfs_create_file(name,
 						      S_IFREG | S_IRUGO,
@@ -782,7 +782,7 @@ int dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 4 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN+8, "%s_toss", ls->ls_name);
+	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_toss", ls->ls_name);
 
 	ls->ls_debug_toss_dentry = debugfs_create_file(name,
 						       S_IFREG | S_IRUGO,
@@ -793,7 +793,7 @@ int dlm_create_debug_file(struct dlm_ls *ls)
 		goto fail;
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN+8, "%s_waiters", ls->ls_name);
+	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls->ls_name);
 
 	ls->ls_debug_waiters_dentry = debugfs_create_file(name,
 							  S_IFREG | S_IRUGO,
-- 
2.12.2

