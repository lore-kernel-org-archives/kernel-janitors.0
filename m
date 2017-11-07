From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Nov 2017 10:27:59 +0000
Subject: [PATCH] USB: remove redundant assignment to temp
Message-Id: <20171107102759.10456-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable temp is being set at the end of each loop iteration
but this value is never read, it is either being updated in just
the case 1 block or at the end of the loop.  Thus the assignment
is redundant and can be removed.  Cleans up clang warning:

drivers/usb/host/ehci-dbg.c:840:4: warning: Value stored to 'temp'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/ehci-dbg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
index 7fb21d01b3d0..70d4768958be 100644
--- a/drivers/usb/host/ehci-dbg.c
+++ b/drivers/usb/host/ehci-dbg.c
@@ -838,7 +838,6 @@ static ssize_t fill_registers_buffer(struct debug_buffer *buf)
 			default:		/* unknown */
 				break;
 			}
-			temp = (cap >> 8) & 0xff;
 		}
 	}
 #endif
-- 
2.14.1

