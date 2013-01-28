From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Jan 2013 14:19:42 +0000
Subject: [media] staging: go7007: fix test for V4L2_STD_SECAM
Message-Id: <20130128141942.GC24528@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: YAMANE Toshiaki <yamanetoshi@gmail.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-media@vger.kernel.org, Ross Cohen <rcohen@snurgle.org>, kernel-janitors@vger.kernel.org

The current test doesn't make a lot of sense.  It's likely to be true,
which is what we would want in most cases.  From looking at how this is
handled in other drivers,  I think "&" was intended instead of "*".
It's an easy mistake to make because they are next to each other on the
keyboard.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/go7007/wis-saa7113.c b/drivers/staging/media/go7007/wis-saa7113.c
index 8810c1e..891cde7 100644
--- a/drivers/staging/media/go7007/wis-saa7113.c
+++ b/drivers/staging/media/go7007/wis-saa7113.c
@@ -141,7 +141,7 @@ static int wis_saa7113_command(struct i2c_client *client,
 		} else if (dec->norm & V4L2_STD_PAL) {
 			write_reg(client, 0x0e, 0x01);
 			write_reg(client, 0x10, 0x48);
-		} else if (dec->norm * V4L2_STD_SECAM) {
+		} else if (dec->norm & V4L2_STD_SECAM) {
 			write_reg(client, 0x0e, 0x50);
 			write_reg(client, 0x10, 0x48);
 		}
