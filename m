From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 13 Nov 2017 18:25:51 +0000
Subject: [PATCH 4/4] ALSA: cs46xx: Adjust 35 checks for null pointers
Message-Id: <4b6b3b5d-40ef-e3c4-f0d3-00b638a4c171@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <893b1dc2-d078-9ea6-4ad2-0e0327affddd@users.sourceforge.net>
In-Reply-To: <893b1dc2-d078-9ea6-4ad2-0e0327affddd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Fabian Frederick <fabf@skynet.be>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 13 Nov 2017 19:03:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/pci/cs46xx/cs46xx_lib.c       | 21 +++++++++++----------
 sound/pci/cs46xx/dsp_spos.c         | 31 +++++++++++++++----------------
 sound/pci/cs46xx/dsp_spos_scb_lib.c | 27 +++++++++++----------------
 3 files changed, 37 insertions(+), 42 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 27b568f350f6..ddbd33dca4bc 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -1057,10 +1057,10 @@ static int _cs46xx_adjust_sample_rate (struct snd_cs46xx *chip, struct snd_cs46x
 {
 
 	/* If PCMReaderSCB and SrcTaskSCB not created yet ... */
-	if ( cpcm->pcm_channel = NULL) {
+	if (!cpcm->pcm_channel) {
 		cpcm->pcm_channel = cs46xx_dsp_create_pcm_channel (chip, sample_rate, 
 								   cpcm, cpcm->hw_buf.addr,cpcm->pcm_channel_id);
-		if (cpcm->pcm_channel = NULL) {
+		if (!cpcm->pcm_channel) {
 			dev_err(chip->card->dev,
 				"failed to create virtual PCM channel\n");
 			return -ENOMEM;
@@ -1514,7 +1514,7 @@ static int _cs46xx_playback_open_channel (struct snd_pcm_substream *substream,in
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	cpcm = kzalloc(sizeof(*cpcm), GFP_KERNEL);
-	if (cpcm = NULL)
+	if (!cpcm)
 		return -ENOMEM;
 	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(chip->pci),
 				PAGE_SIZE, &cpcm->hw_buf) < 0) {
@@ -2063,7 +2063,7 @@ static int snd_cs46xx_adc_capture_get(struct snd_kcontrol *kcontrol,
 	struct snd_cs46xx *chip = snd_kcontrol_chip(kcontrol);
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 
-	if (ins->adc_input != NULL) 
+	if (ins->adc_input)
 		ucontrol->value.integer.value[0] = 1;
 	else 
 		ucontrol->value.integer.value[0] = 0;
@@ -2094,7 +2094,7 @@ static int snd_cs46xx_pcm_capture_get(struct snd_kcontrol *kcontrol,
 	struct snd_cs46xx *chip = snd_kcontrol_chip(kcontrol);
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 
-	if (ins->pcm_input != NULL) 
+	if (ins->pcm_input)
 		ucontrol->value.integer.value[0] = 1;
 	else 
 		ucontrol->value.integer.value[0] = 0;
@@ -3643,7 +3643,7 @@ static void clkrun_init(struct snd_cs46xx *chip)
 	
 	pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
 		PCI_DEVICE_ID_INTEL_82371AB_3, NULL);
-	if (pdev = NULL)
+	if (!pdev)
 		return;		/* Not a thinkpad thats for sure */
 
 	/* Find the control port */		
@@ -3919,7 +3919,7 @@ int snd_cs46xx_create(struct snd_card *card,
 		return err;
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip = NULL) {
+	if (!chip) {
 		pci_disable_device(pci);
 		return -ENOMEM;
 	}
@@ -3997,9 +3997,10 @@ int snd_cs46xx_create(struct snd_card *card,
 		clkrun_init(chip);
 	}
 	
-	if (chip->amplifier_ctrl = NULL)
+	if (!chip->amplifier_ctrl)
 		chip->amplifier_ctrl = amp_none;
-	if (chip->active_ctrl = NULL)
+
+	if (!chip->active_ctrl)
 		chip->active_ctrl = amp_none;
 
 	chip->active_ctrl(chip, 1); /* enable CLKRUN */
@@ -4019,7 +4020,7 @@ int snd_cs46xx_create(struct snd_card *card,
 			goto free_sound_chip;
 		}
 		region->remap_addr = ioremap_nocache(region->base, region->size);
-		if (region->remap_addr = NULL) {
+		if (!region->remap_addr) {
 			dev_err(chip->card->dev,
 				"%s ioremap problem\n", region->name);
 			goto e_nomem;
diff --git a/sound/pci/cs46xx/dsp_spos.c b/sound/pci/cs46xx/dsp_spos.c
index c30bb557468c..63a212f3bc58 100644
--- a/sound/pci/cs46xx/dsp_spos.c
+++ b/sound/pci/cs46xx/dsp_spos.c
@@ -236,7 +236,7 @@ struct dsp_spos_instance *cs46xx_dsp_spos_create (struct snd_cs46xx * chip)
 {
 	struct dsp_spos_instance * ins = kzalloc(sizeof(struct dsp_spos_instance), GFP_KERNEL);
 
-	if (ins = NULL)
+	if (!ins)
 		return NULL;
 
 	/* better to use vmalloc for this big table */
@@ -402,7 +402,7 @@ int cs46xx_dsp_load_module (struct snd_cs46xx * chip, struct dsp_module_desc * m
 		snd_cs46xx_clear_BA1(chip, DSP_CODE_BYTE_OFFSET, DSP_CODE_BYTE_SIZE);
 	}
 
-	if (code = NULL) {
+	if (!code) {
 		dev_dbg(chip->card->dev,
 			"dsp_spos: module got no code segment\n");
 	} else {
@@ -514,10 +514,8 @@ static void cs46xx_dsp_proc_symbol_table_read (struct snd_info_entry *entry,
 		if (ins->symbol_table.symbols[i].deleted)
 			continue;
 
-		if (ins->symbol_table.symbols[i].module != NULL) {
+		if (ins->symbol_table.symbols[i].module)
 			module_str = ins->symbol_table.symbols[i].module->module_name;
-		}
-
     
 		snd_iprintf(buffer, "%04X <%02X> %s [%s]\n",
 			    ins->symbol_table.symbols[i].address,
@@ -593,11 +591,12 @@ static void cs46xx_dsp_proc_scb_read (struct snd_info_entry *entry,
 			continue;
 		snd_iprintf(buffer,"\n%04x %s:\n\n",ins->scbs[i].address,ins->scbs[i].scb_name);
 
-		if (ins->scbs[i].parent_scb_ptr != NULL) {
+		if (ins->scbs[i].parent_scb_ptr)
 			snd_iprintf(buffer,"parent [%s:%04x] ", 
 				    ins->scbs[i].parent_scb_ptr->scb_name,
 				    ins->scbs[i].parent_scb_ptr->address);
-		} else snd_iprintf(buffer,"parent [none] ");
+		else
+			snd_iprintf(buffer, "parent [none] ");
 
 		snd_iprintf(buffer,"sub_list_ptr [%s:%04x]\nnext_scb_ptr [%s:%04x]  task_entry [%s:%04x]\n",
 			    ins->scbs[i].sub_list_ptr->scb_name,
@@ -1141,35 +1140,35 @@ int cs46xx_dsp_scb_and_task_init (struct snd_cs46xx *chip)
 	cs46xx_dsp_create_task_tree(chip, "sposCB", (u32 *)&sposcb, SPOSCB_ADDR, 0x10);
 
 	null_algorithm  = cs46xx_dsp_lookup_symbol(chip, "NULLALGORITHM", SYMBOL_CODE);
-	if (null_algorithm = NULL) {
+	if (!null_algorithm) {
 		dev_err(chip->card->dev,
 			"dsp_spos: symbol NULLALGORITHM not found\n");
 		return -EIO;
 	}
 
 	fg_task_tree_header_code = cs46xx_dsp_lookup_symbol(chip, "FGTASKTREEHEADERCODE", SYMBOL_CODE);  
-	if (fg_task_tree_header_code = NULL) {
+	if (!fg_task_tree_header_code) {
 		dev_err(chip->card->dev,
 			"dsp_spos: symbol FGTASKTREEHEADERCODE not found\n");
 		return -EIO;
 	}
 
 	task_tree_header_code = cs46xx_dsp_lookup_symbol(chip, "TASKTREEHEADERCODE", SYMBOL_CODE);  
-	if (task_tree_header_code = NULL) {
+	if (!task_tree_header_code) {
 		dev_err(chip->card->dev,
 			"dsp_spos: symbol TASKTREEHEADERCODE not found\n");
 		return -EIO;
 	}
   
 	task_tree_thread = cs46xx_dsp_lookup_symbol(chip, "TASKTREETHREAD", SYMBOL_CODE);
-	if (task_tree_thread = NULL) {
+	if (!task_tree_thread) {
 		dev_err(chip->card->dev,
 			"dsp_spos: symbol TASKTREETHREAD not found\n");
 		return -EIO;
 	}
 
 	magic_snoop_task = cs46xx_dsp_lookup_symbol(chip, "MAGICSNOOPTASK", SYMBOL_CODE);
-	if (magic_snoop_task = NULL) {
+	if (!magic_snoop_task) {
 		dev_err(chip->card->dev,
 			"dsp_spos: symbol MAGICSNOOPTASK not found\n");
 		return -EIO;
@@ -1532,20 +1531,20 @@ static int cs46xx_dsp_async_init (struct snd_cs46xx *chip,
 	struct dsp_scb_descriptor * spdifi_scb_desc, * spdifo_scb_desc, * async_codec_scb_desc;
 
 	s16_async_codec_input_task = cs46xx_dsp_lookup_symbol(chip, "S16_ASYNCCODECINPUTTASK", SYMBOL_CODE);
-	if (s16_async_codec_input_task = NULL) {
+	if (!s16_async_codec_input_task) {
 		dev_err(chip->card->dev,
 			"dsp_spos: symbol S16_ASYNCCODECINPUTTASK not found\n");
 		return -EIO;
 	}
 	spdifo_task = cs46xx_dsp_lookup_symbol(chip, "SPDIFOTASK", SYMBOL_CODE);
-	if (spdifo_task = NULL) {
+	if (!spdifo_task) {
 		dev_err(chip->card->dev,
 			"dsp_spos: symbol SPDIFOTASK not found\n");
 		return -EIO;
 	}
 
 	spdifi_task = cs46xx_dsp_lookup_symbol(chip, "SPDIFITASK", SYMBOL_CODE);
-	if (spdifi_task = NULL) {
+	if (!spdifi_task) {
 		dev_err(chip->card->dev,
 			"dsp_spos: symbol SPDIFITASK not found\n");
 		return -EIO;
@@ -1971,7 +1970,7 @@ int cs46xx_dsp_set_iec958_volume (struct snd_cs46xx * chip, u16 left, u16 right)
 
 	mutex_lock(&chip->spos_mutex);
 
-	if (ins->asynch_rx_scb != NULL)
+	if (ins->asynch_rx_scb)
 		cs46xx_dsp_scb_set_volume (chip,ins->asynch_rx_scb,
 					   left,right);
 
diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_spos_scb_lib.c
index bccd315e6c18..e42f402fbe4d 100644
--- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
+++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
@@ -93,7 +93,7 @@ static void cs46xx_dsp_proc_scb_info_read (struct snd_info_entry *entry,
   
 	snd_iprintf(buffer,"\n");
 
-	if (scb->parent_scb_ptr != NULL) {
+	if (scb->parent_scb_ptr) {
 		snd_iprintf(buffer,"parent [%s:%04x] ", 
 			    scb->parent_scb_ptr->scb_name,
 			    scb->parent_scb_ptr->address);
@@ -254,8 +254,7 @@ void cs46xx_dsp_proc_register_scb_desc (struct snd_cs46xx *chip,
 	struct proc_scb_info * scb_info;
 
 	/* register to proc */
-	if (ins->snd_card != NULL && ins->proc_dsp_dir != NULL &&
-	    scb->proc_info = NULL) {
+	if (ins->snd_card && ins->proc_dsp_dir && !scb->proc_info) {
 		entry = snd_info_create_card_entry(ins->snd_card,
 						   scb->scb_name,
 						   ins->proc_dsp_dir);
@@ -376,8 +375,7 @@ cs46xx_dsp_create_generic_scb (struct snd_cs46xx *chip, char * name, u32 * scb_d
 
 	task_entry = cs46xx_dsp_lookup_symbol (chip,task_entry_name,
 					       SYMBOL_CODE);
-  
-	if (task_entry = NULL) {
+	if (!task_entry) {
 		dev_err(chip->card->dev,
 			"dsp_spos: symbol %s not found\n", task_entry_name);
 		return NULL;
@@ -588,11 +586,10 @@ cs46xx_dsp_create_pcm_reader_scb(struct snd_cs46xx * chip, char * scb_name,
 		}
 	};
 
-	if (ins->null_algorithm = NULL) {
+	if (!ins->null_algorithm) {
 		ins->null_algorithm =  cs46xx_dsp_lookup_symbol (chip,"NULLALGORITHM",
 								 SYMBOL_CODE);
-    
-		if (ins->null_algorithm = NULL) {
+		if (!ins->null_algorithm) {
 			dev_err(chip->card->dev,
 				"dsp_spos: symbol NULLALGORITHM not found\n");
 			return NULL;
@@ -678,11 +675,10 @@ cs46xx_dsp_create_src_task_scb(struct snd_cs46xx * chip, char * scb_name,
 			}
 		};
 		
-		if (ins->s16_up = NULL) {
+		if (!ins->s16_up) {
 			ins->s16_up =  cs46xx_dsp_lookup_symbol (chip,"S16_UPSRC",
 								 SYMBOL_CODE);
-			
-			if (ins->s16_up = NULL) {
+			if (!ins->s16_up) {
 				dev_err(chip->card->dev,
 					"dsp_spos: symbol S16_UPSRC not found\n");
 				return NULL;
@@ -1292,9 +1288,8 @@ cs46xx_dsp_create_pcm_channel (struct snd_cs46xx * chip,
 	if (!sample_rate) sample_rate = 44100;
 
 	/* search for a already created SRC SCB with the same sample rate */
-	for (i = 0; i < DSP_MAX_PCM_CHANNELS && 
-		     (pcm_index = -1 || src_scb = NULL); ++i) {
-
+	for (i = 0; i < DSP_MAX_PCM_CHANNELS && (pcm_index = -1 || !src_scb);
+	     ++i) {
 		/* virtual channel reserved 
 		   for capture */
 		if (i = CS46XX_DSP_CAPTURE_CHANNEL) continue;
@@ -1317,7 +1312,7 @@ cs46xx_dsp_create_pcm_channel (struct snd_cs46xx * chip,
 		return NULL;
 	}
 
-	if (src_scb = NULL) {
+	if (!src_scb) {
 		if (ins->nsrc_scb >= DSP_MAX_SRC_NR) {
 			dev_err(chip->card->dev,
 				"dsp_spos: to many SRC instances\n!");
@@ -1784,7 +1779,7 @@ int cs46xx_iec958_post_close (struct snd_cs46xx *chip)
 	cs46xx_poke_via_dsp (chip,SP_SPDOUT_CSUV, ins->spdif_csuv_default);
 	
 	/* deallocate stuff */
-	if (ins->spdif_pcm_input_scb != NULL) {
+	if (ins->spdif_pcm_input_scb) {
 		cs46xx_dsp_remove_scb (chip,ins->spdif_pcm_input_scb);
 		ins->spdif_pcm_input_scb = NULL;
 	}
-- 
2.15.0

