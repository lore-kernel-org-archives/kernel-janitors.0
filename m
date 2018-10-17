From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 17 Oct 2018 08:15:34 +0000
Subject: [PATCH] staging: rtl8723bs: Fix the return value in case of error in 'rtw_wx_read32()'
Message-Id: <20181017081534.2959-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, quytelda@tamalin.org, straube.linux@gmail.com, mamtashukla555@gmail.com, baijiaju1990@gmail.com, arushisinghal19971997@gmail.com, natechancellor@gmail.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

We return 0 unconditionally in 'rtw_wx_read32()'.
However, 'ret' is set to some error codes in several error handling paths.

Return 'ret' instead to propagate the error code.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 28bfdbdc6e76..b8631baf128d 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2289,7 +2289,7 @@ static int rtw_wx_read32(struct net_device *dev,
 exit:
 	kfree(ptmp);
 
-	return 0;
+	return ret;
 }
 
 static int rtw_wx_write32(struct net_device *dev,
-- 
2.17.1
