From: Laurent Navet <laurent.navet@gmail.com>
Date: Mon, 03 Dec 2012 13:20:25 +0000
Subject: [PATCH] line6: Use kmemdup rather than duplicating its implementation
Message-Id: <1354540825-17735-1-git-send-email-laurent.navet@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org
Cc: line6linux-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, Laurent Navet <laurent.navet@gmail.com>

staging: line6: driver.c
 The semantic patch that makes this output is available
 in scripts/coccinelle/api/memdup.cocci.

Signed-off-by: Laurent Navet <laurent.navet@gmail.com>
---
 drivers/staging/line6/driver.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/line6/driver.c b/drivers/staging/line6/driver.c
index f5c19b2..e1d6241 100644
--- a/drivers/staging/line6/driver.c
+++ b/drivers/staging/line6/driver.c
@@ -331,14 +331,13 @@ int line6_version_request_async(struct usb_line6 *line6)
 	char *buffer;
 	int retval;
 
-	buffer = kmalloc(sizeof(line6_request_version), GFP_ATOMIC);
+	buffer = kmemdup(line6_request_version,
+			sizeof(line6_request_version), GFP_ATOMIC);
 	if (buffer = NULL) {
 		dev_err(line6->ifcdev, "Out of memory");
 		return -ENOMEM;
 	}
 
-	memcpy(buffer, line6_request_version, sizeof(line6_request_version));
-
 	retval = line6_send_raw_message_async(line6, buffer,
 					      sizeof(line6_request_version));
 	kfree(buffer);
-- 
1.7.10.4

