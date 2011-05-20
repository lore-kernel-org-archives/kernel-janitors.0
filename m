From: matt mooney <mfm@muteddisk.com>
Date: Fri, 20 May 2011 04:37:04 +0000
Subject: [PATCH 10/12] staging: usbip: userspace: bind_driver.c: update kernel module name
Message-Id: <7d1b45b1168cc014fde245ad766b81cf303c4e66.1305866084.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305866084.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305866084.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Change kernel module name to usbip-host.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/userspace/src/bind-driver.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/usbip/userspace/src/bind-driver.c b/drivers/staging/usbip/userspace/src/bind-driver.c
index 201ffbb..dcc540a 100644
--- a/drivers/staging/usbip/userspace/src/bind-driver.c
+++ b/drivers/staging/usbip/userspace/src/bind-driver.c
@@ -27,7 +27,7 @@ static const struct option longopts[] = {
 	{NULL,		0,			NULL,  0}
 };
 
-static const char match_busid_path[] = "/sys/bus/usb/drivers/usbip/match_busid";
+static const char match_busid_path[] = "/sys/bus/usb/drivers/usbip-host/match_busid";
 
 
 static void show_help(void)
@@ -228,7 +228,7 @@ static int bind_to_usbip(char *busid)
 	for (i = 0; i < ninterface; i++) {
 		int ret;
 
-		ret = bind_interface(busid, configvalue, i, "usbip");
+		ret = bind_interface(busid, configvalue, i, "usbip-host");
 		if (ret < 0) {
 			g_warning("bind usbip at %s:%d.%d, failed",
 					busid, configvalue, i);
-- 
1.7.5.1

