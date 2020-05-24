From: Colin King <colin.king@canonical.com>
Date: Sun, 24 May 2020 16:25:03 +0000
Subject: [PATCH] media: gspca: remove redundant assignment to variable retval
Message-Id: <20200524162503.20902-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191011185746.18570-1-colin.king@canonical.com>
In-Reply-To: <20191011185746.18570-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable retval is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/gspca/jl2005bcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/jl2005bcd.c b/drivers/media/usb/gspca/jl2005bcd.c
index 80ce7448b3dd..ca12f33f3e12 100644
--- a/drivers/media/usb/gspca/jl2005bcd.c
+++ b/drivers/media/usb/gspca/jl2005bcd.c
@@ -165,7 +165,7 @@ static int jl2005c_get_firmware_id(struct gspca_dev *gspca_dev)
 {
 	struct sd *sd = (struct sd *)gspca_dev;
 	int i = 0;
-	int retval = -1;
+	int retval;
 	unsigned char regs_to_read[] = {0x57, 0x02, 0x03, 0x5d, 0x5e, 0x5f};
 
 	gspca_dbg(gspca_dev, D_PROBE, "Running jl2005c_get_firmware_id\n");
-- 
2.25.1
