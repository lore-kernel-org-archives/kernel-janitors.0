From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 16:00:44 +0000
Subject: [PATCH 05/14] vme: Return directly in two functions
Message-Id: <dab1287a-3748-baec-2ace-b7467885be1c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Aug 2017 22:32:14 +0200

Return directly without using an intermediate local variable
in these functions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/vme.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/vme/vme.c b/drivers/vme/vme.c
index a2e36e6a0d84..986799d64993 100644
--- a/drivers/vme/vme.c
+++ b/drivers/vme/vme.c
@@ -1996,28 +1996,26 @@ static int vme_bus_match(struct device *dev, struct device_driver *drv)
 
 static int vme_bus_probe(struct device *dev)
 {
-	int retval = -ENODEV;
 	struct vme_driver *driver;
 	struct vme_dev *vdev = dev_to_vme_dev(dev);
 
 	driver = dev->platform_data;
 	if (driver->probe)
-		retval = driver->probe(vdev);
+		return driver->probe(vdev);
 
-	return retval;
+	return -ENODEV;
 }
 
 static int vme_bus_remove(struct device *dev)
 {
-	int retval = -ENODEV;
 	struct vme_driver *driver;
 	struct vme_dev *vdev = dev_to_vme_dev(dev);
 
 	driver = dev->platform_data;
 	if (driver->remove)
-		retval = driver->remove(vdev);
+		return driver->remove(vdev);
 
-	return retval;
+	return -ENODEV;
 }
 
 struct bus_type vme_bus_type = {
-- 
2.14.0

