From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Aug 2018 14:36:01 +0000
Subject: [PATCH 4/4] media: dvb-usb: fix spelling mistake: "completition" -> "completion"
Message-Id: <20180803143601.4211-5-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180803143601.4211-1-colin.king@canonical.com>
In-Reply-To: <20180803143601.4211-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in debug and error messages

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/dvb-usb/usb-urb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/usb-urb.c b/drivers/media/usb/dvb-usb/usb-urb.c
index 5e05963f4220..9771f0954c69 100644
--- a/drivers/media/usb/dvb-usb/usb-urb.c
+++ b/drivers/media/usb/dvb-usb/usb-urb.c
@@ -33,7 +33,7 @@ static void usb_urb_complete(struct urb *urb)
 		case -ESHUTDOWN:
 			return;
 		default:        /* error */
-			deb_ts("urb completition error %d.\n", urb->status);
+			deb_ts("urb completion error %d.\n", urb->status);
 			break;
 	}
 
@@ -57,7 +57,7 @@ static void usb_urb_complete(struct urb *urb)
 				stream->complete(stream, b, urb->actual_length);
 			break;
 		default:
-			err("unknown endpoint type in completition handler.");
+			err("unknown endpoint type in completion handler.");
 			return;
 	}
 	usb_submit_urb(urb,GFP_ATOMIC);
-- 
2.17.1

