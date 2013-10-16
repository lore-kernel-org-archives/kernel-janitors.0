From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Oct 2013 08:44:25 +0000
Subject: [patch] ALSA: hdsp - info leak in snd_hdsp_hwdep_ioctl()
Message-Id: <20131016084425.GA6287@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Adrian Knoth <adi@drcomp.erfurt.thur.de>, Bill Pemberton <wfp5p@virginia.edu>, speiro@ai2.upv.es

In GCC the sizeof(hdsp_version) is 8 because there is a 2 byte hole at
the end of the struct after ->firmware_rev.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 4f255df..f59a321 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -4845,6 +4845,7 @@ static int snd_hdsp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file, unsigne
 			if ((err = hdsp_get_iobox_version(hdsp)) < 0)
 				return err;
 		}
+		memset(&hdsp_version, 0, sizeof(hdsp_version));
 		hdsp_version.io_type = hdsp->io_type;
 		hdsp_version.firmware_rev = hdsp->firmware_rev;
 		if ((err = copy_to_user(argp, &hdsp_version, sizeof(hdsp_version))))
