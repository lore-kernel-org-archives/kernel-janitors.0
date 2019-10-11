From: Colin King <colin.king@canonical.com>
Date: Fri, 11 Oct 2019 18:57:46 +0000
Subject: [PATCH] media: gspca: remove redundant assignment to variable ret
Message-Id: <20191011185746.18570-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that
is never read and is being re-assigned a little later on. The
assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/gspca/stv0680.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/stv0680.c b/drivers/media/usb/gspca/stv0680.c
index f869eb6065ce..b23988d8c7bc 100644
--- a/drivers/media/usb/gspca/stv0680.c
+++ b/drivers/media/usb/gspca/stv0680.c
@@ -35,7 +35,7 @@ struct sd {
 static int stv_sndctrl(struct gspca_dev *gspca_dev, int set, u8 req, u16 val,
 		       int size)
 {
-	int ret = -1;
+	int ret;
 	u8 req_type = 0;
 	unsigned int pipe = 0;
 
-- 
2.20.1
