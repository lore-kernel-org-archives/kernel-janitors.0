From: Jiri Olsa <jolsa@redhat.com>
Date: Thu, 06 May 2010 17:36:15 +0000
Subject: [PATCH 11/13] drivers/video: removing redundant ifdefs
Message-Id: <1273167377-14270-12-git-send-email-jolsa@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273167377-14270-1-git-send-email-jolsa@redhat.com>
In-Reply-To: <1273167377-14270-1-git-send-email-jolsa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, ysato@users.sourceforge.jp, tony.luck@intel.com, dhowells@redhat.com, kyle@mcmartin.ca, benh@kernel.crashing.org, schwidefsky@de.ibm.com, jgarzik@pobox.com, hare@suse.de, felipe.balbi@nokia.com, Jiri Olsa <jolsa@redhat.com>

wbr,
jirka


Signed-off-by: Jiri Olsa <jolsa@redhat.com>
---
 drivers/video/atafb.c                   |    2 --
 drivers/video/matrox/matroxfb_DAC1064.c |    5 +----
 2 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/video/atafb.c b/drivers/video/atafb.c
index f3aada2..5b2b5ef 100644
--- a/drivers/video/atafb.c
+++ b/drivers/video/atafb.c
@@ -1718,11 +1718,9 @@ static int falcon_setcolreg(unsigned int regno, unsigned int red,
 			(((red & 0xe000) >> 13) | ((red & 0x1000) >> 12) << 8) |
 			(((green & 0xe000) >> 13) | ((green & 0x1000) >> 12) << 4) |
 			((blue & 0xe000) >> 13) | ((blue & 0x1000) >> 12);
-#ifdef ATAFB_FALCON
 		((u32 *)info->pseudo_palette)[regno] = ((red & 0xf800) |
 						       ((green & 0xfc00) >> 5) |
 						       ((blue & 0xf800) >> 11));
-#endif
 	}
 	return 0;
 }
diff --git a/drivers/video/matrox/matroxfb_DAC1064.c b/drivers/video/matrox/matroxfb_DAC1064.c
index f9fa0fd..1717623 100644
--- a/drivers/video/matrox/matroxfb_DAC1064.c
+++ b/drivers/video/matrox/matroxfb_DAC1064.c
@@ -869,12 +869,9 @@ static int MGAG100_preinit(struct matrox_fb_info *minfo)
 	minfo->capable.plnwt = minfo->devflags.accelerator = FB_ACCEL_MATROX_MGAG100
 			? minfo->devflags.sgram : 1;
 
-#ifdef CONFIG_FB_MATROX_G
 	if (minfo->devflags.g450dac) {
 		minfo->outputs[0].output = &g450out;
-	} else
-#endif
-	{
+	} else {
 		minfo->outputs[0].output = &m1064;
 	}
 	minfo->outputs[0].src = minfo->outputs[0].default_src;
-- 
1.6.6.1

