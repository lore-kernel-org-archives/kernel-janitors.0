From: Chuck Short <zulcss@gmail.com>
Date: Mon, 28 Mar 2005 21:14:19 +0000
Subject: [KJ] [Patch 1/3] Add module version to 3c501.
Message-Id: <27c82343050328131435cc4605@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description: This patch adds MODULE_VERSION to the 3c501 driver

Signed-off-by: Chuck Short <zulcss@gmail.com>

diff -Naur linux-2.6.12-rc1.orig/drivers/net/3c501.c
linux-2.6.12-rc1/drivers/net/3c501.c
--- linux-2.6.12-rc1.orig/drivers/net/3c501.c   2005-03-02
02:37:30.000000000 -0500
+++ linux-2.6.12-rc1/drivers/net/3c501.c        2005-03-27
13:05:37.000000000 -0500
@@ -936,5 +936,6 @@

 MODULE_AUTHOR("Donald Becker, Alan Cox");
 MODULE_DESCRIPTION("Support for the ancient 3Com 3c501 ethernet card");
+MODULE_VERSION(DRV_VERSION);
 MODULE_LICENSE("GPL");
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
