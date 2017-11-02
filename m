From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Nov 2017 10:11:49 +0000
Subject: [PATCH 3/7] em28xx: fix spelling mistake: "synchronuously" -> "synchronously"
Message-Id: <20171102101153.18225-3-colin.king@canonical.com>
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
 drivers/media/usb/em28xx/em28xx-dvb.c   | 4 ++--
 drivers/media/usb/em28xx/em28xx-video.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 4a7db623fe29..9950a740e04e 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -112,10 +112,10 @@ static inline void print_err_status(struct em28xx *dev,
 
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
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 8d253a5df0a9..a2ba2d905952 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -557,10 +557,10 @@ static inline void print_err_status(struct em28xx *dev,
 
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

