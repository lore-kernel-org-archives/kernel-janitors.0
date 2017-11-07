From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Nov 2017 16:45:04 +0000
Subject: [PATCH] usb: host: fix incorrect updating of offset
Message-Id: <20171107164504.5920-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable temp is incorrectly being updated, instead it should
be offset otherwise the loop just reads the same capability value
and loops forever.  Thanks to Alan Stern for pointing out the
correct fix to my original fix.  Fix also cleans up clang warning:

drivers/usb/host/ehci-dbg.c:840:4: warning: Value stored to 'temp'
is never read

Fixes: d49d43174400 ("USB: misc ehci updates")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/ehci-dbg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
index 7fb21d01b3d0..3bd0b2273171 100644
--- a/drivers/usb/host/ehci-dbg.c
+++ b/drivers/usb/host/ehci-dbg.c
@@ -838,7 +838,7 @@ static ssize_t fill_registers_buffer(struct debug_buffer *buf)
 			default:		/* unknown */
 				break;
 			}
-			temp = (cap >> 8) & 0xff;
+			offset = (cap >> 8) & 0xff;
 		}
 	}
 #endif
-- 
2.14.1

