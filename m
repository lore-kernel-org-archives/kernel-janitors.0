From: Colin King <colin.king@canonical.com>
Date: Thu, 17 Jan 2019 00:35:43 +0000
Subject: [PATCH][V3] sb1000: fix a couple of indentation issues and remove assignment in if statements
Message-Id: <20190117003543.30718-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an if statement and a return statement that are incorrectly
indented. Fix these.  Also replace the assignment-in-if statements
to assignment followed by an if to keep to the coding style.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: also clean up the assignment-in-if statements too
V3: add missing sb1000 in subject line missing from V2.

---

 drivers/net/sb1000.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/sb1000.c b/drivers/net/sb1000.c
index 7820fced33f6..941cfa8f1c2a 100644
--- a/drivers/net/sb1000.c
+++ b/drivers/net/sb1000.c
@@ -535,17 +535,20 @@ sb1000_activate(const int ioaddr[], const char* name)
 	int status;
 
 	ssleep(1);
-	if ((status = card_send_command(ioaddr, name, Command0, st)))
+	status = card_send_command(ioaddr, name, Command0, st);
+	if (status)
 		return status;
-	if ((status = card_send_command(ioaddr, name, Command1, st)))
+	status = card_send_command(ioaddr, name, Command1, st);
+	if (status)
 		return status;
 	if (st[3] != 0xf1) {
-    	if ((status = sb1000_start_get_set_command(ioaddr, name)))
+		status = sb1000_start_get_set_command(ioaddr, name);
+		if (status)
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
