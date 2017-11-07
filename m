From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Nov 2017 18:56:30 +0000
Subject: [PATCH] zd1201: remove unused variable framelen
Message-Id: <20171107185630.7791-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable framelen is assigned but never read, hence it is redundant
and can be removed. Cleans up clang warning:

drivers/net/wireless/zydas/zd1201.c:234:3: warning: Value stored
to 'framelen' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/zydas/zd1201.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/zydas/zd1201.c b/drivers/net/wireless/zydas/zd1201.c
index 581e8577a221..253403899fe9 100644
--- a/drivers/net/wireless/zydas/zd1201.c
+++ b/drivers/net/wireless/zydas/zd1201.c
@@ -230,8 +230,7 @@ static void zd1201_usbrx(struct urb *urb)
 	/* Info frame */
 	if (type = ZD1201_PACKET_INQUIRE) {
 		int i = 0;
-		unsigned short infotype, framelen, copylen;
-		framelen = le16_to_cpu(*(__le16*)&data[4]);
+		unsigned short infotype, copylen;
 		infotype = le16_to_cpu(*(__le16*)&data[6]);
 
 		if (infotype = ZD1201_INF_LINKSTATUS) {
-- 
2.14.1

