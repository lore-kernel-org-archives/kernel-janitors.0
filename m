From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Aug 2018 14:36:00 +0000
Subject: [PATCH 3/4] media: dvb-usb-v2: fix spelling mistake: "completition" -> "completion"
Message-Id: <20180803143601.4211-4-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180803143601.4211-1-colin.king@canonical.com>
In-Reply-To: <20180803143601.4211-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_dbg and dev_err messages

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/dvb-usb-v2/usb_urb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/usb_urb.c b/drivers/media/usb/dvb-usb-v2/usb_urb.c
index b0499f95ec45..024c751eb165 100644
--- a/drivers/media/usb/dvb-usb-v2/usb_urb.c
+++ b/drivers/media/usb/dvb-usb-v2/usb_urb.c
@@ -40,7 +40,7 @@ static void usb_urb_complete(struct urb *urb)
 		return;
 	default:        /* error */
 		dev_dbg_ratelimited(&stream->udev->dev,
-				"%s: urb completition failed=%d\n",
+				"%s: urb completion failed=%d\n",
 				__func__, urb->status);
 		break;
 	}
@@ -69,7 +69,7 @@ static void usb_urb_complete(struct urb *urb)
 		break;
 	default:
 		dev_err(&stream->udev->dev,
-				"%s: unknown endpoint type in completition handler\n",
+				"%s: unknown endpoint type in completion handler\n",
 				KBUILD_MODNAME);
 		return;
 	}
-- 
2.17.1

