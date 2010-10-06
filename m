From: Tracey Dent <tdent48227@gmail.com>
Date: Wed, 06 Oct 2010 01:00:22 +0000
Subject: [PATCH 07/28] Staging: comedi: drivers.c: Edit file so that checkpatch.pl has 4 warnings and 0 error
Message-Id: <1286326843-6170-7-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com, abbotti@mev.co.uk, fmhess@users.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed a few lines that made checkpatch.pl complain. Could not get ever warning but
I got it down to to just 4, WARNING: line over 80 characters.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/comedi/drivers.c |   41 ++++++++++++++++++++-----------------
 1 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/comedi/drivers.c b/drivers/staging/comedi/drivers.c
index 4a29ed7..849fa9a 100644
--- a/drivers/staging/comedi/drivers.c
+++ b/drivers/staging/comedi/drivers.c
@@ -1,23 +1,23 @@
 /*
-    module/drivers.c
-    functions for manipulating drivers
+	module/drivers.c
+	functions for manipulating drivers
 
-    COMEDI - Linux Control and Measurement Device Interface
-    Copyright (C) 1997-2000 David A. Schleef <ds@schleef.org>
+	COMEDI - Linux Control and Measurement Device Interface
+	Copyright (C) 1997-2000 David A. Schleef <ds@schleef.org>
 
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
+	This program is free software; you can redistribute it and/or modify
+	it under the terms of the GNU General Public License as published by
+	the Free Software Foundation; either version 2 of the License, or
+	(at your option) any later version.
 
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
+	This program is distributed in the hope that it will be useful,
+	but WITHOUT ANY WARRANTY; without even the implied warranty of
+	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+	GNU General Public License for more details.
 
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+	You should have received a copy of the GNU General Public License
+	along with this program; if not, write to the Free Software
+	Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 
 */
 
@@ -118,7 +118,8 @@ int comedi_device_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 	for (driv = comedi_drivers; driv; driv = driv->next) {
 		if (!try_module_get(driv->module)) {
 			printk
-			    (KERN_INFO "comedi: failed to increment module count, skipping\n");
+			    (KERN_INFO "comedi: failed to increment	\
+					module count, skipping\n");
 			continue;
 		}
 		if (driv->num_names) {
@@ -206,8 +207,9 @@ int comedi_driver_unregister(struct comedi_driver *driver)
 		if (dev->attached && dev->driver = driver) {
 			if (dev->use_count)
 				printk
-				    (KERN_WARNING "BUG! detaching device with use_count=%d\n",
-				     dev->use_count);
+				    (KERN_WARNING "BUG! detaching device     \
+							with use_count=%d\n",
+							dev->use_count);
 			comedi_device_detach(dev);
 		}
 		mutex_unlock(&dev->mutex);
@@ -647,7 +649,8 @@ unsigned comedi_buf_write_free(struct comedi_async *async, unsigned int nbytes)
 	if ((int)(async->buf_write_count + nbytes -
 		  async->buf_write_alloc_count) > 0) {
 		printk
-		    (KERN_INFO "comedi: attempted to write-free more bytes than have been write-allocated.\n");
+		    (KERN_INFO "comedi: attempted to write-free more	\
+				bytes than have been write-allocated.\n");
 		nbytes = async->buf_write_alloc_count - async->buf_write_count;
 	}
 	async->buf_write_count += nbytes;
-- 
1.7.3.1.50.g1e633

