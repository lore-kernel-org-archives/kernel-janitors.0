From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Oct 2019 09:52:40 +0000
Subject: [PATCH] media: cx18: make array mapping static, makes object smaller
Message-Id: <20191007095240.29540-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Walls <awalls@md.metrocast.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array mapping on the stack but instead make it
static. Makes the object code smaller by 79 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  27572	   2096	      0	  29668	   73e4	drivers/media/pci/cx18/cx18-ioctl.o

After:
   text	   data	    bss	    dec	    hex	filename
  27429	   2160	      0	  29589	   7395	drivers/media/pci/cx18/cx18-ioctl.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/cx18/cx18-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 85f3e7307538..fa57e12f2ac8 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -664,7 +664,7 @@ static int _cx18_process_idx_data(struct cx18_buffer *buf,
 	struct cx18_enc_idx_entry *e_buf;
 
 	/* Frame type lookup: 1=I, 2=P, 4=B */
-	const int mapping[8] = {
+	static const int mapping[8] = {
 		-1, V4L2_ENC_IDX_FRAME_I, V4L2_ENC_IDX_FRAME_P,
 		-1, V4L2_ENC_IDX_FRAME_B, -1, -1, -1
 	};
-- 
2.20.1
