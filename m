From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Nov 2011 18:27:32 +0000
Subject: [patch 2/3] ib_srpt: checking NULL instead of ERR_PTR
Message-Id: <20111104182732.GH5796@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Nicholas A. Bellinger" <nab-4mckEHfoRW3KI0RCH6AXYZqQE7yCjDx5@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

transport_init_session() and target_fabric_configfs_init() don't
return NULL pointers, they only return ERR_PTRs or valid pointers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 937b4bc..f27b8da 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -2602,10 +2602,10 @@ static int srpt_cm_req_recv(struct ib_cm_id *cm_id,
 	}
 
 	ch->sess = transport_init_session();
-	if (!ch->sess) {
+	if (IS_ERR(ch->sess)) {
 		rej->reason = __constant_cpu_to_be32(
 				SRP_LOGIN_REJ_INSUFFICIENT_RESOURCES);
 		pr_debug("Failed to create session\n");
 		goto deregister_session;
 	}
 	ch->sess->se_node_acl = &nacl->nacl;
@@ -4019,10 +4020,10 @@ static int __init srpt_init_module(void)
 	spin_lock_init(&srpt_dev_lock);
 	INIT_LIST_HEAD(&srpt_dev_list);
 
-	ret = -ENODEV;
 	srpt_target = target_fabric_configfs_init(THIS_MODULE, "srpt");
-	if (!srpt_target) {
+	if (IS_ERR(srpt_target)) {
 		printk(KERN_ERR "couldn't register\n");
+		ret = PTR_ERR(srpt_target);
 		goto out;
 	}
 
