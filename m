From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Feb 2018 16:21:05 +0000
Subject: [PATCH] mei: remove dev_err message on an unsupported ioctl
Message-Id: <20180227162105.14113-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the driver spams the kernel log on unsupported ioctls which is
unnecessary as the ioctl returns -ENOIOCTLCMD to indicate this anyway.
I suspect this was originally for debugging purposes but it really is not
required so remove it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/mei/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 758dc73602d5..7bb013644aeb 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -507,7 +507,6 @@ static long mei_ioctl(struct file *file, unsigned int cmd, unsigned long data)
 		break;
 
 	default:
-		dev_err(dev->dev, ": unsupported ioctl %d.\n", cmd);
 		rets = -ENOIOCTLCMD;
 	}
 
-- 
2.15.1

