From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2012 14:47:52 +0000
Subject: [patch 1/3 -next] tcm_vhost: unlock on error in tcm_vhost_drop_nexus()
Message-Id: <20120712144752.GD24202@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Bellinger <nab@linux-iscsi.org>
Cc: kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org

We need to unlock here before returning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vhost/tcm_vhost.c b/drivers/vhost/tcm_vhost.c
index da0b8ac..d217bed 100644
--- a/drivers/vhost/tcm_vhost.c
+++ b/drivers/vhost/tcm_vhost.c
@@ -1189,6 +1189,7 @@ static int tcm_vhost_drop_nexus(
 	}
 
 	if (atomic_read(&tpg->tv_tpg_vhost_count)) {
+		mutex_unlock(&tpg->tv_tpg_mutex);
 		pr_err("Unable to remove TCM_vHost I_T Nexus with"
 			" active TPG vhost count: %d\n",
 			atomic_read(&tpg->tv_tpg_vhost_count));
