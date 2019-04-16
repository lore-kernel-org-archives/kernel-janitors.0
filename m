From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 16 Apr 2019 03:56:19 +0000
Subject: [PATCH] xenbus: drop useless LIST_HEAD in xenbus_write_watch() and xenbus_file_write()
Message-Id: <20190416040651.186468-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Drop LIST_HEAD where the variable it declares is never used.

The declarations were introduced with the file, but the declared
variables were not used.

Fixes: 1107ba885e469("xen: add xenfs to allow usermode <-> Xen interaction")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/xen/xenbus/xenbus_dev_frontend.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_dev_frontend.c b/drivers/xen/xenbus/xenbus_dev_frontend.c
index 0782ff3..faf452d 100644
--- a/drivers/xen/xenbus/xenbus_dev_frontend.c
+++ b/drivers/xen/xenbus/xenbus_dev_frontend.c
@@ -465,7 +465,6 @@ static int xenbus_write_watch(unsigned msg_type, struct xenbus_file_priv *u)
 	struct watch_adapter *watch;
 	char *path, *token;
 	int err, rc;
-	LIST_HEAD(staging_q);
 
 	path = u->u.buffer + sizeof(u->u.msg);
 	token = memchr(path, 0, u->u.msg.len);
@@ -523,7 +522,6 @@ static ssize_t xenbus_file_write(struct file *filp,
 	uint32_t msg_type;
 	int rc = len;
 	int ret;
-	LIST_HEAD(staging_q);
 
 	/*
 	 * We're expecting usermode to be writing properly formed
-- 
2.7.4
