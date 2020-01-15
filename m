From: Dan Carpenter <dan.carpenter@oracle.com>, syzbot <syzbot+784ccb935f9900cc7c9e@sy
Date: Wed, 15 Jan 2020 17:46:28 +0000
Subject: [PATCH] HID: hiddev: Fix race in in hiddev_disconnect()
Message-Id: <20200115174628.zxpxbpa6bwspjajg@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.2001141100290.1593-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, andreyknvl@google.com, syzkaller-bugs@googlegroups.com
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Syzbot reports that "hiddev" is used after it's free in hiddev_disconnect().
The hiddev_disconnect() function sets "hiddev->exist = 0;" so
hiddev_release() can free it as soon as we drop the "existancelock"
lock.  This patch moves the mutex_unlock(&hiddev->existancelock) until
after we have finished using it.

Reported-by: syzbot+784ccb935f9900cc7c9e@syzkaller.appspotmail.com
Fixes: 7f77897ef2b6 ("HID: hiddev: fix potential use-after-free")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hid/usbhid/hiddev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index a970b809d778..4140dea693e9 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -932,9 +932,9 @@ void hiddev_disconnect(struct hid_device *hid)
 	hiddev->exist = 0;
 
 	if (hiddev->open) {
-		mutex_unlock(&hiddev->existancelock);
 		hid_hw_close(hiddev->hid);
 		wake_up_interruptible(&hiddev->wait);
+		mutex_unlock(&hiddev->existancelock);
 	} else {
 		mutex_unlock(&hiddev->existancelock);
 		kfree(hiddev);
-- 
2.11.0
