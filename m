From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2011 13:56:04 +0000
Subject: [patch -next] ipc/mqueue: lock() => unlock() typo
Message-Id: <20111130135604.GA2803@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: Doug Ledford <dledford@redhat.com>, Jiri Slaby <jslaby@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, Davidlohr Bueso <dave@gnu.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There was a double lock typo introduced in b085f4bd6b21 "user namespace:
make signal.c respect user namespaces"

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I think this patch is only needed in the -mm tree.

diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 691cfee..c246c83 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -558,7 +558,7 @@ static void __do_notify(struct mqueue_inode_info *info)
 						ns_of_pid(info->notify_owner));
 			sig_i.si_uid = user_ns_map_uid(info->user->user_ns,
 						current_cred(), current_uid());
-			rcu_read_lock();
+			rcu_read_unlock();
 
 			kill_pid_info(info->notify.sigev_signo,
 				      &sig_i, info->notify_owner);
