From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Sep 2017 13:22:54 +0000
Subject: [PATCH][ipmi-next] ipmi: remove redundant initialization of bmc
Message-Id: <20170928132254.7639-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corey Minyard <minyard@acm.org>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer bmc is being initialized and this initialized value is
never being read, so this is assignment redundant and can be removed.
Cleans up clang warning:

warning: Value stored to 'bmc' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index c29d46bef6b3..9de189db2cc3 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -2941,7 +2941,7 @@ static int __ipmi_bmc_register(ipmi_smi_t intf,
 			       bool guid_set, guid_t *guid, int intf_num)
 {
 	int               rv;
-	struct bmc_device *bmc = intf->bmc;
+	struct bmc_device *bmc;
 	struct bmc_device *old_bmc;
 
 	/*
-- 
2.14.1

