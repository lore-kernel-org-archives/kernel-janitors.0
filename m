From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2012 14:47:28 +0000
Subject: [media] tvp5150: signedness bug in tvp5150_selmux()
Message-Id: <20120712144727.GC24202@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Javier Martin <javier.martin@vista-silicon.com>, Hans Verkuil <hans.verkuil@cisco.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

tvp5150_read() returns negative error codes so this needs to be an int
for the error handling to work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/video/tvp5150.c b/drivers/media/video/tvp5150.c
index 0d897cb..a751b6c 100644
--- a/drivers/media/video/tvp5150.c
+++ b/drivers/media/video/tvp5150.c
@@ -257,7 +257,7 @@ static inline void tvp5150_selmux(struct v4l2_subdev *sd)
 	int opmode = 0;
 	struct tvp5150 *decoder = to_tvp5150(sd);
 	int input = 0;
-	unsigned char val;
+	int val;
 
 	if ((decoder->output & TVP5150_BLACK_SCREEN) || !decoder->enable)
 		input = 8;
