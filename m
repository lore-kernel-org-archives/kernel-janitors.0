From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 14:02:19 +0000
Subject: [PATCH 03/11] virtio_console: Rename a jump label in init()
Message-Id: <47b70aab-df6b-0765-e666-ceaff93ffad8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <020438b9-a7f8-0050-04c1-43382ba60b75@users.sourceforge.net>
In-Reply-To: <020438b9-a7f8-0050-04c1-43382ba60b75@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtualization@lists.linux-foundation.org, Amit Shah <amit.shah@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 14:10:24 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/virtio_console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index bf0ad57..004314e 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -2309,7 +2309,7 @@ static int __init init(void)
 	err = register_virtio_driver(&virtio_console);
 	if (err < 0) {
 		pr_err("Error %d registering virtio driver\n", err);
-		goto free;
+		goto remove;
 	}
 	err = register_virtio_driver(&virtio_rproc_serial);
 	if (err < 0) {
@@ -2318,9 +2318,9 @@ static int __init init(void)
 		goto unregister;
 	}
 	return 0;
-unregister:
+ unregister:
 	unregister_virtio_driver(&virtio_console);
-free:
+ remove:
 	debugfs_remove_recursive(pdrvdata.debugfs_dir);
 	class_destroy(pdrvdata.class);
 	return err;
-- 
2.10.0

