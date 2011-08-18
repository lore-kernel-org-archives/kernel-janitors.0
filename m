From: Dan Carpenter <error27@gmail.com>
Date: Thu, 18 Aug 2011 13:43:43 +0000
Subject: [patch 2/2 -next] hid-lg4ff: add a kfree() to an error path
Message-Id: <20110818134343.GB21927@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, kernel-janitors@vger.kernel.org

There is a small rare potential memory leak here.  But it's easy to
fix.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index dc38c2d..2b4bbcb 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -438,6 +438,7 @@ int lg4ff_init(struct hid_device *hid)
 	entry->device_id = (char *)kzalloc(strlen((&hid->dev)->kobj.name) + 1, GFP_KERNEL);
 	if (!entry->device_id) {
 		hid_err(hid, "Cannot set device_id, insufficient memory.\n");
+		kfree(entry);
 		return -ENOMEM;
 	}
 	strcpy(entry->device_id, (&hid->dev)->kobj.name);
