From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2012 14:48:52 +0000
Subject: [patch 3/3 -next] tcm_vhost: call kfree() on an error path
Message-Id: <20120712144852.GF24202@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Bellinger <nab@linux-iscsi.org>
Cc: kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org

There is a memory leak here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vhost/tcm_vhost.c b/drivers/vhost/tcm_vhost.c
index 57d39c5..29850cb 100644
--- a/drivers/vhost/tcm_vhost.c
+++ b/drivers/vhost/tcm_vhost.c
@@ -1420,6 +1420,7 @@ static struct se_wwn *tcm_vhost_make_tport(
 
 	pr_err("Unable to locate prefix for emulated Target Port:"
 			" %s\n", name);
+	kfree(tport);
 	return ERR_PTR(-EINVAL);
 
 check_len:
