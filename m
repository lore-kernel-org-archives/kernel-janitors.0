From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Feb 2013 19:05:24 +0000
Subject: [patch] ALSA: hda/ca0132 - fix error handling for dsp_chip_to_dsp_addx()
Message-Id: <20130211190524.GC19768@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Ian Minett <ian_minett@creativelabs.com>

The error handling here won't work on 64 bit systems.
INVALID_CHIP_ADDRESS is an unsigned long defined like this:

#define INVALID_CHIP_ADDRESS        (~0UL)

But we truncate the high bits away before returning and then we save it
in an unsigned 32bit and then we compare it against the unsigned long
version.

I've changed everything to unsigned long.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 639a282..42114e9 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1581,7 +1581,7 @@ static int dsp_reset(struct hda_codec *codec)
 /*
  * Convert chip address to DSP address
  */
-static unsigned int dsp_chip_to_dsp_addx(unsigned int chip_addx,
+static unsigned long dsp_chip_to_dsp_addx(unsigned int chip_addx,
 					bool *code, bool *yram)
 {
 	*code = *yram = false;
@@ -1596,7 +1596,7 @@ static unsigned int dsp_chip_to_dsp_addx(unsigned int chip_addx,
 		return Y_OFF(chip_addx);
 	}
 
-	return (unsigned int)INVALID_CHIP_ADDRESS;
+	return INVALID_CHIP_ADDRESS;
 }
 
 /*
@@ -1620,7 +1620,7 @@ static int dsp_dma_setup_common(struct hda_codec *codec,
 {
 	int status = 0;
 	unsigned int chnl_prop;
-	unsigned int dsp_addx;
+	unsigned long dsp_addx;
 	unsigned int active;
 	bool code, yram;
 
@@ -1712,7 +1712,7 @@ static int dsp_dma_setup_common(struct hda_codec *codec,
 	snd_printdd(KERN_INFO "   dsp_dma_setup_common()    Write IRQCNT");
 
 	snd_printdd(
-		   "ChipA=0x%x,DspA=0x%x,dmaCh=%u, "
+		   "ChipA=0x%x,DspA=0x%lx,dmaCh=%u, "
 		   "CHSEL=0x%x,CHPROP=0x%x,Active=0x%x\n",
 		   chip_addx, dsp_addx, dma_chan,
 		   port_map_mask, chnl_prop, active);
@@ -1732,7 +1732,7 @@ static int dsp_dma_setup(struct hda_codec *codec,
 {
 	int status = 0;
 	bool code, yram;
-	unsigned int dsp_addx;
+	unsigned long dsp_addx;
 	unsigned int addr_field;
 	unsigned int incr_field;
 	unsigned int base_cnt;
