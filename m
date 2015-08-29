From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Aug 2015 17:30:07 +0000
Subject: [PATCH 3/8] staging: lustre: ldlm: put constant on the right of binary operator
Message-Id: <1440869412-4899-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Move constants to the right of binary operators.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
constant c;
expression e;
binary operator b = {=,!=,&,|};
@@

(
- c
+ e
b
- e
+ c
|
- c < e
+ e > c
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/ldlm/ldlm_flock.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/lustre/lustre/ldlm/ldlm_flock.c b/drivers/staging/lustre/lustre/ldlm/ldlm_flock.c
index a4c252f..ab670fc 100644
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_flock.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_flock.c
@@ -602,7 +602,7 @@ ldlm_flock_completion_ast(struct ldlm_lock *lock, __u64 flags, void *data)
 	    (LDLM_FL_FAILED|LDLM_FL_LOCAL_ONLY)) {
 		if (lock->l_req_mode = lock->l_granted_mode &&
 		    lock->l_granted_mode != LCK_NL &&
-		    NULL = data)
+		    data = NULL)
 			ldlm_lock_decref_internal(lock, lock->l_req_mode);
 
 		/* Need to wake up the waiter if we were evicted */
@@ -614,7 +614,7 @@ ldlm_flock_completion_ast(struct ldlm_lock *lock, __u64 flags, void *data)
 
 	if (!(flags & (LDLM_FL_BLOCK_WAIT | LDLM_FL_BLOCK_GRANTED |
 		       LDLM_FL_BLOCK_CONV))) {
-		if (NULL = data)
+		if (data = NULL)
 			/* mds granted the lock in the reply */
 			goto granted;
 		/* CP AST RPC: lock get granted, wake it up */
@@ -627,10 +627,10 @@ ldlm_flock_completion_ast(struct ldlm_lock *lock, __u64 flags, void *data)
 	obd = class_exp2obd(lock->l_conn_export);
 
 	/* if this is a local lock, there is no import */
-	if (NULL != obd)
+	if (obd != NULL)
 		imp = obd->u.cli.cl_import;
 
-	if (NULL != imp) {
+	if (imp != NULL) {
 		spin_lock(&imp->imp_lock);
 		fwd.fwd_generation = imp->imp_generation;
 		spin_unlock(&imp->imp_lock);

