From: Borislav Petkov <bbpetkov@yahoo.de>
Date: Wed, 18 Apr 2007 12:49:52 +0000
Subject: [KJ] [PATCH] fix comments for register_netdev()
Message-Id: <20070418124952.GA5948@zmei.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: netdev@vger.kernel.org

Correct the function name in the comments supplied with register_netdev()

Signed-off-by: Borislav Petkov <bbpetkov@yahoo.de>


Index: 21-rc7/net/core/dev.c
=================================--- 21-rc7.orig/net/core/dev.c
+++ 21-rc7/net/core/dev.c
@@ -3002,7 +3002,7 @@ out:
  *	chain. 0 is returned on success. A negative errno code is returned
  *	on a failure to set up the device, or if the name is a duplicate.
  *
- *	This is a wrapper around register_netdev that takes the rtnl semaphore
+ *	This is a wrapper around register_netdevice that takes the rtnl semaphore
  *	and expands the device name if you passed a format string to
  *	alloc_netdev.
  */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
