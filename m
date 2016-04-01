From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Apr 2016 11:04:23 +0000
Subject: [patch] uio: add missing error codes
Message-Id: <20160401110423.GC6048@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Hans J. Koch" <hjk@hansjkoch.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that "ret" could be uninitialized at the
end, which is true but it's more likely that it would be set to zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index bcc1fc0..fba021f 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -271,12 +271,16 @@ static int uio_dev_add_attributes(struct uio_device *idev)
 			map_found = 1;
 			idev->map_dir = kobject_create_and_add("maps",
 							&idev->dev->kobj);
-			if (!idev->map_dir)
+			if (!idev->map_dir) {
+				ret = -ENOMEM;
 				goto err_map;
+			}
 		}
 		map = kzalloc(sizeof(*map), GFP_KERNEL);
-		if (!map)
+		if (!map) {
+			ret = -ENOMEM;
 			goto err_map_kobj;
+		}
 		kobject_init(&map->kobj, &map_attr_type);
 		map->mem = mem;
 		mem->map = map;
@@ -296,12 +300,16 @@ static int uio_dev_add_attributes(struct uio_device *idev)
 			portio_found = 1;
 			idev->portio_dir = kobject_create_and_add("portio",
 							&idev->dev->kobj);
-			if (!idev->portio_dir)
+			if (!idev->portio_dir) {
+				ret = -ENOMEM;
 				goto err_portio;
+			}
 		}
 		portio = kzalloc(sizeof(*portio), GFP_KERNEL);
-		if (!portio)
+		if (!portio) {
+			ret = -ENOMEM;
 			goto err_portio_kobj;
+		}
 		kobject_init(&portio->kobj, &portio_attr_type);
 		portio->port = port;
 		port->portio = portio;
