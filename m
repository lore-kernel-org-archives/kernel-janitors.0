From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Nov 2017 10:11:51 +0000
Subject: [PATCH 5/7] pwc: fix spelling mistake: "synchronuously" -> "synchronously"
Message-Id: <20171102101153.18225-5-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171102101153.18225-1-colin.king@canonical.com>
In-Reply-To: <20171102101153.18225-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Antti Palosaari <crope@iki.fi>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in error message text and break line
to clean up checkpatch warning

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/pwc/pwc-if.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index eb6921d2743e..54b036d39c5b 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -262,7 +262,8 @@ static void pwc_isoc_handler(struct urb *urb)
 
 	if (urb->status = -ENOENT || urb->status = -ECONNRESET ||
 	    urb->status = -ESHUTDOWN) {
-		PWC_DEBUG_OPEN("URB (%p) unlinked %ssynchronuously.\n", urb, urb->status = -ENOENT ? "" : "a");
+		PWC_DEBUG_OPEN("URB (%p) unlinked %ssynchronously.\n",
+			       urb, urb->status = -ENOENT ? "" : "a");
 		return;
 	}
 
-- 
2.14.1

