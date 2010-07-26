From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 26 Jul 2010 08:26:22 +0000
Subject: [PATCH] usb: imx21-hcd: set task state with schedule_timeout_uninterruptible()
Message-Id: <1280132783-8182-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Tejun Heo <tj@kernel.org>, Martin Fuzzey <mfuzzey@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

imx21_hc_reset() uses schedule_timeout() without setting state to
STATE_(UN)INTERRUPTIBLE. As it is called in cycle without checking of
pending signals, use schedule_timeout_uninterruptible().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/usb/host/imx21-hcd.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/imx21-hcd.c b/drivers/usb/host/imx21-hcd.c
index ca0e98d..3e56303 100644
--- a/drivers/usb/host/imx21-hcd.c
+++ b/drivers/usb/host/imx21-hcd.c
@@ -1521,7 +1521,7 @@ static int imx21_hc_reset(struct usb_hcd *hcd)
 			return -ETIMEDOUT;
 		}
 		spin_unlock_irq(&imx21->lock);
-		schedule_timeout(1);
+		schedule_timeout_uninterruptible(1);
 		spin_lock_irq(&imx21->lock);
 	}
 	spin_unlock_irqrestore(&imx21->lock, flags);
-- 
1.7.0.4

