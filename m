From: Dan Carpenter <error27@gmail.com>
Date: Mon, 03 Jan 2011 06:00:20 +0000
Subject: [patch -next] ocfs2/cluster: dereferencing before checking in
Message-Id: <20110103060020.GW1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In the original code, we dereferenced "nst" before checking that it was
non-NULL.  I moved the check forward and pulled the code in an indent
level.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/ocfs2/cluster/netdebug.c b/fs/ocfs2/cluster/netdebug.c
index 61df89c..3a58359 100644
--- a/fs/ocfs2/cluster/netdebug.c
+++ b/fs/ocfs2/cluster/netdebug.c
@@ -133,36 +133,37 @@ static int nst_seq_show(struct seq_file *seq, void *v)
 
 	spin_lock(&o2net_debug_lock);
 	nst = next_nst(dummy_nst);
+	if (!nst)
+		goto out;
 
 	now = ktime_get();
 	sock = ktime_to_us(ktime_sub(now, nst->st_sock_time));
 	send = ktime_to_us(ktime_sub(now, nst->st_send_time));
 	status = ktime_to_us(ktime_sub(now, nst->st_status_time));
 
-	if (nst != NULL) {
-		/* get_task_comm isn't exported.  oh well. */
-		seq_printf(seq, "%p:\n"
-			   "  pid:          %lu\n"
-			   "  tgid:         %lu\n"
-			   "  process name: %s\n"
-			   "  node:         %u\n"
-			   "  sc:           %p\n"
-			   "  message id:   %d\n"
-			   "  message type: %u\n"
-			   "  message key:  0x%08x\n"
-			   "  sock acquiry: %lld usecs ago\n"
-			   "  send start:   %lld usecs ago\n"
-			   "  wait start:   %lld usecs ago\n",
-			   nst, (unsigned long)task_pid_nr(nst->st_task),
-			   (unsigned long)nst->st_task->tgid,
-			   nst->st_task->comm, nst->st_node,
-			   nst->st_sc, nst->st_id, nst->st_msg_type,
-			   nst->st_msg_key,
-			   (long long)sock,
-			   (long long)send,
-			   (long long)status);
-	}
+	/* get_task_comm isn't exported.  oh well. */
+	seq_printf(seq, "%p:\n"
+		   "  pid:          %lu\n"
+		   "  tgid:         %lu\n"
+		   "  process name: %s\n"
+		   "  node:         %u\n"
+		   "  sc:           %p\n"
+		   "  message id:   %d\n"
+		   "  message type: %u\n"
+		   "  message key:  0x%08x\n"
+		   "  sock acquiry: %lld usecs ago\n"
+		   "  send start:   %lld usecs ago\n"
+		   "  wait start:   %lld usecs ago\n",
+		   nst, (unsigned long)task_pid_nr(nst->st_task),
+		   (unsigned long)nst->st_task->tgid,
+		   nst->st_task->comm, nst->st_node,
+		   nst->st_sc, nst->st_id, nst->st_msg_type,
+		   nst->st_msg_key,
+		   (long long)sock,
+		   (long long)send,
+		   (long long)status);
 
+out:
 	spin_unlock(&o2net_debug_lock);
 
 	return 0;
