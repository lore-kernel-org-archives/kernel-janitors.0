From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:55:14 +0000
Subject: [PATCH 12/14] staging: vme: fix device_register() error handling
Message-Id: <1284900914-24728-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Martyn Welch <martyn.welch@ge.com>, Bill Pemberton <wfp5p@virginia.edu>, Tejun Heo <tj@kernel.org>, Huang Weiyi <weiyi.huang@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

If device_register() fails then call put_device().
See comment to device_register.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 compile tested.

 drivers/staging/vme/vme.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/vme/vme.c b/drivers/staging/vme/vme.c
index 093fbff..c08668d 100644
--- a/drivers/staging/vme/vme.c
+++ b/drivers/staging/vme/vme.c
@@ -1357,8 +1357,10 @@ int vme_register_bridge(struct vme_bridge *bridge)
 		dev_set_name(dev, "vme-%x.%x", bridge->num, i + 1);
 
 		retval = device_register(dev);
-		if (retval)
+		if (retval) {
+			put_device(dev);
 			goto err_reg;
+		}
 	}
 
 	return retval;
-- 
1.7.0.4

