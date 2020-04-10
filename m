From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Apr 2020 14:18:13 +0000
Subject: [PATCH] media: gspca: remove redundant assignment to variable status
Message-Id: <20200410141813.29497-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191011185746.18570-1-colin.king@canonical.com>
In-Reply-To: <20191011185746.18570-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable status is being assigned a value that is never read.
The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/gspca/mr97310a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/gspca/mr97310a.c b/drivers/media/usb/gspca/mr97310a.c
index 502fc2eaffe0..464aa61cd914 100644
--- a/drivers/media/usb/gspca/mr97310a.c
+++ b/drivers/media/usb/gspca/mr97310a.c
@@ -287,7 +287,6 @@ static int zero_the_pointer(struct gspca_dev *gspca_dev)
 			return err_code;
 
 		err_code = cam_get_response16(gspca_dev, 0x21, 0);
-		status = data[0];
 		tries++;
 		if (err_code < 0)
 			return err_code;
-- 
2.25.1
