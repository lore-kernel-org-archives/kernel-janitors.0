From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Jun 2019 16:54:05 +0000
Subject: [PATCH] staging: vt6656: fix indentation on break statement
Message-Id: <20190619165405.7784-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Quentin Deslandes <quentin.deslandes@itdev.co.uk>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The break statement is indented one level too deep, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/vt6656/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6656/card.c b/drivers/staging/vt6656/card.c
index 08fc03d8740e..56cd77fd9ea0 100644
--- a/drivers/staging/vt6656/card.c
+++ b/drivers/staging/vt6656/card.c
@@ -166,7 +166,7 @@ static void vnt_calculate_ofdm_rate(u16 rate, u8 bb_type,
 			*tx_rate = 0x8b;
 			*rsv_time = 30;
 		}
-			break;
+		break;
 	case RATE_9M:
 		if (bb_type = BB_TYPE_11A) {
 			*tx_rate = 0x9f;
-- 
2.20.1
