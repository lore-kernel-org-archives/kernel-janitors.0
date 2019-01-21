From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 21 Jan 2019 07:53:13 +0000
Subject: [PATCH -next] staging: rtl8712: drop pointless static qualifier in r8712_efuse_pg_packet_write()
Message-Id: <1548057193-130411-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>
Cc: YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to have the 'intrepeat_times' variable static since new
value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/rtl8712/rtl8712_efuse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_efuse.c b/drivers/staging/rtl8712/rtl8712_efuse.c
index 8bc45ff..39eb743 100644
--- a/drivers/staging/rtl8712/rtl8712_efuse.c
+++ b/drivers/staging/rtl8712/rtl8712_efuse.c
@@ -358,7 +358,7 @@ u8 r8712_efuse_pg_packet_write(struct _adapter *padapter, const u8 offset,
 	u8 pg_header = 0;
 	u16 efuse_addr = 0, curr_size = 0;
 	u8 efuse_data, target_word_cnts = 0;
-	static int repeat_times;
+	int repeat_times;
 	int sub_repeat;
 	u8 bResult = true;
 
