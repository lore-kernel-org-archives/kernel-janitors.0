From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 23 Oct 2012 19:57:08 +0000
Subject: [PATCH 05/23] pwc: Replace memcpy with struct assignment
Message-Id: <1351022246-8201-5-git-send-email-elezegarcia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Julia.Lawall@lip6.fr, kernel-janitors@vger.kernel.org, Ezequiel Garcia <elezegarcia@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Peter Senna Tschudin <peter.senna@gmail.com>

This kind of memcpy() is error-prone. Its replacement with a struct
assignment is prefered because it's type-safe and much easier to read.

Found by coccinelle. Hand patched and reviewed.
Tested by compilation only.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier struct_name;
struct struct_name to;
struct struct_name from;
expression E;
@@
-memcpy(&(to), &(from), E);
+to = from;
// </smpl>

Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/media/usb/pwc/pwc-if.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index 42e36ba..cc5c7d8 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -1003,7 +1003,7 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 	vb2_queue_init(&pdev->vb_queue);
 
 	/* Init video_device structure */
-	memcpy(&pdev->vdev, &pwc_template, sizeof(pwc_template));
+	pdev->vdev = pwc_template;
 	strcpy(pdev->vdev.name, name);
 	pdev->vdev.queue = &pdev->vb_queue;
 	pdev->vdev.queue->lock = &pdev->vb_queue_lock;
-- 
1.7.4.4

