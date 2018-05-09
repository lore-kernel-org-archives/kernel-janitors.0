From: Colin King <colin.king@canonical.com>
Date: Wed, 09 May 2018 09:07:31 +0000
Subject: [PATCH] [media] cx231xx: Fix spelling mistake: "senario" -> "scenario"
Message-Id: <20180509090731.11275-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c
index 5bc74149fcb9..746c34ab0ec8 100644
--- a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c
+++ b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c
@@ -769,7 +769,7 @@ int initialize_cx231xx(struct cx231xx *dev)
 			break;
 		default:
 			dev_err(dev->dev,
-				"bad senario!!!!!\nconfig_info=%x\n",
+				"bad scenario!!!!!\nconfig_info=%x\n",
 				config_info & SELFPOWER_MASK);
 			return -ENODEV;
 		}
-- 
2.17.0

