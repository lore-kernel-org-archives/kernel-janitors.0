From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 17:01:27 +0000
Subject: [PATCH 1/2] tty-ehv_bytechan: Use kcalloc() in ehv_bc_init()
Message-Id: <8e44e4f8-c6d0-4d7f-97e9-7f9ed62c4bd0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4666b729-217c-ab28-4a3c-25ef703054dd@users.sourceforge.net>
In-Reply-To: <4666b729-217c-ab28-4a3c-25ef703054dd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 18:24:42 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/ehv_bytechan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
index 7ac9bcdf1e61..e17b7c765466 100644
--- a/drivers/tty/ehv_bytechan.c
+++ b/drivers/tty/ehv_bytechan.c
@@ -757,7 +757,7 @@ static int __init ehv_bc_init(void)
 	 * array, then you can use pointer math (e.g. "bc - bcs") to get its
 	 * tty index.
 	 */
-	bcs = kzalloc(count * sizeof(struct ehv_bc_data), GFP_KERNEL);
+	bcs = kcalloc(count, sizeof(*bcs), GFP_KERNEL);
 	if (!bcs)
 		return -ENOMEM;
 
-- 
2.12.2

