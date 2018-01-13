From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 12:20:04 +0000
Subject: [PATCH] usb/host/imx21: Use seq_putc() in debug_etd_show()
Message-Id: <be83a976-fb8a-06f3-0391-82b144c8dd7f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 13:12:06 +0100

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/host/imx21-dbg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/imx21-dbg.c b/drivers/usb/host/imx21-dbg.c
index b964f9a51d87..424dc705cc19 100644
--- a/drivers/usb/host/imx21-dbg.c
+++ b/drivers/usb/host/imx21-dbg.c
@@ -327,7 +327,7 @@ static int debug_etd_show(struct seq_file *s, void *v)
 				dword,
 				buf);
 		}
-		seq_printf(s, "\n");
+		seq_putc(s, '\n');
 	}
 
 	spin_unlock_irqrestore(&imx21->lock, flags);
-- 
2.15.1

