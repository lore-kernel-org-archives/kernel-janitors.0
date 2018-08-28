From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 28 Aug 2018 06:56:59 +0000
Subject: [PATCH] ipmi: fix return value of ipmi_set_my_LUN
Message-Id: <1535440056-100270-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: YueHaibing <yuehaibing@huawei.com>, openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/char/ipmi/ipmi_msghandler.c: In function 'ipmi_set_my_LUN':
drivers/char/ipmi/ipmi_msghandler.c:1335:13: warning:
 variable 'rv' set but not used [-Wunused-but-set-variable]
  int index, rv = 0;
  
'rv' should be the correct return value.

Fixes: 048f7c3e352e ("ipmi: Properly release srcu locks on error conditions")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 04f64c5..a74ce88 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -1344,7 +1344,7 @@ int ipmi_set_my_LUN(struct ipmi_user *user,
 		user->intf->addrinfo[channel].lun = LUN & 0x3;
 	release_ipmi_user(user, index);
 
-	return 0;
+	return rv;
 }
 EXPORT_SYMBOL(ipmi_set_my_LUN);
