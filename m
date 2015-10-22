From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Oct 2015 19:51:27 +0000
Subject: [patch] mailbox: Off by one in mbox_test_message_read()
Message-Id: <20151022195127.GA24439@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to leave space for the NUL char.

Fixes: 8ea4484d0c2b ('mailbox: Add generic mechanism for testing Mailbox Controllers')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Btw, if we fill up the entire buffer then we don't copy the last NUL to
the user.

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 22f2e40..feff8fb 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -142,7 +142,7 @@ static ssize_t mbox_test_message_read(struct file *filp, char __user *userbuf,
 	int l = 0;
 	int ret;
 
-	touser = kzalloc(MBOX_HEXDUMP_MAX_LEN, GFP_KERNEL);
+	touser = kzalloc(MBOX_HEXDUMP_MAX_LEN + 1, GFP_KERNEL);
 	if (!touser)
 		return -ENOMEM;
 
