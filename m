From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Jun 2019 16:50:27 +0000
Subject: [PATCH] staging: rtl8723bs: os_dep: fix indentation on break statement
Message-Id: <20190619165027.6860-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The break statement is indented one level too deep, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index ea50ec424e50..6ca896128b73 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -1181,7 +1181,7 @@ static int rtw_wx_set_wap(struct net_device *dev,
 				spin_unlock_bh(&queue->lock);
 				goto exit;
 			}
-				break;
+			break;
 		}
 
 	}
-- 
2.20.1
