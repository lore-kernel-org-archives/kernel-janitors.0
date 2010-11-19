From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 19 Nov 2010 18:41:45 +0000
Subject: [PATCH] serial: ifx6x60: fix memory leak
Message-Id: <1290192105-11494-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Russ Gorby <richardx.r.gorby@intel.com>, linux-kernel@vger.kernel.org

If tty_register_driver() failed then tty_driver is still alive.
Free it with put_tty_driver().

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/serial/ifx6x60.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/serial/ifx6x60.c b/drivers/serial/ifx6x60.c
index 3f8d5ee..ab93763 100644
--- a/drivers/serial/ifx6x60.c
+++ b/drivers/serial/ifx6x60.c
@@ -1384,6 +1384,7 @@ static int __init ifx_spi_init(void)
 	if (result) {
 		pr_err("%s: tty_register_driver failed(%d)",
 			DRVNAME, result);
+		put_tty_driver(tty_drv);
 		return result;
 	}
 
-- 
1.7.0.4

