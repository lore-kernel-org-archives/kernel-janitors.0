From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 16 Jan 2019 05:44:32 +0000
Subject: [PATCH -next] LSM: Make some functions static
Message-Id: <1547617472-60140-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Casey Schaufler <casey@schaufler-ca.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

security/security.c:533:5: warning:
 symbol 'lsm_task_alloc' was not declared. Should it be static?
security/security.c:554:5: warning:
 symbol 'lsm_ipc_alloc' was not declared. Should it be static?
security/security.c:575:5: warning:
 symbol 'lsm_msg_msg_alloc' was not declared. Should it be static?

Fixes: f4ad8f2c4076 ("LSM: Infrastructure management of the task security")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 security/security.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/security.c b/security/security.c
index 9a98c52..750d3f3 100644
--- a/security/security.c
+++ b/security/security.c
@@ -530,7 +530,7 @@ int lsm_inode_alloc(struct inode *inode)
  *
  * Returns 0, or -ENOMEM if memory can't be allocated.
  */
-int lsm_task_alloc(struct task_struct *task)
+static int lsm_task_alloc(struct task_struct *task)
 {
 	if (blob_sizes.lbs_task = 0) {
 		task->security = NULL;
@@ -551,7 +551,7 @@ int lsm_task_alloc(struct task_struct *task)
  *
  * Returns 0, or -ENOMEM if memory can't be allocated.
  */
-int lsm_ipc_alloc(struct kern_ipc_perm *kip)
+static int lsm_ipc_alloc(struct kern_ipc_perm *kip)
 {
 	if (blob_sizes.lbs_ipc = 0) {
 		kip->security = NULL;
@@ -572,7 +572,7 @@ int lsm_ipc_alloc(struct kern_ipc_perm *kip)
  *
  * Returns 0, or -ENOMEM if memory can't be allocated.
  */
-int lsm_msg_msg_alloc(struct msg_msg *mp)
+static int lsm_msg_msg_alloc(struct msg_msg *mp)
 {
 	if (blob_sizes.lbs_msg_msg = 0) {
 		mp->security = NULL;
