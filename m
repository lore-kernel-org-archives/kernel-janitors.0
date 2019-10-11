From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 11 Oct 2019 20:48:29 +0000
Subject: [PATCH] media: i2c: adv7842: make array cri static and const, makes object smaller
Message-Id: <20191011204829.11537-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hverkuil-cisco@xs4all.nl, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Don't populate the array 'cri' on the stack but instead make it
static and const. Makes the object code smaller by 165 bytes.

Turn the 2nd parameter of 'log_infoframe()' const accordingly.

Before:
   text	   data	    bss	    dec	    hex	filename
  98533	  20024	    256	 118813	  1d01d	drivers/media/i2c/adv7842.o

After:
   text	   data	    bss	    dec	    hex	filename
  98304	  20088	    256	 118648	  1cf78	drivers/media/i2c/adv7842.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/i2c/adv7842.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 885619841719..0855f648416d 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -2547,7 +2547,7 @@ struct adv7842_cfg_read_infoframe {
 	u8 payload_addr;
 };
 
-static void log_infoframe(struct v4l2_subdev *sd, struct adv7842_cfg_read_infoframe *cri)
+static void log_infoframe(struct v4l2_subdev *sd, const struct adv7842_cfg_read_infoframe *cri)
 {
 	int i;
 	u8 buffer[32];
@@ -2585,7 +2585,7 @@ static void log_infoframe(struct v4l2_subdev *sd, struct adv7842_cfg_read_infofr
 static void adv7842_log_infoframes(struct v4l2_subdev *sd)
 {
 	int i;
-	struct adv7842_cfg_read_infoframe cri[] = {
+	static const struct adv7842_cfg_read_infoframe cri[] = {
 		{ "AVI", 0x01, 0xe0, 0x00 },
 		{ "Audio", 0x02, 0xe3, 0x1c },
 		{ "SDP", 0x04, 0xe6, 0x2a },
-- 
2.20.1
