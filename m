From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 08:09:54 +0000
Subject: [patch] [ALSA] sb16 - info leak in snd_sb_csp_ioctl()
Message-Id: <20131107080954.GS21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

There is a 2 byte hole after "info.func_nr" so we could leak unitialized
stack information to userspace.

Fixes: 1da177e4c3f4 ('Linux-2.6.12-rc2')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index c1aa21e..48da227 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -208,6 +208,7 @@ static int snd_sb_csp_ioctl(struct snd_hwdep * hw, struct file *file, unsigned i
 	switch (cmd) {
 		/* get information */
 	case SNDRV_SB_CSP_IOCTL_INFO:
+		memset(&info, 0, sizeof(info));
 		*info.codec_name = *p->codec_name;
 		info.func_nr = p->func_nr;
 		info.acc_format = p->acc_format;
