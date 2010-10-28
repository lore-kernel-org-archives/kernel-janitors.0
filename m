From: Vasiliy Kulikov <segooon@gmail.com>
Date: Thu, 28 Oct 2010 20:02:11 +0000
Subject: [PATCH 8/8] staging: vt6656: implement missing brackets
Message-Id: <1288296132-19302-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Andres More <more.andres@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Shawn Bohrer <shawn.bohrer@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Identation says that copy_to_user() should be called only iff
wrq->u.essid.pointer is not zero.  Also it is useless to call copy_to_user(0, ...).

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 drivers/staging/vt6656/main_usb.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
index e992d5d..7cc3d24 100644
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@ -1675,13 +1675,14 @@ static int  device_ioctl(struct net_device *dev, struct ifreq *rq, int cmd) {
 
 		{
 			char essid[IW_ESSID_MAX_SIZE+1];
-			if (wrq->u.essid.pointer)
+			if (wrq->u.essid.pointer) {
 				rc = iwctl_giwessid(dev, NULL,
 						    &(wrq->u.essid), essid);
 				if (copy_to_user(wrq->u.essid.pointer,
 						         essid,
 						         wrq->u.essid.length) )
 					rc = -EFAULT;
+			}
 		}
 		break;
 
-- 
1.7.0.4

