From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Jul 2015 18:52:26 +0000
Subject: [PATCH 2/2] staging: unisys: Reduce indent
Message-Id: <adc0707d1e044973bd20f772e7150ef5c52aaaa0.1436813029.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d6047c2d4dc00ac399310ea33f0c15aef83253b.1436813029.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <0d6047c2d4dc00ac399310ea33f0c15aef83253b.1436813029.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benjamin.romer@unisys.com, david.kershner@unisys.com, gregkh@linuxfoundation.org
Cc: sparmaintainer@unisys.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Remove some extra tabs in order to improve readalibility.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/unisys/visorbus/visorbus_main.c | 49 ++++++++++++-------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/unisys/visorbus/visorbus_main.c b/drivers/staging/unisys/visorbus/visorbus_main.c
index bbc907d..36fc15d 100644
--- a/drivers/staging/unisys/visorbus/visorbus_main.c
+++ b/drivers/staging/unisys/visorbus/visorbus_main.c
@@ -218,9 +218,9 @@ visorbus_release_device(struct device *xdev)
 struct devmajorminor_attribute {
 	struct attribute attr;
 	int slot;
-	 ssize_t (*show)(struct visor_device *, int slot, char *buf);
-	 ssize_t (*store)(struct visor_device *, int slot, const char *buf,
-			  size_t count);
+	ssize_t (*show)(struct visor_device *, int slot, char *buf);
+	ssize_t (*store)(struct visor_device *, int slot, const char *buf,
+			 size_t count);
 };
 
 static ssize_t DEVMAJORMINOR_ATTR(struct visor_device *dev, int slot, char *buf)
@@ -1042,10 +1042,10 @@ write_vbus_chp_info(struct visorchannel *chan,
 	int off = sizeof(struct channel_header) + hdr_info->chp_info_offset;
 
 	if (hdr_info->chp_info_offset = 0)
-			return -1;
+		return -1;
 
 	if (visorchannel_write(chan, off, info, sizeof(*info)) < 0)
-			return -1;
+		return -1;
 	return 0;
 }
 
@@ -1060,10 +1060,10 @@ write_vbus_bus_info(struct visorchannel *chan,
 	int off = sizeof(struct channel_header) + hdr_info->bus_info_offset;
 
 	if (hdr_info->bus_info_offset = 0)
-			return -1;
+		return -1;
 
 	if (visorchannel_write(chan, off, info, sizeof(*info)) < 0)
-			return -1;
+		return -1;
 	return 0;
 }
 
@@ -1080,10 +1080,10 @@ write_vbus_dev_info(struct visorchannel *chan,
 	    (hdr_info->device_info_struct_bytes * devix);
 
 	if (hdr_info->dev_info_offset = 0)
-			return -1;
+		return -1;
 
 	if (visorchannel_write(chan, off, info, sizeof(*info)) < 0)
-			return -1;
+		return -1;
 	return 0;
 }
 
@@ -1105,7 +1105,7 @@ fix_vbus_dev_info(struct visor_device *visordev)
 	struct spar_vbus_headerinfo *hdr_info;
 
 	if (!visordev->device.driver)
-			return;
+		return;
 
 	hdr_info = (struct spar_vbus_headerinfo *)visordev->vbus_hdr_info;
 	if (!hdr_info)
@@ -1318,11 +1318,11 @@ static void
 pause_state_change_complete(struct visor_device *dev, int status)
 {
 	if (!dev->pausing)
-			return;
+		return;
 
 	dev->pausing = false;
 	if (!chipset_responders.device_pause) /* this can never happen! */
-			return;
+		return;
 
 	/* Notify the chipset driver that the pause is complete, which
 	* will presumably want to send some sort of response to the
@@ -1338,11 +1338,11 @@ static void
 resume_state_change_complete(struct visor_device *dev, int status)
 {
 	if (!dev->resuming)
-			return;
+		return;
 
 	dev->resuming = false;
 	if (!chipset_responders.device_resume) /* this can never happen! */
-			return;
+		return;
 
 	/* Notify the chipset driver that the resume is complete,
 	 * which will presumably want to send some sort of response to
@@ -1366,14 +1366,14 @@ initiate_chipset_device_pause_resume(struct visor_device *dev, bool is_pause)
 	else
 		notify_func = chipset_responders.device_resume;
 	if (!notify_func)
-			goto away;
+		goto away;
 
 	drv = to_visor_driver(dev->device.driver);
 	if (!drv)
-			goto away;
+		goto away;
 
 	if (dev->pausing || dev->resuming)
-			goto away;
+		goto away;
 
 	/* Note that even though both drv->pause() and drv->resume
 	 * specify a callback function, it is NOT necessary for us to
@@ -1384,7 +1384,7 @@ initiate_chipset_device_pause_resume(struct visor_device *dev, bool is_pause)
 	 */
 	if (is_pause) {
 		if (!drv->pause)
-				goto away;
+			goto away;
 
 		dev->pausing = true;
 		x = drv->pause(dev, pause_state_change_complete);
@@ -1396,7 +1396,7 @@ initiate_chipset_device_pause_resume(struct visor_device *dev, bool is_pause)
 		 * would never even get here in that case. */
 		fix_vbus_dev_info(dev);
 		if (!drv->resume)
-				goto away;
+			goto away;
 
 		dev->resuming = true;
 		x = drv->resume(dev, resume_state_change_complete);
@@ -1412,7 +1412,7 @@ initiate_chipset_device_pause_resume(struct visor_device *dev, bool is_pause)
 away:
 	if (rc < 0) {
 		if (notify_func)
-				(*notify_func)(dev, rc);
+			(*notify_func)(dev, rc);
 	}
 }
 
@@ -1468,8 +1468,8 @@ visorbus_init(void)
 
 away:
 	if (rc)
-			POSTCODE_LINUX_3(CHIPSET_INIT_FAILURE_PC, rc,
-					 POSTCODE_SEVERITY_ERR);
+		POSTCODE_LINUX_3(CHIPSET_INIT_FAILURE_PC, rc,
+				 POSTCODE_SEVERITY_ERR);
 	return rc;
 }
 
@@ -1494,9 +1494,8 @@ visorbus_exit(void)
 
 	list_for_each_safe(listentry, listtmp, &list_all_bus_instances) {
 		struct visor_device *dev = list_entry(listentry,
-							      struct
-							      visor_device,
-							      list_all);
+						      struct visor_device,
+						      list_all);
 		remove_bus_instance(dev);
 	}
 	remove_bus_type();
-- 
2.1.4

