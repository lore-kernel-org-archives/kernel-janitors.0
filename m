From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Aug 2018 14:36:42 +0000
Subject: [PATCH] ipmi: msghandler: ensure error value in rv is being returned on error
Message-Id: <20180828143642.11138-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently ipmi_set_my_LUN returns 0 instead of -EINVAL if the channel
is out of range.  Fix this by returning the error return rv instead of 0.

Detected by Clang ("variable 'rv' set but not used")

Fixes: 048f7c3e352e ("ipmi: Properly release srcu locks on error conditions")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 04f64c55e275..a74ce885b541 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -1344,7 +1344,7 @@ int ipmi_set_my_LUN(struct ipmi_user *user,
 		user->intf->addrinfo[channel].lun = LUN & 0x3;
 	release_ipmi_user(user, index);
 
-	return 0;
+	return rv;
 }
 EXPORT_SYMBOL(ipmi_set_my_LUN);
 
-- 
2.17.1
