From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jun 2020 10:33:29 +0000
Subject: [PATCH] mailbox: mailbox-test: Fix a potential Oops on allocation failure
Message-Id: <20200603103329.GB1845750@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The callers are expecting NULL on error so if we return an error pointer
it eventually results in an Oops.

Fixes: 8ea4484d0c2b ("mailbox: Add generic mechanism for testing Mailbox Controllers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mailbox/mailbox-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 4555d678fadda..51640a7999e6b 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -327,7 +327,7 @@ mbox_test_request_channel(struct platform_device *pdev, const char *name)
 
 	client = devm_kzalloc(&pdev->dev, sizeof(*client), GFP_KERNEL);
 	if (!client)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	client->dev		= &pdev->dev;
 	client->rx_callback	= mbox_test_receive_message;
-- 
2.26.2
