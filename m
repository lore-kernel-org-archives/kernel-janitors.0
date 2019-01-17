From: Colin King <colin.king@canonical.com>
Date: Thu, 17 Jan 2019 00:13:01 +0000
Subject: [PATCH] sb1000: fix a couple of indentation issues
Message-Id: <20190117001301.29948-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an if statement and a return statement that are incorrectly
indented. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/sb1000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/sb1000.c b/drivers/net/sb1000.c
index 7820fced33f6..af4838124f8c 100644
--- a/drivers/net/sb1000.c
+++ b/drivers/net/sb1000.c
@@ -540,12 +540,12 @@ sb1000_activate(const int ioaddr[], const char* name)
 	if ((status = card_send_command(ioaddr, name, Command1, st)))
 		return status;
 	if (st[3] != 0xf1) {
-    	if ((status = sb1000_start_get_set_command(ioaddr, name)))
+		if ((status = sb1000_start_get_set_command(ioaddr, name)))
 			return status;
 		return -EIO;
 	}
 	udelay(1000);
-    return sb1000_start_get_set_command(ioaddr, name);
+	return sb1000_start_get_set_command(ioaddr, name);
 }
 
 /* get SB1000 firmware version */
-- 
2.19.1
