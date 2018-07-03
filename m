From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Jul 2018 07:32:49 +0000
Subject: [PATCH] misc: ti-st: remove redundant variable 'type'
Message-Id: <20180703073249.29522-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable type is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'type' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/ti-st/st_kim.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/ti-st/st_kim.c b/drivers/misc/ti-st/st_kim.c
index 5ec3f5a43718..28fba5b3625e 100644
--- a/drivers/misc/ti-st/st_kim.c
+++ b/drivers/misc/ti-st/st_kim.c
@@ -138,7 +138,7 @@ static void kim_int_recv(struct kim_data_s *kim_gdata,
 	const unsigned char *data, long count)
 {
 	const unsigned char *ptr;
-	int len = 0, type = 0;
+	int len = 0;
 	unsigned char *plen;
 
 	pr_debug("%s", __func__);
@@ -183,7 +183,6 @@ static void kim_int_recv(struct kim_data_s *kim_gdata,
 		case 0x04:
 			kim_gdata->rx_state = ST_W4_HEADER;
 			kim_gdata->rx_count = 2;
-			type = *ptr;
 			break;
 		default:
 			pr_info("unknown packet");
-- 
2.17.1

