From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Feb 2013 04:44:38 +0000
Subject: [patch] usb: gadget: u_uac1: NULL dereference on error path
Message-Id: <20130228044438.GB15239@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should return here with an error code instead of continuing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/u_uac1.c b/drivers/usb/gadget/u_uac1.c
index e0c5e88..c7d460f 100644
--- a/drivers/usb/gadget/u_uac1.c
+++ b/drivers/usb/gadget/u_uac1.c
@@ -240,8 +240,11 @@ static int gaudio_open_snd_dev(struct gaudio *card)
 	snd = &card->playback;
 	snd->filp = filp_open(fn_play, O_WRONLY, 0);
 	if (IS_ERR(snd->filp)) {
+		int ret = PTR_ERR(snd->filp);
+
 		ERROR(card, "No such PCM playback device: %s\n", fn_play);
 		snd->filp = NULL;
+		return ret;
 	}
 	pcm_file = snd->filp->private_data;
 	snd->substream = pcm_file->substream;
