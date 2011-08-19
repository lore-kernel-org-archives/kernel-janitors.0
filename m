From: Dan Carpenter <error27@gmail.com>
Date: Fri, 19 Aug 2011 08:00:55 +0000
Subject: [patch 2/2 -next v2] hid-lg4ff: add a kfree() to an error path
Message-Id: <20110819080055.GH21927@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110818134343.GB21927@shale.localdomain>
 <4E4D2E4A.3020205@bfs.de>
In-Reply-To: <4E4D2E4A.3020205@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Jiri Kosina <jkosina@suse.cz>, open@bfs.de, list@bfs.de, HID CORE LAYER <linux-input@vger.kernel.org>, kernel-janitors@vger.kernel.org

There is a small rare potential memory leak here.  Also Walter Harms
points out that we can do a small cleanup as well by using kstrdup().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index dc38c2d..cbb0089 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -435,12 +435,12 @@ int lg4ff_init(struct hid_device *hid)
 		hid_err(hid, "Cannot add device, insufficient memory.\n");
 		return -ENOMEM;
 	}
-	entry->device_id = (char *)kzalloc(strlen((&hid->dev)->kobj.name) + 1, GFP_KERNEL);
+	entry->device_id = kstrdup((&hid->dev)->kobj.name, GFP_KERNEL);
 	if (!entry->device_id) {
 		hid_err(hid, "Cannot set device_id, insufficient memory.\n");
+		kfree(entry);
 		return -ENOMEM;
 	}
-	strcpy(entry->device_id, (&hid->dev)->kobj.name);
 	entry->min_range = lg4ff_devices[i].min_range;
 	entry->max_range = lg4ff_devices[i].max_range;
 	entry->set_range = lg4ff_devices[i].set_range;

