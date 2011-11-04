From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Nov 2011 18:28:30 +0000
Subject: [patch 3/3] ib_srpt: propagate return value from kstrtoul()
Message-Id: <20111104182830.GI5796@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Nicholas A. Bellinger" <nab-4mckEHfoRW3KI0RCH6AXYZqQE7yCjDx5@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

These days we've renamed strict_strtoul() to kstrtoul().  It has a
couple different error codes it could return.  Smatch complains if
we return -EINVAL instead of using the return value that kstrtoul()
gave us.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index f27b8da..04ccc04 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -3704,10 +3704,10 @@ static ssize_t srpt_tpg_attrib_store_srp_max_rdma_size(
 	unsigned long val;
 	int ret;
 
-	ret = strict_strtoul(page, 0, &val);
+	ret = kstrtoul(page, 0, &val);
 	if (ret < 0) {
-		pr_err("strict_strtoul() failed with ret: %d\n", ret);
-		return -EINVAL;
+		pr_err("kstrtoul() failed with ret: %d\n", ret);
+		return ret;
 	}
 	if (val > MAX_SRPT_RDMA_SIZE) {
 		pr_err("val: %lu exceeds MAX_SRPT_RDMA_SIZE: %d\n", val,
@@ -3744,10 +3744,10 @@ static ssize_t srpt_tpg_attrib_store_srp_max_rsp_size(
 	unsigned long val;
 	int ret;
 
-	ret = strict_strtoul(page, 0, &val);
+	ret = kstrtoul(page, 0, &val);
 	if (ret < 0) {
-		pr_err("strict_strtoul() failed with ret: %d\n", ret);
-		return -EINVAL;
+		pr_err("kstrtoul() failed with ret: %d\n", ret);
+		return ret;
 	}
 	if (val > MAX_SRPT_RSP_SIZE) {
 		pr_err("val: %lu exceeds MAX_SRPT_RSP_SIZE: %d\n", val,
@@ -3784,10 +3784,10 @@ static ssize_t srpt_tpg_attrib_store_srp_sq_size(
 	unsigned long val;
 	int ret;
 
-	ret = strict_strtoul(page, 0, &val);
+	ret = kstrtoul(page, 0, &val);
 	if (ret < 0) {
-		pr_err("strict_strtoul() failed with ret: %d\n", ret);
-		return -EINVAL;
+		pr_err("kstrtoul() failed with ret: %d\n", ret);
+		return ret;
 	}
 	if (val > MAX_SRPT_SRQ_SIZE) {
 		pr_err("val: %lu exceeds MAX_SRPT_SRQ_SIZE: %d\n", val,
@@ -3831,10 +3831,10 @@ static ssize_t srpt_tpg_store_enable(
 	unsigned long tmp;
         int ret;
 
-	ret = strict_strtoul(page, 0, &tmp);
+	ret = kstrtoul(page, 0, &tmp);
 	if (ret < 0) {
 		printk(KERN_ERR "Unable to extract srpt_tpg_store_enable\n");
-		return -EINVAL;
+		return ret;
 	}
 
 	if ((tmp != 0) && (tmp != 1)) {
