From: Dan Carpenter <error27@gmail.com>
Date: Mon, 28 Jun 2010 21:20:46 +0000
Subject: [patch] isdn/gigaset: add a kfree() to error path
Message-Id: <20100628212046.GM19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hansjoerg Lipp <hjlipp@web.de>
Cc: Tilman Schmidt <tilman@imap.cc>, Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We should free "commands" here.  The main reason is to please the static
checkers.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/isdn/gigaset/i4l.c b/drivers/isdn/gigaset/i4l.c
index f01c3c2..f1abb8f 100644
--- a/drivers/isdn/gigaset/i4l.c
+++ b/drivers/isdn/gigaset/i4l.c
@@ -419,6 +419,7 @@ oom:
 	dev_err(bcs->cs->dev, "out of memory\n");
 	for (i = 0; i < AT_NUM; ++i)
 		kfree(commands[i]);
+	kfree(commands);
 	return -ENOMEM;
 }
 
