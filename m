From: Colin King <colin.king@canonical.com>
Date: Sat, 08 Feb 2020 16:50:22 +0000
Subject: [PATCH] usb: typec: ucsi: remove redundant assignment to variable num
Message-Id: <20200208165022.30429-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable num is being assigned with a value that is never read, it is
assigned a new value later in a for-loop. The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index d5a6aac86327..b1b72cb7af10 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -400,7 +400,7 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 	struct typec_altmode_desc desc;
 	struct ucsi_altmode alt[2];
 	u64 command;
-	int num = 1;
+	int num;
 	int ret;
 	int len;
 	int j;
-- 
2.25.0
