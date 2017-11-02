From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Nov 2017 10:11:52 +0000
Subject: [PATCH 6/7] stk1160: fix spelling mistake: "synchronuously" -> "synchronously"
Message-Id: <20171102101153.18225-6-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171102101153.18225-1-colin.king@canonical.com>
In-Reply-To: <20171102101153.18225-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Antti Palosaari <crope@iki.fi>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in error message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/stk1160/stk1160-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index ce8ebbe395a6..423c03a0638d 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -38,10 +38,10 @@ static inline void print_err_status(struct stk1160 *dev,
 
 	switch (status) {
 	case -ENOENT:
-		errmsg = "unlinked synchronuously";
+		errmsg = "unlinked synchronously";
 		break;
 	case -ECONNRESET:
-		errmsg = "unlinked asynchronuously";
+		errmsg = "unlinked asynchronously";
 		break;
 	case -ENOSR:
 		errmsg = "Buffer error (overrun)";
-- 
2.14.1

