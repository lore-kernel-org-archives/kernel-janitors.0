From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 14 Jul 2010 18:04:42 +0000
Subject: [PATCH 08/11] serial: crisv10: formatting of pointers in printk()
Message-Id: <1279130682-13704-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Arnd Bergmann <arnd@arndb.de>, Jesper Nilsson <jesper.nilsson@axis.com>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org

Use %p instead of %08x in printk().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/serial/crisv10.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/serial/crisv10.c b/drivers/serial/crisv10.c
index ca47072..1be395a 100644
--- a/drivers/serial/crisv10.c
+++ b/drivers/serial/crisv10.c
@@ -4522,8 +4522,8 @@ static int __init rs_init(void)
 		INIT_WORK(&info->work, do_softint);
 
 		if (info->enabled) {
-			printk(KERN_INFO "%s%d at 0x%x is a builtin UART with DMA\n",
-			       serial_driver->name, info->line, (unsigned int)info->ioport);
+			printk(KERN_INFO "%s%d at %p is a builtin UART with DMA\n",
+			       serial_driver->name, info->line, info->ioport);
 		}
 	}
 #ifdef CONFIG_ETRAX_FAST_TIMER
-- 
1.7.0.4

