From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Nov 2020 19:24:15 +0000
Subject: [PATCH] auxdisplay: fix use after free in lcd2s_i2c_remove()
Message-Id: <20201106192415.GA2696904@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Lars Poeschel <poeschel@lemonage.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The kfree() needs to be moved down a line to prevent a use after free.

Fixes: 8c9108d014c5 ("auxdisplay: add a driver for lcd2s character display")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/auxdisplay/lcd2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/auxdisplay/lcd2s.c b/drivers/auxdisplay/lcd2s.c
index cfa5f86deeef..3eb7f04db6cb 100644
--- a/drivers/auxdisplay/lcd2s.c
+++ b/drivers/auxdisplay/lcd2s.c
@@ -348,8 +348,8 @@ static int lcd2s_i2c_remove(struct i2c_client *i2c)
 {
 	struct lcd2s_data *lcd2s = i2c_get_clientdata(i2c);
 
-	kfree(lcd2s->charlcd);
 	charlcd_unregister(lcd2s->charlcd);
+	kfree(lcd2s->charlcd);
 	return 0;
 }
 
-- 
2.28.0
