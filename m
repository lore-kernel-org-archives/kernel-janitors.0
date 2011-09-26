From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Sep 2011 06:15:17 +0000
Subject: [patch] infiniband: cleanup a min_t() cast in set_node_desc()
Message-Id: <20110926061517.GB11832@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Eli Cohen <eli-VPRAkNaXOzVS1MOuV/RT9w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is just a cleanup.

The "count" variable here is type size_t so casting it to int in
min_t() truncates the higher values.  Of course, this is sysfs so
count is capped at a PAGE_SIZE but static checkers don't know that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/core/sysfs.c b/drivers/infiniband/core/sysfs.c
index ab7fc60..feb9867 100644
--- a/drivers/infiniband/core/sysfs.c
+++ b/drivers/infiniband/core/sysfs.c
@@ -641,7 +641,7 @@ static ssize_t set_node_desc(struct device *device,
 	if (!dev->modify_device)
 		return -EIO;
 
-	memcpy(desc.node_desc, buf, min_t(int, count, 64));
+	memcpy(desc.node_desc, buf, min_t(size_t, count, 64));
 	ret = ib_modify_device(dev, IB_DEVICE_MODIFY_NODE_DESC, &desc);
 	if (ret)
 		return ret;
