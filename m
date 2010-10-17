From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 17 Oct 2010 14:41:36 +0000
Subject: [PATCH 7/8] char: synclink_gt: fix information leak to userland
Message-Id: <1287326496-8178-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Paul Fulghum <paulkf@microgate.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

Structures tmp_params and new_line are copied to userland with some padding
fields unitialized.  It leads to leaking of stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/char/synclink_gt.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/char/synclink_gt.c b/drivers/char/synclink_gt.c
index 1746d91..c3c2cf8 100644
--- a/drivers/char/synclink_gt.c
+++ b/drivers/char/synclink_gt.c
@@ -1132,6 +1132,7 @@ static long get_params32(struct slgt_info *info, struct MGSL_PARAMS32 __user *us
 	struct MGSL_PARAMS32 tmp_params;
 
 	DBGINFO(("%s get_params32\n", info->device_name));
+	memset(&tmp_params, 0, sizeof(tmp_params));
 	tmp_params.mode            = (compat_ulong_t)info->params.mode;
 	tmp_params.loopback        = info->params.loopback;
 	tmp_params.flags           = info->params.flags;
@@ -1617,6 +1618,8 @@ static int hdlcdev_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 	if (cmd != SIOCWANDEV)
 		return hdlc_ioctl(dev, ifr, cmd);
 
+	memset(&new_line, 0, sizeof(new_line));
+
 	switch(ifr->ifr_settings.type) {
 	case IF_GET_IFACE: /* return current sync_serial_settings */
 
-- 
1.7.0.4

