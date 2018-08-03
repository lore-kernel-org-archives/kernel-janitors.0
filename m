From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Aug 2018 14:35:58 +0000
Subject: [PATCH 1/4] media: au0828: fix spelling mistake: "completition" -> "completion"
Message-Id: <20180803143601.4211-2-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180803143601.4211-1-colin.king@canonical.com>
In-Reply-To: <20180803143601.4211-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in au0828_isocdbg debug message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/au0828/au0828-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index 70e187971590..62b45062b1e6 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -133,7 +133,7 @@ static void au0828_irq_callback(struct urb *urb)
 		au0828_isocdbg("au0828_irq_callback called: status kill\n");
 		return;
 	default:            /* unknown error */
-		au0828_isocdbg("urb completition error %d.\n", urb->status);
+		au0828_isocdbg("urb completion error %d.\n", urb->status);
 		break;
 	}
 
-- 
2.17.1

