From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 19:39:14 +0000
Subject: [KJ] [PATCH] net/clnt: remove sleep_on*() usage
Message-Id: <20050126193914.GD3593@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67194613062403352=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67194613062403352==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Directly use wait-queues instead of the deprecated
sleep_on_timeout(). Since the sleep in this function is unconditional,
wait_event_timeout() does not appear to be appropriate. Patch is
compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/net/sunrpc/clnt.c	2005-01-24 09:34:22.000000000 -0800
+++ 2.6.11-rc2-kj/net/sunrpc/clnt.c	2005-01-26 10:47:32.000000000 -0800
@@ -28,6 +28,7 @@
 #include <linux/slab.h>
 #include <linux/in.h>
 #include <linux/utsname.h>
+#include <linux/wait.h>
 
 #include <linux/sunrpc/clnt.h>
 #include <linux/workqueue.h>
@@ -222,6 +223,7 @@ out_no_clnt:
 int
 rpc_shutdown_client(struct rpc_clnt *clnt)
 {
+	DEFINE_WAIT(wait);
 	dprintk("RPC: shutting down %s client for %s, tasks=%d\n",
 			clnt->cl_protname, clnt->cl_server,
 			atomic_read(&clnt->cl_users));
@@ -231,7 +233,9 @@ rpc_shutdown_client(struct rpc_clnt *cln
 		clnt->cl_oneshot = 0;
 		clnt->cl_dead = 0;
 		rpc_killall_tasks(clnt);
-		sleep_on_timeout(&destroy_wait, 1*HZ);
+		prepare_to_wait(&destroy_wait, &wait, TASK_UNINTERRUPTIBLE);
+		schedule_timeout(HZ);
+		finish_wait(&destroy_wait, &wait);
 	}
 
 	if (atomic_read(&clnt->cl_users) < 0) {

--===============67194613062403352==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67194613062403352==--
