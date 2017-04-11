From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Apr 2017 21:21:47 +0000
Subject: [PATCH] staging: rtl8723bs: ensure cmd is large enough for %4s scanf format
Message-Id: <20170411212147.5718-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Larry Finger <Larry.Finger@lwfinger.net>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

char array cmd is being scanned in using a %4s scanf format
specifier and so cmd must be an array of 5 chars. Increase size
to 5 chars to ensure we don't have an overflow.

Detected with static analysis by cppcheck:

"(error) Width 4 given in format string (no. 1) is larger than
destination buffer 'cmd[4]', use %3s to prevent overflowing it."

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
index a2011e06d719..8de65e5c80d5 100644
--- a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
+++ b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
@@ -295,7 +295,7 @@ static ssize_t proc_set_cam(struct file *file, const char __user *buffer, size_t
 	struct adapter *adapter;
 
 	char tmp[32];
-	char cmd[4];
+	char cmd[5];
 	u8 id;
 
 	adapter = (struct adapter *)rtw_netdev_priv(dev);
-- 
2.11.0

