From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jul 2013 05:50:49 +0000
Subject: [patch] virtio: console: fix error handling for debugfs_create_dir()
Message-Id: <20130719055049.GD9729@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Amit Shah <amit.shah@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

debugfs_create_dir() returns ERR_PTR(-ENODEV) if debugfs is disabled.
Also my static checker doesn't like it when we print the error code, but
it's always just NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 1b456fe..ad2cd6d 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -2215,7 +2215,7 @@ static int __init init(void)
 	}
 
 	pdrvdata.debugfs_dir = debugfs_create_dir("virtio-ports", NULL);
-	if (!pdrvdata.debugfs_dir) {
+	if (IS_ERR_OR_NULL(pdrvdata.debugfs_dir)) {
 		pr_warning("Error %ld creating debugfs dir for virtio-ports\n",
 			   PTR_ERR(pdrvdata.debugfs_dir));
 	}
