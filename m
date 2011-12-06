From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Dec 2011 06:27:07 +0000
Subject: [patch] openvswitch: small potential memory leak in ovs_vport_alloc()
Message-Id: <20111206062707.GA8433@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Gross <jesse-l0M0P4e3n4LQT0dZR+AlfA@public.gmane.org>
Cc: dev-yBygre7rU0TnMu66kgdUjQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>

We're unlikely to hit this leak, but the static checkers complain if we
don't take care of it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
index 6cd7601..7f0ef37 100644
--- a/net/openvswitch/vport.c
+++ b/net/openvswitch/vport.c
@@ -127,8 +127,10 @@ struct vport *ovs_vport_alloc(int priv_size, const struct vport_ops *ops,
 	vport->ops = ops;
 
 	vport->percpu_stats = alloc_percpu(struct vport_percpu_stats);
-	if (!vport->percpu_stats)
+	if (!vport->percpu_stats) {
+		kfree(vport);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	spin_lock_init(&vport->stats_lock);
 
