From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Oct 2018 09:59:57 +0000
Subject: [PATCH][usb-next] usb: core: fix memory leak on port_dev_path allocation
Message-Id: <20181003095957.3395-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Jon Flatley <jflat@chromium.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the allocation of port_dev_path from the call to
kobject_get_path is not being kfree'd, causing a memory leak. Fix
this by kfree'ing this at the end of the function. Add an extra
error exit path to fix one of the early leaks when envp[0] fails
to be allocated.

Detected by CoverityScan, CID#1473771 ("Resource Leak")

Fixes: 201af55da8a3 ("usb: core: added uevent for over-current")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/core/hub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 7801bb30bdba..8ae781ce1a80 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5168,7 +5168,7 @@ static void port_over_current_notify(struct usb_port *port_dev)
 
 	envp[0] = kasprintf(GFP_KERNEL, "OVER_CURRENT_PORT=%s", port_dev_path);
 	if (!envp[0])
-		return;
+		goto exit_path;
 
 	envp[1] = kasprintf(GFP_KERNEL, "OVER_CURRENT_COUNT=%u",
 			port_dev->over_current_count);
@@ -5180,6 +5180,8 @@ static void port_over_current_notify(struct usb_port *port_dev)
 	kfree(envp[1]);
 exit:
 	kfree(envp[0]);
+exit_path:
+	kfree(port_dev_path);
 }
 
 static void port_event(struct usb_hub *hub, int port1)
-- 
2.17.1
