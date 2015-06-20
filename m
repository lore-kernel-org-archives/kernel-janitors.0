From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:59:02 +0000
Subject: [PATCH 04/12] staging: lustre: ldlm: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

!x is more normal for kzalloc failure in the kernel.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
statement S1, S2;
@@

x = kzalloc(...);
if (
- x = NULL
+ !x
 ) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/ldlm/ldlm_lock.c  |    4 ++--
 drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c |    8 ++++----
 drivers/staging/lustre/lustre/ldlm/ldlm_pool.c  |    2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/ldlm/ldlm_pool.c b/drivers/staging/lustre/lustre/ldlm/ldlm_pool.c
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_pool.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_pool.c
@@ -1422,7 +1422,7 @@ static int ldlm_pools_thread_start(void)
 		return -EALREADY;
 
 	ldlm_pools_thread = kzalloc(sizeof(*ldlm_pools_thread), GFP_NOFS);
-	if (ldlm_pools_thread = NULL)
+	if (!ldlm_pools_thread)
 		return -ENOMEM;
 
 	init_completion(&ldlm_pools_comp);
diff -u -p a/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c b/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c
@@ -225,7 +225,7 @@ static void ldlm_handle_cp_callback(stru
 			void *lvb_data;
 
 			lvb_data = kzalloc(lvb_len, GFP_NOFS);
-			if (lvb_data = NULL) {
+			if (!lvb_data) {
 				LDLM_ERROR(lock, "No memory: %d.\n", lvb_len);
 				rc = -ENOMEM;
 				goto out;
@@ -453,7 +453,7 @@ static int ldlm_bl_to_thread(struct ldlm
 		struct ldlm_bl_work_item *blwi;
 
 		blwi = kzalloc(sizeof(*blwi), GFP_NOFS);
-		if (blwi = NULL)
+		if (!blwi)
 			return -ENOMEM;
 		init_blwi(blwi, ns, ld, cancels, count, lock, cancel_flags);
 
@@ -1053,7 +1053,7 @@ static int ldlm_setup(void)
 		return -EALREADY;
 
 	ldlm_state = kzalloc(sizeof(*ldlm_state), GFP_NOFS);
-	if (ldlm_state = NULL)
+	if (!ldlm_state)
 		return -ENOMEM;
 
 	ldlm_kobj = kobject_create_and_add("ldlm", lustre_kobj);
@@ -1123,7 +1123,7 @@ static int ldlm_setup(void)
 
 
 	blp = kzalloc(sizeof(*blp), GFP_NOFS);
-	if (blp = NULL) {
+	if (!blp) {
 		rc = -ENOMEM;
 		goto out;
 	}
diff -u -p a/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c b/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
@@ -1528,7 +1528,7 @@ struct ldlm_lock *ldlm_lock_create(struc
 	if (lvb_len) {
 		lock->l_lvb_len = lvb_len;
 		lock->l_lvb_data = kzalloc(lvb_len, GFP_NOFS);
-		if (lock->l_lvb_data = NULL)
+		if (!lock->l_lvb_data)
 			goto out;
 	}
 
@@ -1813,7 +1813,7 @@ int ldlm_run_ast_work(struct ldlm_namesp
 		return 0;
 
 	arg = kzalloc(sizeof(*arg), GFP_NOFS);
-	if (arg = NULL)
+	if (!arg)
 		return -ENOMEM;
 
 	atomic_set(&arg->restart, 0);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
