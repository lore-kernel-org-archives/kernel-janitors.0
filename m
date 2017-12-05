From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Dec 2017 14:38:43 +0000
Subject: [PATCH] xen/pvcalls: check for xenbus_read() errors
Message-Id: <20171205143843.hj7b4ayvbgf5ftzl@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org

Smatch complains that "len" is uninitialized if xenbus_read() fails so
let's add some error handling.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 40caa92bff33..afa3f1b5d807 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -1128,6 +1128,8 @@ static int pvcalls_front_probe(struct xenbus_device *dev,
 	}
 
 	versions = xenbus_read(XBT_NIL, dev->otherend, "versions", &len);
+	if (IS_ERR(versions))
+		return PTR_ERR(versions);
 	if (!len)
 		return -EINVAL;
 	if (strcmp(versions, "1")) {
