From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 13 Jan 2013 20:03:42 +0000
Subject: [patch] prism54: bug in getting auth type
Message-Id: <20130113200342.GC5907@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a missing break statement so SHARED_KEY authentication doesn't
work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker fix.  Untested.

diff --git a/drivers/net/wireless/prism54/isl_ioctl.c b/drivers/net/wireless/prism54/isl_ioctl.c
index 4e44b1a..1c22b81 100644
--- a/drivers/net/wireless/prism54/isl_ioctl.c
+++ b/drivers/net/wireless/prism54/isl_ioctl.c
@@ -1503,6 +1503,7 @@ static int prism54_get_auth(struct net_device *ndev,
 			case DOT11_AUTH_BOTH:
 			case DOT11_AUTH_SK:
 				param->value = IW_AUTH_ALG_SHARED_KEY;
+				break;
 			case DOT11_AUTH_NONE:
 			default:
 				param->value = 0;
