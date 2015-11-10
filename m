From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Nov 2015 22:23:53 +0000
Subject: [patch 2/2] [media] av7110: potential divide by zero
Message-Id: <20151110222353.GE30281@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

"len" comes from dvb_video_ioctl() and there is a possibility that it is
zero.  We do a divide by len later in the function so that's not ok.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/pci/ttpci/av7110_av.c b/drivers/media/pci/ttpci/av7110_av.c
index ccb3b2c..1cf9060 100644
--- a/drivers/media/pci/ttpci/av7110_av.c
+++ b/drivers/media/pci/ttpci/av7110_av.c
@@ -1045,6 +1045,9 @@ static int play_iframe(struct av7110 *av7110, char __user *buf, unsigned int len
 
 	dprintk(2, "av7110:%p, \n", av7110);
 
+	if (len = 0)
+		return 0;
+
 	if (!(av7110->playing & RP_VIDEO)) {
 		if (av7110_av_start_play(av7110, RP_VIDEO) < 0)
 			return -EBUSY;
