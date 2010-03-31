From: Dan Carpenter <error27@gmail.com>
Date: Wed, 31 Mar 2010 17:09:17 +0000
Subject: [patch] thermal: make lockdep happy
Message-Id: <20100331170916.GA13784@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>, casteyde.christian@free.fr
Cc: Andrew Morton <akpm@linux-foundation.org>, Len Brown <len.brown@intel.com>, Matthew Garrett <mjg@redhat.com>, Frans Pop <elendil@planet.nl>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christian,

Can you test this patch?

I wrote this to address bugzilla bug:
	https://bugzilla.kernel.org/show_bug.cgi?id504
	BUG: key ffff88004c3811e0 not in .data! occured in lockdep.c

We now have to call sysfs_attr_init() for dynamically allocated sysfs 
attributes or lockdep complains.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/thermal/thermal_sys.c b/drivers/thermal/thermal_sys.c
index 5066de5..d4fec47 100644
--- a/drivers/thermal/thermal_sys.c
+++ b/drivers/thermal/thermal_sys.c
@@ -725,6 +725,7 @@ int thermal_zone_bind_cooling_device(struct thermal_zone_device *tz,
 		goto release_idr;
 
 	sprintf(dev->attr_name, "cdev%d_trip_point", dev->id);
+	sysfs_attr_init(&dev->attr.attr);
 	dev->attr.attr.name = dev->attr_name;
 	dev->attr.attr.mode = 0444;
 	dev->attr.show = thermal_cooling_device_trip_point_show;
