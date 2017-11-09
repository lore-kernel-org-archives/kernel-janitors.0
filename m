From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Nov 2017 17:19:55 +0000
Subject: [PATCH] staging: pi433: fix missing break in switch statement.
Message-Id: <20171109171955.10911-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, Al Viro <viro@zeniv.linux.org.uk>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The PI433_IOC_WR_RX_CFG case is missing a break and will fall through
to the default case and errorenously return -EINVAL. Fix this by
adding in missing break.

Detected by CoverityScan, CID#1461286 ("Missing break in switch")

Fixes: f81f0b5c9a30 ("pi433: sanitize ioctl")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/pi433/pi433_if.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 3bcb59811cdf..a960fe2e7875 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -811,6 +811,7 @@ pi433_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		}
 
 		mutex_unlock(&device->rx_lock);
+		break;
 	default:
 		retval = -EINVAL;
 	}
-- 
2.14.1

