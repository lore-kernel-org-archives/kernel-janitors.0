From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 19:40:57 +0000
Subject: [KJ] [PATCH] fs/clntlock: remove sleep_on*() usage
Message-Id: <20050126194057.GE3593@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37890931647928028=="
List-Id: <kernel-janitors.vger.kernel.org>
To: okir@monad.swb.de, matthew@wil.cx
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============37890931647928028==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Directly use wait-queues instead of the deprecated
sleep_on_timeout(). Since the sleep in this function is unconditional,
wait_event_timeout() does not appear to be appropriate. Patch is
compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/fs/lockd/clntlock.c	2005-01-24 09:28:16.000000000 -0800
+++ 2.6.11-rc2-kj/fs/lockd/clntlock.c	2005-01-26 10:45:52.000000000 -0800
@@ -14,6 +14,7 @@
 #include <linux/sunrpc/svc.h>
 #include <linux/lockd/lockd.h>
 #include <linux/smp_lock.h>
+#include <linux/wait.h>
 
 #define NLMDBG_FACILITY		NLMDBG_CLIENT
 
@@ -47,6 +48,7 @@ static struct nlm_wait *	nlm_blocked;
 int
 nlmclnt_block(struct nlm_host *host, struct file_lock *fl, u32 *statp)
 {
+	DEFINE_WAIT(wait);
 	struct nlm_wait	block, **head;
 	int		err;
 	u32		pstate;
@@ -69,7 +71,9 @@ nlmclnt_block(struct nlm_host *host, str
 	 * a 1 minute timeout would do. See the comment before
 	 * nlmclnt_lock for an explanation.
 	 */
-	sleep_on_timeout(&block.b_wait, 30*HZ);
+	prepare_to_wait(&block.b_wait, &wait, TASK_UNINTERRUPTIBLE);
+	schedule_timeout(30*HZ);
+	finish_wait(&block.b_wait, &wait);
 
 	for (head = &nlm_blocked; *head; head = &(*head)->b_next) {
 		if (*head == &block) {

--===============37890931647928028==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37890931647928028==--
