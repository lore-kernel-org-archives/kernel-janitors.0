From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Aug 2018 11:09:23 +0000
Subject: [PATCH] misc: apds990x: remove unused array ir_currents
Message-Id: <20180807110923.16550-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array ir_currents is declared but never used, hence it is redundant
and can be removed.

Cleans up clang warning:
warning: 'ir_currents' defined but not used [-Wunused-const-variable=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/apds990x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/apds990x.c b/drivers/misc/apds990x.c
index ed9412d750b7..24876c615c3c 100644
--- a/drivers/misc/apds990x.c
+++ b/drivers/misc/apds990x.c
@@ -188,7 +188,6 @@ struct apds990x_chip {
 #define APDS_LUX_DEFAULT_RATE		200
 
 static const u8 again[]	= {1, 8, 16, 120}; /* ALS gain steps */
-static const u8 ir_currents[]	= {100, 50, 25, 12}; /* IRled currents in mA */
 
 /* Following two tables must match i.e 10Hz rate means 1 as persistence value */
 static const u16 arates_hz[] = {10, 5, 2, 1};
-- 
2.17.1

