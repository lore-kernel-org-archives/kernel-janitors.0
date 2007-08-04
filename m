From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Sat, 04 Aug 2007 21:14:22 +0000
Subject: [PATCH] emu10k1: remove redundant memset
Message-Id: <200708042314.24289.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

	This patch removes memset() from snd_emu10k1_fx8010_info() which apparently
isn't needed there. Upatched code uses:

memset(info, 0, sizeof(info));

where 'info' is a pointer and therefore only first 4 bytes of 'info' gets cleared on a 32bit
machine. Anyway looking at the code zeoring this memory region isn't needed at all because
the snd_emu10k1_fx8010_info() function initializes all the 'info' fields on its own.
So that's why this code works at all in its original form.

This patch removes this redundant code. Also snd_emu10k1_fx8010_info() can't fail so lets save
some bytes and change its return type to void.

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 sound/pci/emu10k1/emufx.c | 101344 -> 101249 (-95 bytes)
 sound/pci/emu10k1/emufx.o | 202652 -> 202552 (-100 bytes)

 sound/pci/emu10k1/emufx.c |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

--- linux-2.6.23-rc1-mm2-a/sound/pci/emu10k1/emufx.c	2007-08-01 08:43:44.000000000 +0200
+++ linux-2.6.23-rc1-mm2-b/sound/pci/emu10k1/emufx.c	2007-08-04 22:42:20.000000000 +0200
@@ -2440,14 +2440,13 @@ static void copy_string(char *dst, char
 		strcpy(dst, src);
 }

-static int snd_emu10k1_fx8010_info(struct snd_emu10k1 *emu,
+static void snd_emu10k1_fx8010_info(struct snd_emu10k1 *emu,
 				   struct snd_emu10k1_fx8010_info *info)
 {
 	char **fxbus, **extin, **extout;
 	unsigned short fxbus_mask, extin_mask, extout_mask;
 	int res;

-	memset(info, 0, sizeof(info));
 	info->internal_tram_size = emu->fx8010.itram_size;
 	info->external_tram_size = emu->fx8010.etram_pages.bytes / 2;
 	fxbus = fxbuses;
@@ -2464,7 +2463,6 @@ static int snd_emu10k1_fx8010_info(struc
 	for (res = 16; res < 32; res++, extout++)
 		copy_string(info->extout_names[res], extout_mask & (1 << res) ? *extout : NULL, "Unused", res);
 	info->gpr_controls = emu->fx8010.gpr_count;
-	return 0;
 }

 static int snd_emu10k1_fx8010_ioctl(struct snd_hwdep * hw, struct file *file, unsigned int cmd, unsigned long arg)
@@ -2485,10 +2483,7 @@ static int snd_emu10k1_fx8010_ioctl(stru
 		info = kmalloc(sizeof(*info), GFP_KERNEL);
 		if (!info)
 			return -ENOMEM;
-		if ((res = snd_emu10k1_fx8010_info(emu, info)) < 0) {
-			kfree(info);
-			return res;
-		}
+		snd_emu10k1_fx8010_info(emu, info);
 		if (copy_to_user(argp, info, sizeof(*info))) {
 			kfree(info);
 			return -EFAULT;
