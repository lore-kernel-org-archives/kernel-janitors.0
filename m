From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2011 06:41:41 +0000
Subject: [patch v2] Staging: cx25821: off by one in cx25821_vidioc_s_input()
Message-Id: <20111013064141.GJ18470@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111007132643.GB31424@elgon.mountain>
 <4E94AE2D.4050408@redhat.com>
In-Reply-To: <4E94AE2D.4050408@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, "Leonid V. Fedorenchik" <leonidsbox@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, devel@driverdev.osuosl.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

If "i" is 2 then when we call cx25821_video_mux() we'd end up going
past the end of the cx25821_boards[dev->board]->input[].

The INPUT() macro obfuscates what's going on in that function so it's
a bit hard to follow.  And as Mauro points out the hard coded 2 is
not very helpful.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Use a define instead of the hard coded number 2

diff --git a/drivers/staging/cx25821/cx25821-video.c b/drivers/staging/cx25821/cx25821-video.c
index 084fc08..4d6907c 100644
--- a/drivers/staging/cx25821/cx25821-video.c
+++ b/drivers/staging/cx25821/cx25821-video.c
@@ -1312,7 +1312,7 @@ int cx25821_vidioc_s_input(struct file *file, void *priv, unsigned int i)
 			return err;
 	}
 
-	if (i > 2) {
+	if (i >= CX25821_NR_INPUT) {
 		dprintk(1, "%s(): -EINVAL\n", __func__);
 		return -EINVAL;
 	}
diff --git a/drivers/staging/cx25821/cx25821.h b/drivers/staging/cx25821/cx25821.h
index db2615b..2d2d009 100644
--- a/drivers/staging/cx25821/cx25821.h
+++ b/drivers/staging/cx25821/cx25821.h
@@ -98,6 +98,7 @@
 #define CX25821_BOARD_CONEXANT_ATHENA10 1
 #define MAX_VID_CHANNEL_NUM     12
 #define VID_CHANNEL_NUM 8
+#define CX25821_NR_INPUT 2
 
 struct cx25821_fmt {
 	char *name;
@@ -196,7 +197,7 @@ struct cx25821_board {
 	unsigned char radio_addr;
 
 	u32 clk_freq;
-	struct cx25821_input input[2];
+	struct cx25821_input input[CX25821_NR_INPUT];
 };
 
 struct cx25821_subid {
