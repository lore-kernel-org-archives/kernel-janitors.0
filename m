From: Gabriel Devenyi <ace@staticwave.ca>
Date: Fri, 12 Aug 2005 04:06:05 +0000
Subject: [KJ] Kernel-Janitor sound/ make buildcheck fixes
Message-Id: <200508120006.07281.ace@staticwave.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80843002094577376=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============80843002094577376==
Content-Type: text/plain;
  charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

From my understanding of the output of make buildcheck, I've used make allyesconfig,
and saved all the resulting errors, this is my first attempt at some fixes, this patch
removes all the buildcheck errors in sound/ except for sound/oss/gus_wave.c as I am unsure
of how to fix it yet.

This patch applies to Linus' git branch 7d69fa6266770eeb6317eddd46b64456e8a515bf

-- 
Gabriel Devenyi
ace@staticwave.ca

diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -951,7 +951,7 @@ static struct amba_driver aaci_driver = 
 	.id_table	= aaci_ids,
 };
 
-static int __init aaci_init(void)
+static int __devinit aaci_init(void)
 {
 	return amba_driver_register(&aaci_driver);
 }
diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -392,7 +392,7 @@ static struct device_driver pxa2xx_ac97_
 	.resume		= pxa2xx_ac97_resume,
 };
 
-static int __init pxa2xx_ac97_init(void)
+static int __devinit pxa2xx_ac97_init(void)
 {
 	return driver_register(&pxa2xx_ac97_driver);
 }
diff --git a/sound/arm/sa11xx-uda1341.c b/sound/arm/sa11xx-uda1341.c
--- a/sound/arm/sa11xx-uda1341.c
+++ b/sound/arm/sa11xx-uda1341.c
@@ -822,7 +822,7 @@ static snd_pcm_ops_t snd_card_sa11xx_uda
 	.pointer		= snd_sa11xx_uda1341_pointer,
 };
 
-static int __init snd_card_sa11xx_uda1341_pcm(sa11xx_uda1341_t *sa11xx_uda1341, int device)
+static int __devinit snd_card_sa11xx_uda1341_pcm(sa11xx_uda1341_t *sa11xx_uda1341, int device)
 {
 	snd_pcm_t *pcm;
 	int err;
@@ -905,7 +905,7 @@ void snd_sa11xx_uda1341_free(snd_card_t 
 	kfree(chip);
 }
 
-static int __init sa11xx_uda1341_init(void)
+static int __devinit sa11xx_uda1341_init(void)
 {
 	int err;
 	snd_card_t *card;
diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -489,7 +489,7 @@ static void snd_hwdep_proc_read(snd_info
 
 static snd_info_entry_t *snd_hwdep_proc_entry = NULL;
 
-static int __init alsa_hwdep_init(void)
+static int __devinit alsa_hwdep_init(void)
 {
 	snd_info_entry_t *entry;
 
diff --git a/sound/core/info.c b/sound/core/info.c
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -531,7 +531,7 @@ static struct proc_dir_entry *snd_create
 	return p;
 }
 
-int __init snd_info_init(void)
+int __devinit snd_info_init(void)
 {
 	struct proc_dir_entry *p;
 
@@ -964,7 +964,7 @@ static void snd_info_version_read(snd_in
 		   );
 }
 
-static int __init snd_info_version_init(void)
+static int __devinit snd_info_version_init(void)
 {
 	snd_info_entry_t *entry;
 
diff --git a/sound/core/init.c b/sound/core/init.c
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -521,7 +521,7 @@ static void snd_card_module_info_read(sn
 }
 #endif
 
-int __init snd_card_info_init(void)
+int __devinit snd_card_info_init(void)
 {
 	snd_info_entry_t *entry;
 
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -639,7 +639,7 @@ static int snd_mem_proc_write(struct fil
  * module entry
  */
 
-static int __init snd_mem_init(void)
+static int __devinit snd_mem_init(void)
 {
 #ifdef CONFIG_PROC_FS
 	snd_mem_proc = create_proc_entry(SND_MEM_PROC_FILE, 0644, NULL);
diff --git a/sound/core/memory.c b/sound/core/memory.c
--- a/sound/core/memory.c
+++ b/sound/core/memory.c
@@ -204,7 +204,7 @@ static void snd_memory_info_read(snd_inf
 	snd_iprintf(buffer, "vmalloc: %li bytes\n", snd_alloc_vmalloc);
 }
 
-int __init snd_memory_info_init(void)
+int __devinit snd_memory_info_init(void)
 {
 	snd_info_entry_t *entry;
 
diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -1312,7 +1312,7 @@ static int snd_mixer_oss_notify_handler(
 	return 0;
 }
 
-static int __init alsa_mixer_oss_init(void)
+static int __devinit alsa_mixer_oss_init(void)
 {
 	int idx;
 	
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2514,7 +2514,7 @@ static snd_pcm_notify_t snd_pcm_oss_noti
 	.n_unregister =	snd_pcm_oss_unregister_minor,
 };
 
-static int __init alsa_pcm_oss_init(void)
+static int __devinit alsa_pcm_oss_init(void)
 {
 	int i;
 	int err;
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -1010,7 +1010,7 @@ static void snd_pcm_proc_read(snd_info_e
 
 static snd_info_entry_t *snd_pcm_proc_entry = NULL;
 
-static int __init alsa_pcm_init(void)
+static int __devinit alsa_pcm_init(void)
 {
 	snd_info_entry_t *entry;
 
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1628,7 +1628,7 @@ void snd_rawmidi_set_ops(snd_rawmidi_t *
  *  ENTRY functions
  */
 
-static int __init alsa_rawmidi_init(void)
+static int __devinit alsa_rawmidi_init(void)
 {
 
 	snd_ctl_register_ioctl(snd_rawmidi_control_ioctl);
diff --git a/sound/core/rtctimer.c b/sound/core/rtctimer.c
--- a/sound/core/rtctimer.c
+++ b/sound/core/rtctimer.c
@@ -124,7 +124,7 @@ static void rtctimer_interrupt(void *pri
 /*
  *  ENTRY functions
  */
-static int __init rtctimer_init(void)
+static int __devinit rtctimer_init(void)
 {
 	int order, err;
 	snd_timer_t *timer;
diff --git a/sound/core/seq/instr/ainstr_fm.c b/sound/core/seq/instr/ainstr_fm.c
--- a/sound/core/seq/instr/ainstr_fm.c
+++ b/sound/core/seq/instr/ainstr_fm.c
@@ -141,7 +141,7 @@ int snd_seq_fm_init(snd_seq_kinstr_ops_t
  *  Init part
  */
 
-static int __init alsa_ainstr_fm_init(void)
+static int __devinit alsa_ainstr_fm_init(void)
 {
 	return 0;
 }
diff --git a/sound/core/seq/instr/ainstr_gf1.c b/sound/core/seq/instr/ainstr_gf1.c
--- a/sound/core/seq/instr/ainstr_gf1.c
+++ b/sound/core/seq/instr/ainstr_gf1.c
@@ -344,7 +344,7 @@ int snd_seq_gf1_init(snd_gf1_ops_t *ops,
  *  Init part
  */
 
-static int __init alsa_ainstr_gf1_init(void)
+static int __devinit alsa_ainstr_gf1_init(void)
 {
 	return 0;
 }
diff --git a/sound/core/seq/instr/ainstr_iw.c b/sound/core/seq/instr/ainstr_iw.c
--- a/sound/core/seq/instr/ainstr_iw.c
+++ b/sound/core/seq/instr/ainstr_iw.c
@@ -609,7 +609,7 @@ int snd_seq_iwffff_init(snd_iwffff_ops_t
  *  Init part
  */
 
-static int __init alsa_ainstr_iw_init(void)
+static int __devinit alsa_ainstr_iw_init(void)
 {
 	return 0;
 }
diff --git a/sound/core/seq/instr/ainstr_simple.c b/sound/core/seq/instr/ainstr_simple.c
--- a/sound/core/seq/instr/ainstr_simple.c
+++ b/sound/core/seq/instr/ainstr_simple.c
@@ -200,7 +200,7 @@ int snd_seq_simple_init(snd_simple_ops_t
  *  Init part
  */
 
-static int __init alsa_ainstr_simple_init(void)
+static int __devinit alsa_ainstr_simple_init(void)
 {
 	return 0;
 }
diff --git a/sound/core/seq/oss/seq_oss.c b/sound/core/seq/oss/seq_oss.c
--- a/sound/core/seq/oss/seq_oss.c
+++ b/sound/core/seq/oss/seq_oss.c
@@ -70,7 +70,7 @@ static void info_read(snd_info_entry_t *
  * module interface
  */
 
-static int __init alsa_seq_oss_init(void)
+static int __devinit alsa_seq_oss_init(void)
 {
 	int rc;
 	static snd_seq_dev_ops_t ops = {
@@ -222,7 +222,7 @@ static snd_minor_t seq_oss_reg = {
 	.f_ops =	&seq_oss_f_ops,
 };
 
-static int __init
+static int __devinit
 register_device(void)
 {
 	int rc;
@@ -283,7 +283,7 @@ info_read(snd_info_entry_t *entry, snd_i
 
 #endif /* CONFIG_PROC_FS */
 
-static int __init
+static int __devinit
 register_proc(void)
 {
 #ifdef CONFIG_PROC_FS
diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -61,7 +61,7 @@ static void free_devinfo(void *private);
 /*
  * create sequencer client for OSS sequencer
  */
-int __init
+int __devinit
 snd_seq_oss_create_client(void)
 {
 	int rc;
diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -70,7 +70,7 @@ static int send_midi_event(seq_oss_devin
  * look up the existing ports
  * this looks a very exhausting job.
  */
-int __init
+int __devinit
 snd_seq_oss_midi_lookup_ports(int client)
 {
 	snd_seq_client_info_t *clinfo;
diff --git a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
--- a/sound/core/seq/oss/seq_oss_synth.c
+++ b/sound/core/seq/oss/seq_oss_synth.c
@@ -86,7 +86,7 @@ static void reset_channels(seq_oss_synth
 /*
  * global initialization
  */
-void __init
+void __devinit
 snd_seq_oss_synth_init(void)
 {
 	snd_use_lock_init(&midi_synth_dev.use_lock);
diff --git a/sound/core/seq/seq.c b/sound/core/seq/seq.c
--- a/sound/core/seq/seq.c
+++ b/sound/core/seq/seq.c
@@ -70,7 +70,7 @@ MODULE_PARM_DESC(seq_default_timer_resol
  *  INIT PART
  */
 
-static int __init alsa_seq_init(void)
+static int __devinit alsa_seq_init(void)
 {
 	int err;
 
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -187,7 +187,7 @@ static void usage_free(usage_t * res, in
 }
 
 /* initialise data structures */
-int __init client_init_data(void)
+int __devinit client_init_data(void)
 {
 	/* zap out the client table */
 	memset(&clienttablock, 0, sizeof(clienttablock));
@@ -2475,7 +2475,7 @@ static snd_minor_t snd_seq_reg =
 /* 
  * register sequencer device 
  */
-int __init snd_sequencer_device_init(void)
+int __devinit snd_sequencer_device_init(void)
 {
 	int err;
 
diff --git a/sound/core/seq/seq_device.c b/sound/core/seq/seq_device.c
--- a/sound/core/seq/seq_device.c
+++ b/sound/core/seq/seq_device.c
@@ -539,7 +539,7 @@ static void unlock_driver(ops_list_t *op
  * module part
  */
 
-static int __init alsa_seq_device_init(void)
+static int __devinit alsa_seq_device_init(void)
 {
 	info_entry = snd_info_create_module_entry(THIS_MODULE, "drivers", snd_seq_root);
 	if (info_entry == NULL)
diff --git a/sound/core/seq/seq_dummy.c b/sound/core/seq/seq_dummy.c
--- a/sound/core/seq/seq_dummy.c
+++ b/sound/core/seq/seq_dummy.c
@@ -146,7 +146,7 @@ dummy_free(void *private_data)
 /*
  * create a port
  */
-static snd_seq_dummy_port_t __init *
+static snd_seq_dummy_port_t __devinit *
 create_port(int idx, int type)
 {
 	snd_seq_port_info_t pinfo;
@@ -189,7 +189,7 @@ create_port(int idx, int type)
 /*
  * register client and create ports
  */
-static int __init
+static int __devinit
 register_client(void)
 {
 	snd_seq_client_callback_t cb;
@@ -252,7 +252,7 @@ delete_client(void)
  *  Init part
  */
 
-static int __init alsa_seq_dummy_init(void)
+static int __devinit alsa_seq_dummy_init(void)
 {
 	int err;
 	snd_seq_autoload_lock();
diff --git a/sound/core/seq/seq_info.c b/sound/core/seq/seq_info.c
--- a/sound/core/seq/seq_info.c
+++ b/sound/core/seq/seq_info.c
@@ -33,7 +33,7 @@ static snd_info_entry_t *clients_entry;
 static snd_info_entry_t *timer_entry;
 
 
-static snd_info_entry_t * __init
+static snd_info_entry_t * __devinit
 create_info_entry(char *name, int size, void (*read)(snd_info_entry_t *, snd_info_buffer_t *))
 {
 	snd_info_entry_t *entry;
@@ -53,7 +53,7 @@ create_info_entry(char *name, int size, 
 
 
 /* create all our /proc entries */
-int __init snd_seq_info_init(void)
+int __devinit snd_seq_info_init(void)
 {
 	queues_entry = create_info_entry("queues", 512 + (256 * SNDRV_SEQ_MAX_QUEUES),
 					 snd_seq_info_queues_read);
diff --git a/sound/core/seq/seq_instr.c b/sound/core/seq/seq_instr.c
--- a/sound/core/seq/seq_instr.c
+++ b/sound/core/seq/seq_instr.c
@@ -633,7 +633,7 @@ int snd_seq_instr_event(snd_seq_kinstr_o
  *  Init part
  */
 
-static int __init alsa_seq_instr_init(void)
+static int __devinit alsa_seq_instr_init(void)
 {
 	return 0;
 }
diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -486,7 +486,7 @@ int snd_seq_pool_delete(pool_t **ppool)
 }
 
 /* initialize sequencer memory */
-int __init snd_sequencer_memory_init(void)
+int __devinit snd_sequencer_memory_init(void)
 {
 	return 0;
 }
diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -465,7 +465,7 @@ snd_seq_midisynth_unregister_port(snd_se
 }
 
 
-static int __init alsa_seq_midi_init(void)
+static int __devinit alsa_seq_midi_init(void)
 {
 	static snd_seq_dev_ops_t ops = {
 		snd_seq_midisynth_register_port,
diff --git a/sound/core/seq/seq_midi_emul.c b/sound/core/seq/seq_midi_emul.c
--- a/sound/core/seq/seq_midi_emul.c
+++ b/sound/core/seq/seq_midi_emul.c
@@ -717,7 +717,7 @@ void snd_midi_channel_free_set(snd_midi_
 	kfree(chset);
 }
 
-static int __init alsa_seq_midi_emul_init(void)
+static int __devinit alsa_seq_midi_emul_init(void)
 {
 	return 0;
 }
diff --git a/sound/core/seq/seq_midi_event.c b/sound/core/seq/seq_midi_event.c
--- a/sound/core/seq/seq_midi_event.c
+++ b/sound/core/seq/seq_midi_event.c
@@ -528,7 +528,7 @@ EXPORT_SYMBOL(snd_midi_event_encode);
 EXPORT_SYMBOL(snd_midi_event_encode_byte);
 EXPORT_SYMBOL(snd_midi_event_decode);
 
-static int __init alsa_seq_midi_event_init(void)
+static int __devinit alsa_seq_midi_event_init(void)
 {
 	return 0;
 }
diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -161,7 +161,7 @@ static void queue_delete(queue_t *q)
 /*----------------------------------------------------------------*/
 
 /* setup queues */
-int __init snd_seq_queues_init(void)
+int __devinit snd_seq_queues_init(void)
 {
 	/*
 	memset(queue_list, 0, sizeof(queue_list));
diff --git a/sound/core/seq/seq_system.c b/sound/core/seq/seq_system.c
--- a/sound/core/seq/seq_system.c
+++ b/sound/core/seq/seq_system.c
@@ -118,7 +118,7 @@ static int event_input_timer(snd_seq_eve
 }
 
 /* register our internal client */
-int __init snd_seq_system_client_init(void)
+int __devinit snd_seq_system_client_init(void)
 {
 
 	snd_seq_client_callback_t callbacks;
diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
--- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -536,7 +536,7 @@ int snd_virmidi_new(snd_card_t *card, in
  *  ENTRY functions
  */
 
-static int __init alsa_virmidi_init(void)
+static int __devinit alsa_virmidi_init(void)
 {
 	return 0;
 }
diff --git a/sound/core/sound.c b/sound/core/sound.c
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -300,7 +300,7 @@ static void snd_minor_info_read(snd_info
 	up(&sound_mutex);
 }
 
-int __init snd_minor_info_init(void)
+int __devinit snd_minor_info_init(void)
 {
 	snd_info_entry_t *entry;
 
@@ -328,7 +328,7 @@ int __exit snd_minor_info_done(void)
  *  INIT PART
  */
 
-static int __init alsa_sound_init(void)
+static int __devinit alsa_sound_init(void)
 {
 	short controlnum;
 	int err;
diff --git a/sound/core/sound_oss.c b/sound/core/sound_oss.c
--- a/sound/core/sound_oss.c
+++ b/sound/core/sound_oss.c
@@ -210,7 +210,7 @@ static void snd_minor_info_oss_read(snd_
 
 #endif /* CONFIG_PROC_FS */
 
-int __init snd_minor_info_oss_init(void)
+int __devinit snd_minor_info_oss_init(void)
 {
 #ifdef CONFIG_PROC_FS
 	snd_info_entry_t *entry;
@@ -238,7 +238,7 @@ int __exit snd_minor_info_oss_done(void)
 	return 0;
 }
 
-int __init snd_oss_init_module(void)
+int __devinit snd_oss_init_module(void)
 {
 	int card;
 	
diff --git a/sound/core/timer.c b/sound/core/timer.c
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1869,7 +1869,7 @@ static snd_minor_t snd_timer_reg =
 
 static snd_info_entry_t *snd_timer_proc_entry = NULL;
 
-static int __init alsa_timer_init(void)
+static int __devinit alsa_timer_init(void)
 {
 	int err;
 	snd_info_entry_t *entry;
diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -425,7 +425,7 @@ static snd_pcm_ops_t snd_card_dummy_capt
 	.pointer =		snd_card_dummy_capture_pointer,
 };
 
-static int __init snd_card_dummy_pcm(snd_card_dummy_t *dummy, int device, int substreams)
+static int __devinit snd_card_dummy_pcm(snd_card_dummy_t *dummy, int device, int substreams)
 {
 	snd_pcm_t *pcm;
 	int err;
@@ -556,7 +556,7 @@ DUMMY_VOLUME("CD Volume", 0, MIXER_ADDR_
 DUMMY_CAPSRC("CD Capture Switch", 0, MIXER_ADDR_MASTER)
 };
 
-static int __init snd_card_dummy_new_mixer(snd_card_dummy_t * dummy)
+static int __devinit snd_card_dummy_new_mixer(snd_card_dummy_t * dummy)
 {
 	snd_card_t *card = dummy->card;
 	unsigned int idx;
@@ -573,7 +573,7 @@ static int __init snd_card_dummy_new_mix
 	return 0;
 }
 
-static int __init snd_card_dummy_probe(int dev)
+static int __devinit snd_card_dummy_probe(int dev)
 {
 	snd_card_t *card;
 	struct snd_card_dummy *dummy;
@@ -609,7 +609,7 @@ static int __init snd_card_dummy_probe(i
 	return err;
 }
 
-static int __init alsa_card_dummy_init(void)
+static int __devinit alsa_card_dummy_init(void)
 {
 	int dev, cards;
 
diff --git a/sound/drivers/mpu401/mpu401.c b/sound/drivers/mpu401/mpu401.c
--- a/sound/drivers/mpu401/mpu401.c
+++ b/sound/drivers/mpu401/mpu401.c
@@ -117,7 +117,7 @@ static struct pnp_device_id snd_mpu401_p
 
 MODULE_DEVICE_TABLE(pnp, snd_mpu401_pnpids);
 
-static int __init snd_mpu401_pnp(int dev, struct pnp_dev *device,
+static int __devinit snd_mpu401_pnp(int dev, struct pnp_dev *device,
 				 const struct pnp_device_id *id)
 {
 	if (!pnp_port_valid(device, 0) ||
@@ -184,7 +184,7 @@ static struct pnp_driver snd_mpu401_pnp_
 static struct pnp_driver snd_mpu401_pnp_driver;
 #endif
 
-static int __init alsa_card_mpu401_init(void)
+static int __devinit alsa_card_mpu401_init(void)
 {
 	int dev, devices = 0;
 	int err;
diff --git a/sound/drivers/mpu401/mpu401_uart.c b/sound/drivers/mpu401/mpu401_uart.c
--- a/sound/drivers/mpu401/mpu401_uart.c
+++ b/sound/drivers/mpu401/mpu401_uart.c
@@ -528,7 +528,7 @@ EXPORT_SYMBOL(snd_mpu401_uart_new);
  *  INIT part
  */
 
-static int __init alsa_mpu401_uart_init(void)
+static int __devinit alsa_mpu401_uart_init(void)
 {
 	return 0;
 }
diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -727,7 +727,7 @@ static void free_mtpav(mtpav_t * crd)
 /*
  */
 
-static int __init alsa_card_mtpav_init(void)
+static int __devinit alsa_card_mtpav_init(void)
 {
 	int err = 0;
 	char longname_buffer[80];
diff --git a/sound/drivers/opl3/opl3_lib.c b/sound/drivers/opl3/opl3_lib.c
--- a/sound/drivers/opl3/opl3_lib.c
+++ b/sound/drivers/opl3/opl3_lib.c
@@ -545,7 +545,7 @@ EXPORT_SYMBOL(snd_opl3_reset);
  *  INIT part
  */
 
-static int __init alsa_opl3_init(void)
+static int __devinit alsa_opl3_init(void)
 {
 	return 0;
 }
diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -293,7 +293,7 @@ static int snd_opl3_seq_delete_device(sn
 	return 0;
 }
 
-static int __init alsa_opl3_seq_init(void)
+static int __devinit alsa_opl3_seq_init(void)
 {
 	static snd_seq_dev_ops_t ops =
 	{
diff --git a/sound/drivers/opl4/opl4_lib.c b/sound/drivers/opl4/opl4_lib.c
--- a/sound/drivers/opl4/opl4_lib.c
+++ b/sound/drivers/opl4/opl4_lib.c
@@ -268,7 +268,7 @@ EXPORT_SYMBOL(snd_opl4_write_memory);
 EXPORT_SYMBOL(snd_opl4_read_memory);
 EXPORT_SYMBOL(snd_opl4_create);
 
-static int __init alsa_opl4_init(void)
+static int __devinit alsa_opl4_init(void)
 {
 	return 0;
 }
diff --git a/sound/drivers/opl4/opl4_seq.c b/sound/drivers/opl4/opl4_seq.c
--- a/sound/drivers/opl4/opl4_seq.c
+++ b/sound/drivers/opl4/opl4_seq.c
@@ -203,7 +203,7 @@ static int snd_opl4_seq_delete_device(sn
 	return 0;
 }
 
-static int __init alsa_opl4_synth_init(void)
+static int __devinit alsa_opl4_synth_init(void)
 {
 	static snd_seq_dev_ops_t ops = {
 		snd_opl4_seq_new_device,
diff --git a/sound/drivers/serial-u16550.c b/sound/drivers/serial-u16550.c
--- a/sound/drivers/serial-u16550.c
+++ b/sound/drivers/serial-u16550.c
@@ -324,7 +324,7 @@ static void snd_uart16550_buffer_timer(u
  *  return 0 if found
  *  return negative error if not found
  */
-static int __init snd_uart16550_detect(snd_uart16550_t *uart)
+static int __devinit snd_uart16550_detect(snd_uart16550_t *uart)
 {
 	unsigned long io_base = uart->base;
 	int ok;
@@ -763,7 +763,7 @@ static int snd_uart16550_dev_free(snd_de
 	return snd_uart16550_free(uart);
 }
 
-static int __init snd_uart16550_create(snd_card_t * card,
+static int __devinit snd_uart16550_create(snd_card_t * card,
 				       unsigned long iobase,
 				       int irq,
 				       unsigned int speed,
@@ -841,7 +841,7 @@ static int __init snd_uart16550_create(s
 	return 0;
 }
 
-static void __init snd_uart16550_substreams(snd_rawmidi_str_t *stream)
+static void __devinit snd_uart16550_substreams(snd_rawmidi_str_t *stream)
 {
 	struct list_head *list;
 
@@ -851,7 +851,7 @@ static void __init snd_uart16550_substre
 	}
 }
 
-static int __init snd_uart16550_rmidi(snd_uart16550_t *uart, int device, int outs, int ins, snd_rawmidi_t **rmidi)
+static int __devinit snd_uart16550_rmidi(snd_uart16550_t *uart, int device, int outs, int ins, snd_rawmidi_t **rmidi)
 {
 	snd_rawmidi_t *rrawmidi;
 	int err;
@@ -872,7 +872,7 @@ static int __init snd_uart16550_rmidi(sn
 	return 0;
 }
 
-static int __init snd_serial_probe(int dev)
+static int __devinit snd_serial_probe(int dev)
 {
 	snd_card_t *card;
 	snd_uart16550_t *uart;
@@ -957,7 +957,7 @@ static int __init snd_serial_probe(int d
 	return 0;
 }
 
-static int __init alsa_card_serial_init(void)
+static int __devinit alsa_card_serial_init(void)
 {
 	int dev = 0;
 	int cards = 0;
diff --git a/sound/drivers/virmidi.c b/sound/drivers/virmidi.c
--- a/sound/drivers/virmidi.c
+++ b/sound/drivers/virmidi.c
@@ -83,7 +83,7 @@ typedef struct snd_card_virmidi {
 static snd_card_t *snd_virmidi_cards[SNDRV_CARDS] = SNDRV_DEFAULT_PTR;
 
 
-static int __init snd_card_virmidi_probe(int dev)
+static int __devinit snd_card_virmidi_probe(int dev)
 {
 	snd_card_t *card;
 	struct snd_card_virmidi *vmidi;
@@ -125,7 +125,7 @@ static int __init snd_card_virmidi_probe
 	return err;
 }
 
-static int __init alsa_card_virmidi_init(void)
+static int __devinit alsa_card_virmidi_init(void)
 {
 	int dev, cards;
 
diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
--- a/sound/drivers/vx/vx_core.c
+++ b/sound/drivers/vx/vx_core.c
@@ -811,7 +811,7 @@ vx_core_t *snd_vx_create(snd_card_t *car
 /*
  * module entries
  */
-static int __init alsa_vx_core_init(void)
+static int __devinit alsa_vx_core_init(void)
 {
 	return 0;
 }
diff --git a/sound/i2c/cs8427.c b/sound/i2c/cs8427.c
--- a/sound/i2c/cs8427.c
+++ b/sound/i2c/cs8427.c
@@ -552,7 +552,7 @@ int snd_cs8427_iec958_pcm(snd_i2c_device
 	return err < 0 ? err : 0;
 }
 
-static int __init alsa_cs8427_module_init(void)
+static int __devinit alsa_cs8427_module_init(void)
 {
 	return 0;
 }
diff --git a/sound/i2c/i2c.c b/sound/i2c/i2c.c
--- a/sound/i2c/i2c.c
+++ b/sound/i2c/i2c.c
@@ -320,7 +320,7 @@ EXPORT_SYMBOL(snd_i2c_sendbytes);
 EXPORT_SYMBOL(snd_i2c_readbytes);
 EXPORT_SYMBOL(snd_i2c_probeaddr);
 
-static int __init alsa_i2c_init(void)
+static int __devinit alsa_i2c_init(void)
 {
 	return 0;
 }
diff --git a/sound/i2c/l3/uda1341.c b/sound/i2c/l3/uda1341.c
--- a/sound/i2c/l3/uda1341.c
+++ b/sound/i2c/l3/uda1341.c
@@ -660,7 +660,7 @@ static int uda1341_dev_free(snd_device_t
 	return 0;
 }
 
-int __init snd_chip_uda1341_mixer_new(snd_card_t *card, struct l3_client **clnt)
+int __devinit snd_chip_uda1341_mixer_new(snd_card_t *card, struct l3_client **clnt)
 {
 	static snd_device_ops_t ops = {
 		.dev_free =     uda1341_dev_free,
@@ -801,7 +801,7 @@ static struct l3_driver uda1341_driver =
 	.owner =	THIS_MODULE,
 };
 
-static int __init uda1341_init(void)
+static int __devinit uda1341_init(void)
 {
 	return l3_add_driver(&uda1341_driver);
 }
diff --git a/sound/i2c/other/ak4xxx-adda.c b/sound/i2c/other/ak4xxx-adda.c
--- a/sound/i2c/other/ak4xxx-adda.c
+++ b/sound/i2c/other/ak4xxx-adda.c
@@ -483,7 +483,7 @@ int snd_akm4xxx_build_controls(akm4xxx_t
 	return err;
 }
 
-static int __init alsa_akm4xxx_module_init(void)
+static int __devinit alsa_akm4xxx_module_init(void)
 {
 	return 0;
 }
diff --git a/sound/i2c/other/tea575x-tuner.c b/sound/i2c/other/tea575x-tuner.c
--- a/sound/i2c/other/tea575x-tuner.c
+++ b/sound/i2c/other/tea575x-tuner.c
@@ -217,7 +217,7 @@ void snd_tea575x_exit(tea575x_t *tea)
 	}
 }
 
-static int __init alsa_tea575x_module_init(void)
+static int __devinit alsa_tea575x_module_init(void)
 {
 	return 0;
 }
diff --git a/sound/i2c/tea6330t.c b/sound/i2c/tea6330t.c
--- a/sound/i2c/tea6330t.c
+++ b/sound/i2c/tea6330t.c
@@ -355,7 +355,7 @@ EXPORT_SYMBOL(snd_tea6330t_update_mixer)
  *  INIT part
  */
 
-static int __init alsa_tea6330t_init(void)
+static int __devinit alsa_tea6330t_init(void)
 {
 	return 0;
 }
diff --git a/sound/isa/ad1816a/ad1816a.c b/sound/isa/ad1816a/ad1816a.c
--- a/sound/isa/ad1816a/ad1816a.c
+++ b/sound/isa/ad1816a/ad1816a.c
@@ -291,7 +291,7 @@ static struct pnp_card_driver ad1816a_pn
 	.remove		= __devexit_p(snd_ad1816a_pnp_remove),
 };
 
-static int __init alsa_card_ad1816a_init(void)
+static int __devinit alsa_card_ad1816a_init(void)
 {
 	int cards = 0;
 
diff --git a/sound/isa/ad1816a/ad1816a_lib.c b/sound/isa/ad1816a/ad1816a_lib.c
--- a/sound/isa/ad1816a/ad1816a_lib.c
+++ b/sound/isa/ad1816a/ad1816a_lib.c
@@ -961,7 +961,7 @@ EXPORT_SYMBOL(snd_ad1816a_create);
 EXPORT_SYMBOL(snd_ad1816a_pcm);
 EXPORT_SYMBOL(snd_ad1816a_mixer);
 
-static int __init alsa_ad1816a_init(void)
+static int __devinit alsa_ad1816a_init(void)
 {
 	return 0;
 }
diff --git a/sound/isa/ad1848/ad1848.c b/sound/isa/ad1848/ad1848.c
--- a/sound/isa/ad1848/ad1848.c
+++ b/sound/isa/ad1848/ad1848.c
@@ -63,7 +63,7 @@ MODULE_PARM_DESC(thinkpad, "Enable only 
 static snd_card_t *snd_ad1848_cards[SNDRV_CARDS] = SNDRV_DEFAULT_PTR;
 
 
-static int __init snd_card_ad1848_probe(int dev)
+static int __devinit snd_card_ad1848_probe(int dev)
 {
 	snd_card_t *card;
 	ad1848_t *chip;
@@ -122,7 +122,7 @@ static int __init snd_card_ad1848_probe(
 	return 0;
 }
 
-static int __init alsa_card_ad1848_init(void)
+static int __devinit alsa_card_ad1848_init(void)
 {
 	int dev, cards;
 
diff --git a/sound/isa/ad1848/ad1848_lib.c b/sound/isa/ad1848/ad1848_lib.c
--- a/sound/isa/ad1848/ad1848_lib.c
+++ b/sound/isa/ad1848/ad1848_lib.c
@@ -1266,7 +1266,7 @@ EXPORT_SYMBOL(snd_ad1848_add_ctl);
  *  INIT part
  */
 
-static int __init alsa_ad1848_init(void)
+static int __devinit alsa_ad1848_init(void)
 {
 	return 0;
 }
diff --git a/sound/isa/als100.c b/sound/isa/als100.c
--- a/sound/isa/als100.c
+++ b/sound/isa/als100.c
@@ -198,7 +198,7 @@ static int __devinit snd_card_als100_pnp
 	return 0;
 }
 
-static int __init snd_card_als100_probe(int dev,
+static int __devinit snd_card_als100_probe(int dev,
 					struct pnp_card_link *pcard,
 					const struct pnp_card_device_id *pid)
 {
@@ -313,7 +313,7 @@ static struct pnp_card_driver als100_pnp
         .remove         = __devexit_p(snd_als100_pnp_remove),
 };
 
-static int __init alsa_card_als100_init(void)
+static int __devinit alsa_card_als100_init(void)
 {
 	int cards = 0;
 
diff --git a/sound/isa/azt2320.c b/sound/isa/azt2320.c
--- a/sound/isa/azt2320.c
+++ b/sound/isa/azt2320.c
@@ -343,7 +343,7 @@ static struct pnp_card_driver azt2320_pn
 	.remove         = __devexit_p(snd_azt2320_pnp_remove),
 };
 
-static int __init alsa_card_azt2320_init(void)
+static int __devinit alsa_card_azt2320_init(void)
 {
 	int cards = 0;
 
diff --git a/sound/isa/cmi8330.c b/sound/isa/cmi8330.c
--- a/sound/isa/cmi8330.c
+++ b/sound/isa/cmi8330.c
@@ -170,7 +170,7 @@ MODULE_DEVICE_TABLE(pnp_card, snd_cmi833
 #endif
 
 
-static struct ad1848_mix_elem snd_cmi8330_controls[] __initdata = {
+static struct ad1848_mix_elem snd_cmi8330_controls[] __devinitdata = {
 AD1848_DOUBLE("Master Playback Volume", 0, CMI8330_MASTVOL, CMI8330_MASTVOL, 4, 0, 15, 0),
 AD1848_SINGLE("Loud Playback Switch", 0, CMI8330_MUTEMUX, 6, 1, 1),
 AD1848_DOUBLE("PCM Playback Switch", 0, AD1848_LEFT_OUTPUT, AD1848_RIGHT_OUTPUT, 7, 7, 1, 1),
@@ -199,7 +199,7 @@ AD1848_SINGLE("IEC958 Input Playback Swi
 };
 
 #ifdef ENABLE_SB_MIXER
-static struct sbmix_elem cmi8330_sb_mixers[] __initdata = {
+static struct sbmix_elem cmi8330_sb_mixers[] __devinitdata = {
 SB_DOUBLE("SB Master Playback Volume", SB_DSP4_MASTER_DEV, (SB_DSP4_MASTER_DEV + 1), 3, 3, 31),
 SB_DOUBLE("Tone Control - Bass", SB_DSP4_BASS_DEV, (SB_DSP4_BASS_DEV + 1), 4, 4, 15),
 SB_DOUBLE("Tone Control - Treble", SB_DSP4_TREBLE_DEV, (SB_DSP4_TREBLE_DEV + 1), 4, 4, 15),
@@ -217,7 +217,7 @@ SB_DOUBLE("SB Playback Volume", SB_DSP4_
 SB_SINGLE("SB Mic Auto Gain", SB_DSP4_MIC_AGC, 0, 1),
 };
 
-static unsigned char cmi8330_sb_init_values[][2] __initdata = {
+static unsigned char cmi8330_sb_init_values[][2] __devinitdata = {
 	{ SB_DSP4_MASTER_DEV + 0, 0 },
 	{ SB_DSP4_MASTER_DEV + 1, 0 },
 	{ SB_DSP4_PCM_DEV + 0, 0 },
@@ -587,7 +587,7 @@ static struct pnp_card_driver cmi8330_pn
 };
 #endif /* CONFIG_PNP */
 
-static int __init alsa_card_cmi8330_init(void)
+static int __devinit alsa_card_cmi8330_init(void)
 {
 	int dev, cards = 0;
 
diff --git a/sound/isa/cs423x/cs4231.c b/sound/isa/cs423x/cs4231.c
--- a/sound/isa/cs423x/cs4231.c
+++ b/sound/isa/cs423x/cs4231.c
@@ -67,7 +67,7 @@ MODULE_PARM_DESC(dma2, "DMA2 # for CS423
 static snd_card_t *snd_cs4231_cards[SNDRV_CARDS] = SNDRV_DEFAULT_PTR;
 
 
-static int __init snd_card_cs4231_probe(int dev)
+static int __devinit snd_card_cs4231_probe(int dev)
 {
 	snd_card_t *card;
 	struct snd_card_cs4231 *acard;
@@ -140,7 +140,7 @@ static int __init snd_card_cs4231_probe(
 	return 0;
 }
 
-static int __init alsa_card_cs4231_init(void)
+static int __devinit alsa_card_cs4231_init(void)
 {
 	int dev, cards;
 
diff --git a/sound/isa/cs423x/cs4231_lib.c b/sound/isa/cs423x/cs4231_lib.c
--- a/sound/isa/cs423x/cs4231_lib.c
+++ b/sound/isa/cs423x/cs4231_lib.c
@@ -1951,7 +1951,7 @@ EXPORT_SYMBOL(snd_cs4231_put_double);
  *  INIT part
  */
 
-static int __init alsa_cs4231_init(void)
+static int __devinit alsa_cs4231_init(void)
 {
 	return 0;
 }
diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
--- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -562,7 +562,7 @@ static struct pnp_card_driver cs423x_pnp
 };
 #endif /* CONFIG_PNP */
 
-static int __init alsa_card_cs423x_init(void)
+static int __devinit alsa_card_cs423x_init(void)
 {
 	int dev, cards = 0;
 
diff --git a/sound/isa/cs423x/cs4236_lib.c b/sound/isa/cs423x/cs4236_lib.c
--- a/sound/isa/cs423x/cs4236_lib.c
+++ b/sound/isa/cs423x/cs4236_lib.c
@@ -957,7 +957,7 @@ EXPORT_SYMBOL(snd_cs4236_mixer);
  *  INIT part
  */
 
-static int __init alsa_cs4236_init(void)
+static int __devinit alsa_cs4236_init(void)
 {
 	return 0;
 }
diff --git a/sound/isa/dt019x.c b/sound/isa/dt019x.c
--- a/sound/isa/dt019x.c
+++ b/sound/isa/dt019x.c
@@ -303,7 +303,7 @@ static struct pnp_card_driver dt019x_pnp
 	.remove         = __devexit_p(snd_dt019x_pnp_remove),
 };
 
-static int __init alsa_card_dt019x_init(void)
+static int __devinit alsa_card_dt019x_init(void)
 {
 	int cards = 0;
 
diff --git a/sound/isa/es1688/es1688.c b/sound/isa/es1688/es1688.c
--- a/sound/isa/es1688/es1688.c
+++ b/sound/isa/es1688/es1688.c
@@ -71,7 +71,7 @@ MODULE_PARM_DESC(dma8, "8-bit DMA # for 
 static snd_card_t *snd_audiodrive_cards[SNDRV_CARDS] = SNDRV_DEFAULT_PTR;
 
 
-static int __init snd_audiodrive_probe(int dev)
+static int __devinit snd_audiodrive_probe(int dev)
 {
 	static int possible_irqs[] = {5, 9, 10, 7, -1};
 	static int possible_dmas[] = {1, 3, 0, -1};
@@ -151,7 +151,7 @@ static int __init snd_audiodrive_probe(i
 
 }
 
-static int __init snd_audiodrive_legacy_auto_probe(unsigned long xport)
+static int __devinit snd_audiodrive_legacy_auto_probe(unsigned long xport)
 {
 	static int dev;
 	int res;
@@ -168,7 +168,7 @@ static int __init snd_audiodrive_legacy_
 	return -ENODEV;
 }
 
-static int __init alsa_card_es1688_init(void)
+static int __devinit alsa_card_es1688_init(void)
 {
 	static unsigned long possible_ports[] = {0x220, 0x240, 0x260, -1};
 	int dev, cards = 0, i;
diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -1049,7 +1049,7 @@ EXPORT_SYMBOL(snd_es1688_mixer);
  *  INIT part
  */
 
-static int __init alsa_es1688_init(void)
+static int __devinit alsa_es1688_init(void)
 {
 	return 0;
 }
diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -2168,7 +2168,7 @@ static struct pnp_card_driver es18xx_pnp
 };
 #endif /* CONFIG_PNP */
 
-static int __init alsa_card_es18xx_init(void)
+static int __devinit alsa_card_es18xx_init(void)
 {
 	static unsigned long possible_ports[] = {0x220, 0x240, 0x260, 0x280, -1};
 	int dev, cards = 0, i;
diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -500,7 +500,7 @@ EXPORT_SYMBOL(snd_gf1_mem_lock);
  *  INIT part
  */
 
-static int __init alsa_gus_init(void)
+static int __devinit alsa_gus_init(void)
 {
 	return 0;
 }
diff --git a/sound/isa/gus/gus_synth.c b/sound/isa/gus/gus_synth.c
--- a/sound/isa/gus/gus_synth.c
+++ b/sound/isa/gus/gus_synth.c
@@ -310,7 +310,7 @@ static int snd_gus_synth_delete_device(s
 	return 0;
 }
 
-static int __init alsa_gus_synth_init(void)
+static int __devinit alsa_gus_synth_init(void)
 {
 	static snd_seq_dev_ops_t ops = {
 		snd_gus_synth_new_device,
diff --git a/sound/isa/gus/gusclassic.c b/sound/isa/gus/gusclassic.c
--- a/sound/isa/gus/gusclassic.c
+++ b/sound/isa/gus/gusclassic.c
@@ -73,7 +73,7 @@ MODULE_PARM_DESC(pcm_channels, "Reserved
 static snd_card_t *snd_gusclassic_cards[SNDRV_CARDS] = SNDRV_DEFAULT_PTR;
 
 
-static int __init snd_gusclassic_detect(snd_gus_card_t * gus)
+static int __devinit snd_gusclassic_detect(snd_gus_card_t * gus)
 {
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 0);	/* reset GF1 */
 #ifdef CONFIG_SND_DEBUG_DETECT
@@ -109,7 +109,7 @@ static int __init snd_gusclassic_detect(
 	return 0;
 }
 
-static void __init snd_gusclassic_init(int dev, snd_gus_card_t * gus)
+static void __devinit snd_gusclassic_init(int dev, snd_gus_card_t * gus)
 {
 	gus->equal_irq = 0;
 	gus->codec_flag = 0;
@@ -117,7 +117,7 @@ static void __init snd_gusclassic_init(i
 	gus->joystick_dac = joystick_dac[dev];
 }
 
-static int __init snd_gusclassic_probe(int dev)
+static int __devinit snd_gusclassic_probe(int dev)
 {
 	static int possible_irqs[] = {5, 11, 12, 9, 7, 15, 3, 4, -1};
 	static int possible_dmas[] = {5, 6, 7, 1, 3, -1};
@@ -207,7 +207,7 @@ static int __init snd_gusclassic_probe(i
 	return 0;
 }
 
-static int __init snd_gusclassic_legacy_auto_probe(unsigned long xport)
+static int __devinit snd_gusclassic_legacy_auto_probe(unsigned long xport)
 {
 	static int dev;
 	int res;
@@ -224,7 +224,7 @@ static int __init snd_gusclassic_legacy_
 	return -ENODEV;
 }
 
-static int __init alsa_card_gusclassic_init(void)
+static int __devinit alsa_card_gusclassic_init(void)
 {
 	static unsigned long possible_ports[] = {0x220, 0x230, 0x240, 0x250, 0x260, -1};
 	int dev, cards, i;
diff --git a/sound/isa/gus/gusextreme.c b/sound/isa/gus/gusextreme.c
--- a/sound/isa/gus/gusextreme.c
+++ b/sound/isa/gus/gusextreme.c
@@ -88,7 +88,7 @@ MODULE_PARM_DESC(pcm_channels, "Reserved
 static snd_card_t *snd_gusextreme_cards[SNDRV_CARDS] = SNDRV_DEFAULT_PTR;
 
 
-static int __init snd_gusextreme_detect(int dev,
+static int __devinit snd_gusextreme_detect(int dev,
 					snd_card_t * card,
 					snd_gus_card_t * gus,
 					es1688_t *es1688)
@@ -156,12 +156,12 @@ static int __init snd_gusextreme_detect(
 	return 0;
 }
 
-static void __init snd_gusextreme_init(int dev, snd_gus_card_t * gus)
+static void __devinit snd_gusextreme_init(int dev, snd_gus_card_t * gus)
 {
 	gus->joystick_dac = joystick_dac[dev];
 }
 
-static int __init snd_gusextreme_mixer(es1688_t *chip)
+static int __devinit snd_gusextreme_mixer(es1688_t *chip)
 {
 	snd_card_t *card = chip->card;
 	snd_ctl_elem_id_t id1, id2;
@@ -183,7 +183,7 @@ static int __init snd_gusextreme_mixer(e
 	return 0;
 }
 
-static int __init snd_gusextreme_probe(int dev)
+static int __devinit snd_gusextreme_probe(int dev)
 {
 	static int possible_ess_irqs[] = {5, 9, 10, 7, -1};
 	static int possible_ess_dmas[] = {1, 3, 0, -1};
@@ -314,7 +314,7 @@ static int __init snd_gusextreme_probe(i
 	return err;
 }
 
-static int __init snd_gusextreme_legacy_auto_probe(unsigned long xport)
+static int __devinit snd_gusextreme_legacy_auto_probe(unsigned long xport)
 {
         static int dev;
         int res;
@@ -331,7 +331,7 @@ static int __init snd_gusextreme_legacy_
         return -ENODEV;
 }
 
-static int __init alsa_card_gusextreme_init(void)
+static int __devinit alsa_card_gusextreme_init(void)
 {
 	static unsigned long possible_ports[] = {0x220, 0x240, 0x260, -1};
 	int dev, cards, i;
diff --git a/sound/isa/gus/gusmax.c b/sound/isa/gus/gusmax.c
--- a/sound/isa/gus/gusmax.c
+++ b/sound/isa/gus/gusmax.c
@@ -83,7 +83,7 @@ struct snd_gusmax {
 static snd_card_t *snd_gusmax_cards[SNDRV_CARDS] = SNDRV_DEFAULT_PTR;
 
 
-static int __init snd_gusmax_detect(snd_gus_card_t * gus)
+static int __devinit snd_gusmax_detect(snd_gus_card_t * gus)
 {
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 0);	/* reset GF1 */
 #ifdef CONFIG_SND_DEBUG_DETECT
@@ -140,7 +140,7 @@ static irqreturn_t snd_gusmax_interrupt(
 	return IRQ_RETVAL(handled);
 }
 
-static void __init snd_gusmax_init(int dev, snd_card_t * card, snd_gus_card_t * gus)
+static void __devinit snd_gusmax_init(int dev, snd_card_t * card, snd_gus_card_t * gus)
 {
 	gus->equal_irq = 1;
 	gus->codec_flag = 1;
@@ -158,7 +158,7 @@ static void __init snd_gusmax_init(int d
 #define CS4231_PRIVATE( left, right, shift, mute ) \
 			((left << 24)|(right << 16)|(shift<<8)|mute)
 
-static int __init snd_gusmax_mixer(cs4231_t *chip)
+static int __devinit snd_gusmax_mixer(cs4231_t *chip)
 {
 	snd_card_t *card = chip->card;
 	snd_ctl_elem_id_t id1, id2;
@@ -217,7 +217,7 @@ static void snd_gusmax_free(snd_card_t *
 		free_irq(maxcard->irq, (void *)maxcard);
 }
 
-static int __init snd_gusmax_probe(int dev)
+static int __devinit snd_gusmax_probe(int dev)
 {
 	static int possible_irqs[] = {5, 11, 12, 9, 7, 15, 3, -1};
 	static int possible_dmas[] = {5, 6, 7, 1, 3, -1};
@@ -347,7 +347,7 @@ static int __init snd_gusmax_probe(int d
 	return 0;
 }
 
-static int __init snd_gusmax_legacy_auto_probe(unsigned long xport)
+static int __devinit snd_gusmax_legacy_auto_probe(unsigned long xport)
 {
 	static int dev;
 	int res;
@@ -364,7 +364,7 @@ static int __init snd_gusmax_legacy_auto
 	return -ENODEV;
 }
 
-static int __init alsa_card_gusmax_init(void)
+static int __devinit alsa_card_gusmax_init(void)
 {
 	static unsigned long possible_ports[] = {0x220, 0x230, 0x240, 0x250, 0x260, -1};
 	int dev, cards, i;
diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -909,7 +909,7 @@ static struct pnp_card_driver interwave_
 
 #endif /* CONFIG_PNP */
 
-static int __init alsa_card_interwave_init(void)
+static int __devinit alsa_card_interwave_init(void)
 {
 	int cards = 0, i;
 	static long possible_ports[] = {0x210, 0x220, 0x230, 0x240, 0x250, 0x260, -1};
diff --git a/sound/isa/opl3sa2.c b/sound/isa/opl3sa2.c
--- a/sound/isa/opl3sa2.c
+++ b/sound/isa/opl3sa2.c
@@ -213,7 +213,7 @@ static void snd_opl3sa2_write(opl3sa2_t 
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
-static int __init snd_opl3sa2_detect(opl3sa2_t *chip)
+static int __devinit snd_opl3sa2_detect(opl3sa2_t *chip)
 {
 	snd_card_t *card;
 	unsigned long port;
@@ -481,7 +481,7 @@ static void snd_opl3sa2_master_free(snd_
 	chip->master_volume = NULL;
 }
 
-static int __init snd_opl3sa2_mixer(opl3sa2_t *chip)
+static int __devinit snd_opl3sa2_mixer(opl3sa2_t *chip)
 {
 	snd_card_t *card = chip->card;
 	snd_ctl_elem_id_t id1, id2;
@@ -567,7 +567,7 @@ static int snd_opl3sa2_resume(snd_card_t
 #endif /* CONFIG_PM */
 
 #ifdef CONFIG_PNP
-static int __init snd_opl3sa2_pnp(int dev, opl3sa2_t *chip,
+static int __devinit snd_opl3sa2_pnp(int dev, opl3sa2_t *chip,
 				  struct pnp_card_link *card,
 				  const struct pnp_card_device_id *id)
 {
@@ -815,7 +815,7 @@ static struct pnp_card_driver opl3sa2_pn
 };
 #endif /* CONFIG_PNP */
 
-static int __init alsa_card_opl3sa2_init(void)
+static int __devinit alsa_card_opl3sa2_init(void)
 {
 	int dev, cards = 0;
 
diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -2188,7 +2188,7 @@ static struct pnp_card_driver opti9xx_pn
 };
 #endif
 
-static int __init alsa_card_opti9xx_init(void)
+static int __devinit alsa_card_opti9xx_init(void)
 {
 	int cards, error;
 
diff --git a/sound/isa/sb/emu8000.c b/sound/isa/sb/emu8000.c
--- a/sound/isa/sb/emu8000.c
+++ b/sound/isa/sb/emu8000.c
@@ -131,7 +131,7 @@ snd_emu8000_dma_chan(emu8000_t *emu, int
 
 /*
  */
-static void __init
+static void __devinit
 snd_emu8000_read_wait(emu8000_t *emu)
 {
 	while ((EMU8000_SMALR_READ(emu) & 0x80000000) != 0) {
@@ -144,7 +144,7 @@ snd_emu8000_read_wait(emu8000_t *emu)
 
 /*
  */
-static void __init
+static void __devinit
 snd_emu8000_write_wait(emu8000_t *emu)
 {
 	while ((EMU8000_SMALW_READ(emu) & 0x80000000) != 0) {
@@ -158,7 +158,7 @@ snd_emu8000_write_wait(emu8000_t *emu)
 /*
  * detect a card at the given port
  */
-static int __init
+static int __devinit
 snd_emu8000_detect(emu8000_t *emu)
 {
 	/* Initialise */
@@ -184,7 +184,7 @@ snd_emu8000_detect(emu8000_t *emu)
 /*
  * intiailize audio channels
  */
-static void __init
+static void __devinit
 init_audio(emu8000_t *emu)
 {
 	int ch;
@@ -225,7 +225,7 @@ init_audio(emu8000_t *emu)
 /*
  * initialize DMA address
  */
-static void __init
+static void __devinit
 init_dma(emu8000_t *emu)
 {
 	EMU8000_SMALR_WRITE(emu, 0);
@@ -329,7 +329,7 @@ static unsigned short init4[128] /*__dev
  * Taken from the oss driver, not obvious from the doc how this
  * is meant to work
  */
-static void __init
+static void __devinit
 send_array(emu8000_t *emu, unsigned short *data, int size)
 {
 	int i;
@@ -351,7 +351,7 @@ send_array(emu8000_t *emu, unsigned shor
  * Send initialization arrays to start up, this just follows the
  * initialisation sequence in the adip.
  */
-static void __init
+static void __devinit
 init_arrays(emu8000_t *emu)
 {
 	send_array(emu, init1, ARRAY_SIZE(init1)/4);
@@ -377,7 +377,7 @@ init_arrays(emu8000_t *emu)
  * seems that the only way to do this is to use the one channel and keep
  * reallocating between read and write.
  */
-static void __init
+static void __devinit
 size_dram(emu8000_t *emu)
 {
 	int i, size;
@@ -503,7 +503,7 @@ snd_emu8000_init_fm(emu8000_t *emu)
 /*
  * The main initialization routine.
  */
-static void __init
+static void __devinit
 snd_emu8000_init_hw(emu8000_t *emu)
 {
 	int i;
@@ -1022,7 +1022,7 @@ static snd_kcontrol_new_t *mixer_defs[EM
 /*
  * create and attach mixer elements for WaveTable treble/bass controls
  */
-static int __init
+static int __devinit
 snd_emu8000_create_mixer(snd_card_t *card, emu8000_t *emu)
 {
 	int i, err = 0;
@@ -1081,7 +1081,7 @@ static int snd_emu8000_dev_free(snd_devi
 /*
  * initialize and register emu8000 synth device.
  */
-int __init
+int __devinit
 snd_emu8000_new(snd_card_t *card, int index, long port, int seq_ports, snd_seq_device_t **awe_ret)
 {
 	snd_seq_device_t *awe;
diff --git a/sound/isa/sb/emu8000_synth.c b/sound/isa/sb/emu8000_synth.c
--- a/sound/isa/sb/emu8000_synth.c
+++ b/sound/isa/sb/emu8000_synth.c
@@ -115,7 +115,7 @@ static int snd_emu8000_delete_device(snd
  *  INIT part
  */
 
-static int __init alsa_emu8000_init(void)
+static int __devinit alsa_emu8000_init(void)
 {
 	
 	static snd_seq_dev_ops_t ops = {
diff --git a/sound/isa/sb/es968.c b/sound/isa/sb/es968.c
--- a/sound/isa/sb/es968.c
+++ b/sound/isa/sb/es968.c
@@ -123,7 +123,7 @@ static int __devinit snd_card_es968_pnp(
 	return 0;
 }
 
-static int __init snd_card_es968_probe(int dev,
+static int __devinit snd_card_es968_probe(int dev,
 					struct pnp_card_link *pcard,
 					const struct pnp_card_device_id *pid)
 {
@@ -214,7 +214,7 @@ static struct pnp_card_driver es968_pnpc
 	.remove		= __devexit_p(snd_es968_pnp_remove),
 };
 
-static int __init alsa_card_es968_init(void)
+static int __devinit alsa_card_es968_init(void)
 {
 	int cards = pnp_register_card_driver(&es968_pnpc_driver);
 #ifdef MODULE
diff --git a/sound/isa/sb/sb16.c b/sound/isa/sb/sb16.c
--- a/sound/isa/sb/sb16.c
+++ b/sound/isa/sb/sb16.c
@@ -351,7 +351,7 @@ static void snd_sb16_free(snd_card_t *ca
 	}
 }
 
-static int __init snd_sb16_probe(int dev,
+static int __devinit snd_sb16_probe(int dev,
 				 struct pnp_card_link *pcard,
 				 const struct pnp_card_device_id *pid)
 {
@@ -552,7 +552,7 @@ static int __init snd_sb16_probe(int dev
 	return 0;
 }
 
-static int __init snd_sb16_probe_legacy_port(unsigned long xport)
+static int __devinit snd_sb16_probe_legacy_port(unsigned long xport)
 {
 	static int dev;
 	int res;
@@ -612,7 +612,7 @@ static struct pnp_card_driver sb16_pnpc_
 
 #endif /* CONFIG_PNP */
 
-static int __init alsa_card_sb16_init(void)
+static int __devinit alsa_card_sb16_init(void)
 {
 	int dev, cards = 0, i;
 	static unsigned long possible_ports[] = {0x220, 0x240, 0x260, 0x280, -1};
diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -1162,7 +1162,7 @@ EXPORT_SYMBOL(snd_sb_csp_new);
  * INIT part
  */
 
-static int __init alsa_sb_csp_init(void)
+static int __devinit alsa_sb_csp_init(void)
 {
 	return 0;
 }
diff --git a/sound/isa/sb/sb16_main.c b/sound/isa/sb/sb16_main.c
--- a/sound/isa/sb/sb16_main.c
+++ b/sound/isa/sb/sb16_main.c
@@ -903,7 +903,7 @@ EXPORT_SYMBOL(snd_sb16dsp_interrupt);
  *  INIT part
  */
 
-static int __init alsa_sb16_init(void)
+static int __devinit alsa_sb16_init(void)
 {
 	return 0;
 }
diff --git a/sound/isa/sb/sb8.c b/sound/isa/sb/sb8.c
--- a/sound/isa/sb/sb8.c
+++ b/sound/isa/sb/sb8.c
@@ -84,7 +84,7 @@ static void snd_sb8_free(snd_card_t *car
 	}
 }
 
-static int __init snd_sb8_probe(int dev)
+static int __devinit snd_sb8_probe(int dev)
 {
 	sb_t *chip;
 	snd_card_t *card;
@@ -170,7 +170,7 @@ static int __init snd_sb8_probe(int dev)
 	return 0;
 }
 
-static int __init snd_card_sb8_legacy_auto_probe(unsigned long xport)
+static int __devinit snd_card_sb8_legacy_auto_probe(unsigned long xport)
 {
         static int dev;
         int res;
@@ -187,7 +187,7 @@ static int __init snd_card_sb8_legacy_au
         return -ENODEV;
 }
 
-static int __init alsa_card_sb8_init(void)
+static int __devinit alsa_card_sb8_init(void)
 {
 	static unsigned long possible_ports[] = {0x220, 0x240, 0x260, -1};
 	int dev, cards, i;
diff --git a/sound/isa/sb/sb8_main.c b/sound/isa/sb/sb8_main.c
--- a/sound/isa/sb/sb8_main.c
+++ b/sound/isa/sb/sb8_main.c
@@ -552,7 +552,7 @@ EXPORT_SYMBOL(snd_sb8dsp_midi);
  *  INIT part
  */
 
-static int __init alsa_sb8_init(void)
+static int __devinit alsa_sb8_init(void)
 {
 	return 0;
 }
diff --git a/sound/isa/sb/sb_common.c b/sound/isa/sb/sb_common.c
--- a/sound/isa/sb/sb_common.c
+++ b/sound/isa/sb/sb_common.c
@@ -300,7 +300,7 @@ EXPORT_SYMBOL(snd_sbmixer_add_ctl);
  *  INIT part
  */
 
-static int __init alsa_sb_common_init(void)
+static int __devinit alsa_sb_common_init(void)
 {
 	return 0;
 }
diff --git a/sound/isa/sgalaxy.c b/sound/isa/sgalaxy.c
--- a/sound/isa/sgalaxy.c
+++ b/sound/isa/sgalaxy.c
@@ -92,7 +92,7 @@ static int snd_sgalaxy_sbdsp_reset(unsig
 	return 0;
 }
 
-static int __init snd_sgalaxy_sbdsp_command(unsigned long port, unsigned char val)
+static int __devinit snd_sgalaxy_sbdsp_command(unsigned long port, unsigned char val)
 {
 	int i;
        	
@@ -110,7 +110,7 @@ static irqreturn_t snd_sgalaxy_dummy_int
 	return IRQ_NONE;
 }
 
-static int __init snd_sgalaxy_setup_wss(unsigned long port, int irq, int dma)
+static int __devinit snd_sgalaxy_setup_wss(unsigned long port, int irq, int dma)
 {
 	static int interrupt_bits[] = {-1, -1, -1, -1, -1, -1, -1, 0x08, -1, 
 				       0x10, 0x18, 0x20, -1, -1, -1, -1};
@@ -157,7 +157,7 @@ static int __init snd_sgalaxy_setup_wss(
 	return 0;
 }
 
-static int __init snd_sgalaxy_detect(int dev, int irq, int dma)
+static int __devinit snd_sgalaxy_detect(int dev, int irq, int dma)
 {
 #if 0
 	snd_printdd("sgalaxy - switching to WSS mode\n");
@@ -178,7 +178,7 @@ AD1848_DOUBLE("Aux Playback Switch", 0, 
 AD1848_DOUBLE("Aux Playback Volume", 0, SGALAXY_AUXC_LEFT, SGALAXY_AUXC_RIGHT, 0, 0, 31, 0)
 };
 
-static int __init snd_sgalaxy_mixer(ad1848_t *chip)
+static int __devinit snd_sgalaxy_mixer(ad1848_t *chip)
 {
 	snd_card_t *card = chip->card;
 	snd_ctl_elem_id_t id1, id2;
@@ -214,7 +214,7 @@ static int __init snd_sgalaxy_mixer(ad18
 	return 0;
 }
 
-static int __init snd_sgalaxy_probe(int dev)
+static int __devinit snd_sgalaxy_probe(int dev)
 {
 	static int possible_irqs[] = {7, 9, 10, 11, -1};
 	static int possible_dmas[] = {1, 3, 0, -1};
@@ -292,7 +292,7 @@ static int __init snd_sgalaxy_probe(int 
 	return 0;
 }
 
-static int __init alsa_card_sgalaxy_init(void)
+static int __devinit alsa_card_sgalaxy_init(void)
 {
 	int dev, cards;
 
diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -1424,7 +1424,7 @@ static struct pnp_card_driver sscape_pnp
 
 #endif /* CONFIG_PNP */
 
-static int __init sscape_manual_probe(struct params *params)
+static int __devinit sscape_manual_probe(struct params *params)
 {
 	int ret;
 	unsigned i;
@@ -1482,7 +1482,7 @@ static void sscape_exit(void)
 }
 
 
-static int __init sscape_init(void)
+static int __devinit sscape_init(void)
 {
 	int ret;
 
diff --git a/sound/isa/wavefront/wavefront.c b/sound/isa/wavefront/wavefront.c
--- a/sound/isa/wavefront/wavefront.c
+++ b/sound/isa/wavefront/wavefront.c
@@ -672,7 +672,7 @@ static struct pnp_card_driver wavefront_
 
 #endif /* CONFIG_PNP */
 
-static int __init alsa_card_wavefront_init(void)
+static int __devinit alsa_card_wavefront_init(void)
 {
 	int cards = 0;
 	int dev;
diff --git a/sound/isa/wavefront/wavefront_fx.c b/sound/isa/wavefront/wavefront_fx.c
--- a/sound/isa/wavefront/wavefront_fx.c
+++ b/sound/isa/wavefront/wavefront_fx.c
@@ -34,7 +34,7 @@
 
 /* weird stuff, derived from port I/O tracing with dosemu */
 
-static unsigned char page_zero[] __initdata = {
+static unsigned char page_zero[] __devinitdata = {
 0x01, 0x7c, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf5, 0x00,
 0x11, 0x00, 0x20, 0x00, 0x32, 0x00, 0x40, 0x00, 0x13, 0x00, 0x00,
 0x00, 0x14, 0x02, 0x76, 0x00, 0x60, 0x00, 0x80, 0x02, 0x00, 0x00,
@@ -61,7 +61,7 @@ static unsigned char page_zero[] __initd
 0x1d, 0x02, 0xdf
 };
 
-static unsigned char page_one[] __initdata = {
+static unsigned char page_one[] __devinitdata = {
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x19, 0x00,
 0x1f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xd8, 0x00, 0x00,
 0x02, 0x20, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x01,
@@ -88,7 +88,7 @@ static unsigned char page_one[] __initda
 0x60, 0x00, 0x1b
 };
 
-static unsigned char page_two[] __initdata = {
+static unsigned char page_two[] __devinitdata = {
 0xc4, 0x00, 0x44, 0x07, 0x44, 0x00, 0x40, 0x25, 0x01, 0x06, 0xc4,
 0x07, 0x40, 0x25, 0x01, 0x00, 0x46, 0x46, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -103,7 +103,7 @@ static unsigned char page_two[] __initda
 0x46, 0x05, 0x46, 0x07, 0x46, 0x07, 0x44
 };
 
-static unsigned char page_three[] __initdata = {
+static unsigned char page_three[] __devinitdata = {
 0x07, 0x40, 0x00, 0x00, 0x00, 0x47, 0x00, 0x40, 0x00, 0x40, 0x06,
 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -118,7 +118,7 @@ static unsigned char page_three[] __init
 0x02, 0x00, 0x42, 0x00, 0xc0, 0x00, 0x40
 };
 
-static unsigned char page_four[] __initdata = {
+static unsigned char page_four[] __devinitdata = {
 0x63, 0x03, 0x26, 0x02, 0x2c, 0x00, 0x24, 0x00, 0x2e, 0x02, 0x02,
 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -133,7 +133,7 @@ static unsigned char page_four[] __initd
 0x02, 0x62, 0x02, 0x20, 0x01, 0x21, 0x01
 };
 
-static unsigned char page_six[] __initdata = {
+static unsigned char page_six[] __devinitdata = {
 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x04, 0x00, 0x00, 0x06, 0x00,
 0x00, 0x08, 0x00, 0x00, 0x0a, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x0e,
 0x00, 0x00, 0x10, 0x00, 0x00, 0x12, 0x00, 0x00, 0x14, 0x00, 0x00,
@@ -154,7 +154,7 @@ static unsigned char page_six[] __initda
 0x80, 0x00, 0x7e, 0x80, 0x80
 };
 
-static unsigned char page_seven[] __initdata = {
+static unsigned char page_seven[] __devinitdata = {
 0x0f, 0xff, 0x00, 0x00, 0x08, 0x00, 0x08, 0x00, 0x02, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x0f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00,
 0x08, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x0f,
@@ -181,7 +181,7 @@ static unsigned char page_seven[] __init
 0x00, 0x02, 0x00
 };
 
-static unsigned char page_zero_v2[] __initdata = {
+static unsigned char page_zero_v2[] __devinitdata = {
 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -193,7 +193,7 @@ static unsigned char page_zero_v2[] __in
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
-static unsigned char page_one_v2[] __initdata = {
+static unsigned char page_one_v2[] __devinitdata = {
 0x01, 0xc0, 0x01, 0xfa, 0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -205,21 +205,21 @@ static unsigned char page_one_v2[] __ini
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
-static unsigned char page_two_v2[] __initdata = {
+static unsigned char page_two_v2[] __devinitdata = {
 0x46, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00
 };
-static unsigned char page_three_v2[] __initdata = {
+static unsigned char page_three_v2[] __devinitdata = {
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00
 };
-static unsigned char page_four_v2[] __initdata = {
+static unsigned char page_four_v2[] __devinitdata = {
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -227,7 +227,7 @@ static unsigned char page_four_v2[] __in
 0x00, 0x00, 0x00, 0x00
 };
 
-static unsigned char page_seven_v2[] __initdata = {
+static unsigned char page_seven_v2[] __devinitdata = {
 0x0f, 0xff, 0x0f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -239,7 +239,7 @@ static unsigned char page_seven_v2[] __i
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
-static unsigned char mod_v2[] __initdata = {
+static unsigned char mod_v2[] __devinitdata = {
 0x01, 0x00, 0x02, 0x00, 0x01, 0x01, 0x02, 0x00, 0x01, 0x02, 0x02,
 0x00, 0x01, 0x03, 0x02, 0x00, 0x01, 0x04, 0x02, 0x00, 0x01, 0x05,
 0x02, 0x00, 0x01, 0x06, 0x02, 0x00, 0x01, 0x07, 0x02, 0x00, 0xb0,
@@ -269,7 +269,7 @@ static unsigned char mod_v2[] __initdata
 0x02, 0x01, 0x01, 0x04, 0x02, 0x01, 0x01, 0x05, 0x02, 0x01, 0x01,
 0x06, 0x02, 0x01, 0x01, 0x07, 0x02, 0x01
 };
-static unsigned char coefficients[] __initdata = {
+static unsigned char coefficients[] __devinitdata = {
 0x07, 0x46, 0x00, 0x00, 0x07, 0x49, 0x00, 0x00, 0x00, 0x4b, 0x03,
 0x11, 0x00, 0x4d, 0x01, 0x32, 0x07, 0x46, 0x00, 0x00, 0x07, 0x49,
 0x00, 0x00, 0x07, 0x40, 0x00, 0x00, 0x07, 0x41, 0x00, 0x00, 0x01,
@@ -305,14 +305,14 @@ static unsigned char coefficients[] __in
 0x06, 0x6c, 0x4c, 0x6c, 0x06, 0x50, 0x52, 0xe2, 0x06, 0x42, 0x02,
 0xba
 };
-static unsigned char coefficients2[] __initdata = {
+static unsigned char coefficients2[] __devinitdata = {
 0x07, 0x46, 0x00, 0x00, 0x07, 0x49, 0x00, 0x00, 0x07, 0x45, 0x0f,
 0xff, 0x07, 0x48, 0x0f, 0xff, 0x07, 0x7b, 0x04, 0xcc, 0x07, 0x7d,
 0x04, 0xcc, 0x07, 0x7c, 0x00, 0x00, 0x07, 0x7e, 0x00, 0x00, 0x07,
 0x46, 0x00, 0x00, 0x07, 0x49, 0x00, 0x00, 0x07, 0x47, 0x00, 0x00,
 0x07, 0x4a, 0x00, 0x00, 0x07, 0x4c, 0x00, 0x00, 0x07, 0x4e, 0x00, 0x00
 };
-static unsigned char coefficients3[] __initdata = {
+static unsigned char coefficients3[] __devinitdata = {
 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x28, 0x00, 0x51, 0x00,
 0x51, 0x00, 0x7a, 0x00, 0x7a, 0x00, 0xa3, 0x00, 0xa3, 0x00, 0xcc,
 0x00, 0xcc, 0x00, 0xf5, 0x00, 0xf5, 0x01, 0x1e, 0x01, 0x1e, 0x01,
@@ -563,7 +563,7 @@ snd_wavefront_fx_ioctl (snd_hwdep_t *sde
 */
 
 
-int __init
+int __devinit
 snd_wavefront_fx_start (snd_wavefront_t *dev)
 
 {
diff --git a/sound/isa/wavefront/wavefront_midi.c b/sound/isa/wavefront/wavefront_midi.c
--- a/sound/isa/wavefront/wavefront_midi.c
+++ b/sound/isa/wavefront/wavefront_midi.c
@@ -474,7 +474,7 @@ snd_wavefront_midi_disable_virtual (snd_
 	spin_unlock_irqrestore (&card->wavefront.midi.virtual, flags);
 }
 
-int __init
+int __devinit
 snd_wavefront_midi_start (snd_wavefront_card_t *card)
 
 {
diff --git a/sound/isa/wavefront/wavefront_synth.c b/sound/isa/wavefront/wavefront_synth.c
--- a/sound/isa/wavefront/wavefront_synth.c
+++ b/sound/isa/wavefront/wavefront_synth.c
@@ -1746,7 +1746,7 @@ snd_wavefront_internal_interrupt (snd_wa
 7 Unused
 */
 
-static int __init
+static int __devinit
 snd_wavefront_interrupt_bits (int irq)
 
 {
@@ -1774,7 +1774,7 @@ snd_wavefront_interrupt_bits (int irq)
 	return bits;
 }
 
-static void __init
+static void __devinit
 wavefront_should_cause_interrupt (snd_wavefront_t *dev, 
 				  int val, int port, int timeout)
 
@@ -1796,7 +1796,7 @@ wavefront_should_cause_interrupt (snd_wa
 	}
 }
 
-static int __init
+static int __devinit
 wavefront_reset_to_cleanliness (snd_wavefront_t *dev)
 
 {
@@ -1955,7 +1955,7 @@ wavefront_reset_to_cleanliness (snd_wave
 #include <asm/uaccess.h>
 
 
-static int __init
+static int __devinit
 wavefront_download_firmware (snd_wavefront_t *dev, char *path)
 
 {
@@ -2056,7 +2056,7 @@ wavefront_download_firmware (snd_wavefro
 }
 
 
-static int __init
+static int __devinit
 wavefront_do_reset (snd_wavefront_t *dev)
 
 {
@@ -2145,7 +2145,7 @@ wavefront_do_reset (snd_wavefront_t *dev
 	return 1;
 }
 
-int __init
+int __devinit
 snd_wavefront_start (snd_wavefront_t *dev)
 
 {
@@ -2187,7 +2187,7 @@ snd_wavefront_start (snd_wavefront_t *de
 	return (0);
 }
 
-int __init
+int __devinit
 snd_wavefront_detect (snd_wavefront_card_t *card)
 
 {
diff --git a/sound/last.c b/sound/last.c
--- a/sound/last.c
+++ b/sound/last.c
@@ -24,7 +24,7 @@
 #include <linux/init.h>
 #include <sound/core.h>
 
-static int __init alsa_sound_last_init(void)
+static int __devinit alsa_sound_last_init(void)
 {
 	int idx, ok = 0;
 	
@@ -39,4 +39,4 @@ static int __init alsa_sound_last_init(v
 	return 0;
 }
 
-__initcall(alsa_sound_last_init);
+__devinitcall(alsa_sound_last_init);
diff --git a/sound/mips/au1x00.c b/sound/mips/au1x00.c
--- a/sound/mips/au1x00.c
+++ b/sound/mips/au1x00.c
@@ -625,7 +625,7 @@ snd_au1000_free(snd_card_t *card)
 
 }
 
-static int __init
+static int __devinit
 au1000_init(void)
 {
 	int err;
diff --git a/sound/oss/aci.c b/sound/oss/aci.c
--- a/sound/oss/aci.c
+++ b/sound/oss/aci.c
@@ -598,7 +598,7 @@ static struct mixer_operations aci_mixer
  * from the inputs to the codec output are muted.
  */
 
-static int __init attach_aci(void)
+static int __devinit attach_aci(void)
 {
 	char *boardname;
 	int i, rc = -EBUSY;
diff --git a/sound/oss/ad1816.c b/sound/oss/ad1816.c
--- a/sound/oss/ad1816.c
+++ b/sound/oss/ad1816.c
@@ -965,7 +965,7 @@ static struct mixer_operations ad1816_mi
 /* check if AD1816 present at specified hw_config and register device with OS 
  * return 1 if initialization was successful, 0 otherwise
  */
-static int __init ad1816_init_card (struct address_info *hw_config, 
+static int __devinit ad1816_init_card (struct address_info *hw_config, 
 	struct pnp_dev *pnp)
 {
 	ad1816_info    *devc = NULL;
@@ -1206,10 +1206,10 @@ static void __exit unload_card(ad1816_in
 		printk(KERN_WARNING "ad1816: no device/card specified\n");
 }
 
-static int __initdata io = -1;
-static int __initdata irq = -1;
-static int __initdata dma = -1;
-static int __initdata dma2 = -1;
+static int __devinitdata io = -1;
+static int __devinitdata irq = -1;
+static int __devinitdata dma = -1;
+static int __devinitdata dma2 = -1;
 
 #ifdef __ISAPNP__
 /* use isapnp for configuration */
@@ -1232,7 +1232,7 @@ static struct {
 	unsigned short vendor;
 	unsigned short function;
 	struct ad1816_data *data;
-} isapnp_ad1816_list[] __initdata = {
+} isapnp_ad1816_list[] __devinitdata = {
 	{	ISAPNP_ANY_ID, ISAPNP_ANY_ID,
 		ISAPNP_VENDOR('A','D','S'), ISAPNP_FUNCTION(0x7150), 
 		NULL },
@@ -1245,7 +1245,7 @@ static struct {
 MODULE_DEVICE_TABLE(isapnp, isapnp_ad1816_list);
 
 
-static void __init ad1816_config_pnp_card(struct pnp_card *card,
+static void __devinit ad1816_config_pnp_card(struct pnp_card *card,
 					  unsigned short vendor,
 					  unsigned short function)
 {
@@ -1271,7 +1271,7 @@ static void __init ad1816_config_pnp_car
 	}
 }
 
-static void __init ad1816_config_pnp_cards(void)
+static void __devinit ad1816_config_pnp_cards(void)
 {
 	int nr_pnp_cfg;
 	int i;
@@ -1299,7 +1299,7 @@ static void __init ad1816_config_pnp_car
 #endif
 
 /* module initialization */
-static int __init init_ad1816(void)
+static int __devinit init_ad1816(void)
 {
 	printk(KERN_INFO "ad1816: AD1816 sounddriver "
 			 "Copyright (C) 1998-2003 by Thorsten Knabe and "
@@ -1350,7 +1350,7 @@ module_exit(cleanup_ad1816);
 
 #ifndef MODULE
 /* kernel command line parameter evaluation */
-static int __init setup_ad1816(char *str)
+static int __devinit setup_ad1816(char *str)
 {
 	/* io, irq, dma, dma2 */
 	int ints[5];
diff --git a/sound/oss/ad1848.c b/sound/oss/ad1848.c
--- a/sound/oss/ad1848.c
+++ b/sound/oss/ad1848.c
@@ -2898,11 +2898,11 @@ EXPORT_SYMBOL(probe_ms_sound);
 EXPORT_SYMBOL(attach_ms_sound);
 EXPORT_SYMBOL(unload_ms_sound);
 
-static int __initdata io = -1;
-static int __initdata irq = -1;
-static int __initdata dma = -1;
-static int __initdata dma2 = -1;
-static int __initdata type = 0;
+static int __devinitdata io = -1;
+static int __devinitdata irq = -1;
+static int __devinitdata dma = -1;
+static int __devinitdata dma2 = -1;
+static int __devinitdata type = 0;
 
 module_param(io, int, 0);		/* I/O for a raw AD1848 card */
 module_param(irq, int, 0);		/* IRQ to use */
@@ -2930,7 +2930,7 @@ static struct {
 			vendor, function;
 	short mss_io, irq, dma, dma2;   /* index into isapnp table */
         int type;
-} ad1848_isapnp_list[] __initdata = {
+} ad1848_isapnp_list[] __devinitdata = {
 	{"CMI 8330 SoundPRO",
 		ISAPNP_VENDOR('C','M','I'), ISAPNP_DEVICE(0x0001),
 		ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001),
@@ -3015,7 +3015,7 @@ static struct pnp_dev *ad1848_init_gener
 	return(ad1848_dev);
 }
 
-static int __init ad1848_isapnp_init(struct address_info *hw_config, struct pnp_card *bus, int slot)
+static int __devinit ad1848_isapnp_init(struct address_info *hw_config, struct pnp_card *bus, int slot)
 {
 	char *busname = bus->name[0] ? bus->name : ad1848_isapnp_list[slot].name;
 
@@ -3033,7 +3033,7 @@ static int __init ad1848_isapnp_init(str
 	return 0;
 }
 
-static int __init ad1848_isapnp_probe(struct address_info *hw_config)
+static int __devinit ad1848_isapnp_probe(struct address_info *hw_config)
 {
 	static int first = 1;
 	int i;
@@ -3072,7 +3072,7 @@ static int __init ad1848_isapnp_probe(st
 #endif
 
 
-static int __init init_ad1848(void)
+static int __devinit init_ad1848(void)
 {
 	printk(KERN_INFO "ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996\n");
 
@@ -3137,7 +3137,7 @@ module_init(init_ad1848);
 module_exit(cleanup_ad1848);
 
 #ifndef MODULE
-static int __init setup_ad1848(char *str)
+static int __devinit setup_ad1848(char *str)
 {
         /* io, irq, dma, dma2, type */
 	int ints[6];
diff --git a/sound/oss/ad1889.c b/sound/oss/ad1889.c
--- a/sound/oss/ad1889.c
+++ b/sound/oss/ad1889.c
@@ -1087,7 +1087,7 @@ static struct pci_driver ad1889_driver =
 	.remove		= __devexit_p(ad1889_remove),
 };
 
-static int __init ad1889_init_module(void)
+static int __devinit ad1889_init_module(void)
 {
 	return pci_module_init(&ad1889_driver);
 }
diff --git a/sound/oss/adlib_card.c b/sound/oss/adlib_card.c
--- a/sound/oss/adlib_card.c
+++ b/sound/oss/adlib_card.c
@@ -17,23 +17,23 @@
 
 #include "opl3.h"
 
-static void __init attach_adlib_card(struct address_info *hw_config)
+static void __devinit attach_adlib_card(struct address_info *hw_config)
 {
 	hw_config->slots[0] = opl3_init(hw_config->io_base, hw_config->osp, THIS_MODULE);
 }
 
-static int __init probe_adlib(struct address_info *hw_config)
+static int __devinit probe_adlib(struct address_info *hw_config)
 {
 	return opl3_detect(hw_config->io_base, hw_config->osp);
 }
 
 static struct address_info cfg;
 
-static int __initdata io = -1;
+static int __devinitdata io = -1;
 
 module_param(io, int, 0);
 
-static int __init init_adlib(void)
+static int __devinit init_adlib(void)
 {
 	cfg.io_base = io;
 
@@ -58,7 +58,7 @@ module_init(init_adlib);
 module_exit(cleanup_adlib);
 
 #ifndef MODULE
-static int __init setup_adlib(char *str)
+static int __devinit setup_adlib(char *str)
 {
         /* io */
 	int ints[2];
diff --git a/sound/oss/aedsp16.c b/sound/oss/aedsp16.c
--- a/sound/oss/aedsp16.c
+++ b/sound/oss/aedsp16.c
@@ -417,14 +417,14 @@
 #define INIT_MSS    (1<<1)
 #define INIT_MPU401 (1<<2)
 
-static int      soft_cfg __initdata = 0;	/* bitmapped config */
-static int      soft_cfg_mss __initdata = 0;	/* bitmapped mss config */
-static int      ver[CARDVERLEN] __initdata = {0, 0};	/* DSP Ver:
+static int      soft_cfg __devinitdata = 0;	/* bitmapped config */
+static int      soft_cfg_mss __devinitdata = 0;	/* bitmapped mss config */
+static int      ver[CARDVERLEN] __devinitdata = {0, 0};	/* DSP Ver:
 						   hi->ver[0] lo->ver[1] */
 
 #if defined(CONFIG_SC6600)
 static int	hard_cfg[2]     /* lo<-hard_cfg[0] hi<-hard_cfg[1]      */
-                     __initdata = { 0, 0};
+                     __devinitdata = { 0, 0};
 #endif /* CONFIG_SC6600 */
 
 #if defined(CONFIG_SC6600)
@@ -438,7 +438,7 @@ struct	d_hcfg {
 	int cdrombase;
 };
 
-static struct d_hcfg decoded_hcfg __initdata = {0, };
+static struct d_hcfg decoded_hcfg __devinitdata = {0, };
 
 #endif /* CONFIG_SC6600 */
 
@@ -463,7 +463,7 @@ struct aedsp16_info {
  * Magic values that the DSP will eat when configuring irq/mirq/dma
  */
 /* DSP IRQ conversion array             */
-static struct orVals orIRQ[] __initdata = {
+static struct orVals orIRQ[] __devinitdata = {
 	{0x05, 0x28},
 	{0x07, 0x08},
 	{0x09, 0x10},
@@ -473,7 +473,7 @@ static struct orVals orIRQ[] __initdata 
 };
 
 /* MPU-401 IRQ conversion array         */
-static struct orVals orMIRQ[] __initdata = {
+static struct orVals orMIRQ[] __devinitdata = {
 	{0x05, 0x04},
 	{0x07, 0x44},
 	{0x09, 0x84},
@@ -482,7 +482,7 @@ static struct orVals orMIRQ[] __initdata
 };
 
 /* DMA Channels conversion array        */
-static struct orVals orDMA[] __initdata = {
+static struct orVals orDMA[] __devinitdata = {
 	{0x00, 0x01},
 	{0x01, 0x02},
 	{0x03, 0x03},
@@ -502,10 +502,10 @@ static struct aedsp16_info ae_config = {
 /*
  * Buffers to store audio card informations
  */
-static char     DSPCopyright[CARDNAMELEN + 1] __initdata = {0, };
-static char     DSPVersion[CARDVERLEN + 1] __initdata = {0, };
+static char     DSPCopyright[CARDNAMELEN + 1] __devinitdata = {0, };
+static char     DSPVersion[CARDVERLEN + 1] __devinitdata = {0, };
 
-static int __init aedsp16_wait_data(int port)
+static int __devinit aedsp16_wait_data(int port)
 {
 	int             loop = STATUSRETRY;
 	unsigned char   ret = 0;
@@ -528,7 +528,7 @@ static int __init aedsp16_wait_data(int 
 	return FALSE;
 }
 
-static int __init aedsp16_read(int port)
+static int __devinit aedsp16_read(int port)
 {
 	int inbyte;
 
@@ -546,12 +546,12 @@ static int __init aedsp16_read(int port)
 	return inbyte;
 }
 
-static int __init aedsp16_test_dsp(int port)
+static int __devinit aedsp16_test_dsp(int port)
 {
 	return ((aedsp16_read(port) == 0xaa) ? TRUE : FALSE);
 }
 
-static int __init aedsp16_dsp_reset(int port)
+static int __devinit aedsp16_dsp_reset(int port)
 {
 	/*
 	 * Reset DSP
@@ -572,7 +572,7 @@ static int __init aedsp16_dsp_reset(int 
 	return FALSE;
 }
 
-static int __init aedsp16_write(int port, int cmd)
+static int __devinit aedsp16_write(int port, int cmd)
 {
 	unsigned char   ret;
 	int             loop = HARDRETRY;
@@ -600,7 +600,7 @@ static int __init aedsp16_write(int port
 #if defined(CONFIG_SC6600)
 
 #if defined(AEDSP16_INFO) || defined(AEDSP16_DEBUG)
-void __init aedsp16_pinfo(void) {
+void __devinit aedsp16_pinfo(void) {
 	DBG(("\n Base address:  %x\n", decoded_hcfg.iobase));
 	DBG((" Joystick    : %s present\n", decoded_hcfg.joystick?"":" not"));
 	DBG((" WSS addr    :  %x\n", decoded_hcfg.wssbase));
@@ -610,7 +610,7 @@ void __init aedsp16_pinfo(void) {
 }
 #endif
 
-static void __init aedsp16_hard_decode(void) {
+static void __devinit aedsp16_hard_decode(void) {
 
 	DBG((" aedsp16_hard_decode: 0x%x, 0x%x\n", hard_cfg[0], hard_cfg[1]));
 
@@ -654,7 +654,7 @@ static void __init aedsp16_hard_decode(v
 	DBG(("success.\n"));
 }
 
-static void __init aedsp16_hard_encode(void) {
+static void __devinit aedsp16_hard_encode(void) {
 
 	DBG((" aedsp16_hard_encode: 0x%x, 0x%x\n", hard_cfg[0], hard_cfg[1]));
 
@@ -679,7 +679,7 @@ static void __init aedsp16_hard_encode(v
 
 }
 
-static int __init aedsp16_hard_write(int port) {
+static int __devinit aedsp16_hard_write(int port) {
 
 	DBG(("aedsp16_hard_write:\n"));
 
@@ -714,7 +714,7 @@ static int __init aedsp16_hard_write(int
 	return TRUE;
 }
 
-static int __init aedsp16_hard_read(int port) {
+static int __devinit aedsp16_hard_read(int port) {
 
 	DBG(("aedsp16_hard_read:\n"));
 
@@ -748,7 +748,7 @@ static int __init aedsp16_hard_read(int 
 	return TRUE;
 }
 
-static int __init aedsp16_ext_cfg_write(int port) {
+static int __devinit aedsp16_ext_cfg_write(int port) {
 
 	int extcfg, val;
 
@@ -802,7 +802,7 @@ static int __init aedsp16_ext_cfg_write(
 
 #endif /* CONFIG_SC6600 */
 
-static int __init aedsp16_cfg_write(int port) {
+static int __devinit aedsp16_cfg_write(int port) {
 	if (aedsp16_write(port, WRITE_MDIRQ_CFG)) {
 		printk("[AEDSP16] CMD 0x%x: failed!\n", WRITE_MDIRQ_CFG);
 		return FALSE;
@@ -814,7 +814,7 @@ static int __init aedsp16_cfg_write(int 
 	return TRUE;
 }
 
-static int __init aedsp16_init_mss(int port)
+static int __devinit aedsp16_init_mss(int port)
 {
 	DBG(("aedsp16_init_mss:\n"));
 
@@ -839,7 +839,7 @@ static int __init aedsp16_init_mss(int p
 	return TRUE;
 }
 
-static int __init aedsp16_setup_board(int port) {
+static int __devinit aedsp16_setup_board(int port) {
 	int	loop = RETRY;
 
 #if defined(CONFIG_SC6600)
@@ -928,7 +928,7 @@ static int __init aedsp16_setup_board(in
 	return TRUE;
 }
 
-static int __init aedsp16_stdcfg(int port) {
+static int __devinit aedsp16_stdcfg(int port) {
 	if (aedsp16_write(port, WRITE_MDIRQ_CFG)) {
 		printk("[AEDSP16] CMD 0x%x: failed!\n", WRITE_MDIRQ_CFG);
 		return FALSE;
@@ -943,7 +943,7 @@ static int __init aedsp16_stdcfg(int por
 	return TRUE;
 }
 
-static int __init aedsp16_dsp_version(int port)
+static int __devinit aedsp16_dsp_version(int port)
 {
 	int             len = 0;
 	int             ret;
@@ -974,7 +974,7 @@ static int __init aedsp16_dsp_version(in
 	return TRUE;
 }
 
-static int __init aedsp16_dsp_copyright(int port)
+static int __devinit aedsp16_dsp_copyright(int port)
 {
 	int             len = 0;
 	int             ret;
@@ -1010,7 +1010,7 @@ static int __init aedsp16_dsp_copyright(
 	return TRUE;
 }
 
-static void __init aedsp16_init_tables(void)
+static void __devinit aedsp16_init_tables(void)
 {
 	int i = 0;
 
@@ -1034,7 +1034,7 @@ static void __init aedsp16_init_tables(v
 		}
 }
 
-static int __init aedsp16_init_board(void)
+static int __devinit aedsp16_init_board(void)
 {
 	aedsp16_init_tables();
 
@@ -1135,7 +1135,7 @@ static int __init aedsp16_init_board(voi
 	return TRUE;
 }
 
-static int __init init_aedsp16_sb(void)
+static int __devinit init_aedsp16_sb(void)
 {
 	DBG(("init_aedsp16_sb: "));
 
@@ -1164,7 +1164,7 @@ static void uninit_aedsp16_sb(void)
 	DBG(("done.\n"));
 }
 
-static int __init init_aedsp16_mss(void)
+static int __devinit init_aedsp16_mss(void)
 {
 	DBG(("init_aedsp16_mss: "));
 
@@ -1210,7 +1210,7 @@ static void uninit_aedsp16_mss(void)
 	DBG(("done.\n"));
 }
 
-static int __init init_aedsp16_mpu(void)
+static int __devinit init_aedsp16_mpu(void)
 {
 	DBG(("init_aedsp16_mpu: "));
 
@@ -1252,7 +1252,7 @@ static void uninit_aedsp16_mpu(void)
 	DBG(("done.\n"));
 }
 
-static int __init init_aedsp16(void)
+static int __devinit init_aedsp16(void)
 {
 	int initialized = FALSE;
 
@@ -1304,12 +1304,12 @@ static void __exit uninit_aedsp16(void)
 		uninit_aedsp16_mpu();
 }
 
-static int __initdata io = -1;
-static int __initdata irq = -1;
-static int __initdata dma = -1;
-static int __initdata mpu_irq = -1;
-static int __initdata mss_base = -1;
-static int __initdata mpu_base = -1;
+static int __devinitdata io = -1;
+static int __devinitdata irq = -1;
+static int __devinitdata dma = -1;
+static int __devinitdata mpu_irq = -1;
+static int __devinitdata mss_base = -1;
+static int __devinitdata mpu_base = -1;
 
 module_param(io, int, 0);
 MODULE_PARM_DESC(io, "I/O base address (0x220 0x240)");
@@ -1327,7 +1327,7 @@ MODULE_AUTHOR("Riccardo Facchetti <fizba
 MODULE_DESCRIPTION("Audio Excel DSP 16 Driver Version " VERSION);
 MODULE_LICENSE("GPL");
 
-static int __init do_init_aedsp16(void) {
+static int __devinit do_init_aedsp16(void) {
 	printk("Audio Excel DSP 16 init driver Copyright (C) Riccardo Facchetti 1995-98\n");
 	if (io == -1 || dma == -1 || irq == -1) {
 		printk(KERN_INFO "aedsp16: I/O, IRQ and DMA are mandatory\n");
@@ -1361,7 +1361,7 @@ module_init(do_init_aedsp16);
 module_exit(cleanup_aedsp16);
 
 #ifndef MODULE
-static int __init setup_aedsp16(char *str)
+static int __devinit setup_aedsp16(char *str)
 {
 	/* io, irq, dma, mss_io, mpu_io, mpu_irq */
 	int ints[7];
diff --git a/sound/oss/ali5455.c b/sound/oss/ali5455.c
--- a/sound/oss/ali5455.c
+++ b/sound/oss/ali5455.c
@@ -3670,7 +3670,7 @@ static struct pci_driver ali_pci_driver 
 #endif				/* CONFIG_PM */
 };
 
-static int __init ali_init_module(void)
+static int __devinit ali_init_module(void)
 {
 	printk(KERN_INFO "ALI 5455 + AC97 Audio, version "
 	       DRIVER_VERSION ", " __TIME__ " " __DATE__ "\n");
diff --git a/sound/oss/au1000.c b/sound/oss/au1000.c
--- a/sound/oss/au1000.c
+++ b/sound/oss/au1000.c
@@ -2172,7 +2172,7 @@ static void au1000_remove(void)
 	unregister_sound_mixer(s->codec.dev_mixer);
 }
 
-static int __init init_au1000(void)
+static int __devinit init_au1000(void)
 {
 	info("stevel@mvista.com, built " __TIME__ " on " __DATE__);
 	return au1000_probe();
@@ -2191,7 +2191,7 @@ module_exit(cleanup_au1000);
 
 #ifndef MODULE
 
-static int __init au1000_setup(char *options)
+static int __devinit au1000_setup(char *options)
 {
 	char           *this_opt;
 
diff --git a/sound/oss/au1550_ac97.c b/sound/oss/au1550_ac97.c
--- a/sound/oss/au1550_ac97.c
+++ b/sound/oss/au1550_ac97.c
@@ -2078,7 +2078,7 @@ au1550_remove(void)
 	ac97_release_codec(s->codec);
 }
 
-static int __init
+static int __devinit
 init_au1550(void)
 {
 	return au1550_probe();
@@ -2095,7 +2095,7 @@ module_exit(cleanup_au1550);
 
 #ifndef MODULE
 
-static int __init
+static int __devinit
 au1550_setup(char *options)
 {
 	char           *this_opt;
diff --git a/sound/oss/awe_wave.c b/sound/oss/awe_wave.c
--- a/sound/oss/awe_wave.c
+++ b/sound/oss/awe_wave.c
@@ -4123,7 +4123,7 @@ static struct mixer_operations awe_mixer
 	.ioctl	= awe_mixer_ioctl,
 };
 
-static void __init attach_mixer(void)
+static void __devinit attach_mixer(void)
 {
 	if ((my_mixerdev = sound_alloc_mixerdev()) >= 0) {
 		mixer_devs[my_mixerdev] = &awe_mixer_operations;
@@ -4589,7 +4589,7 @@ awe_close_dram(void)
 #define UNIQUE_ID2	0x4321
 #define UNIQUE_ID3	0xABCD
 
-static void __init
+static void __devinit
 awe_check_dram(void)
 {
 	if (awe_present) /* already initialized */
@@ -4960,7 +4960,7 @@ static struct midi_operations awe_midi_o
 
 static int my_mididev = -1;
 
-static void __init attach_midiemu(void)
+static void __devinit attach_midiemu(void)
 {
 	if ((my_mididev = sound_alloc_mididev()) < 0)
 		printk ("Sound: Too many midi devices detected\n");
@@ -6005,7 +6005,7 @@ static void awe_dettach_device(void)
 
 /* detect emu8000 chip on the specified address; from VV's guide */
 
-static int __init
+static int __devinit
 awe_detect_base(int addr)
 {
 	setup_ports(addr, 0, 0);
@@ -6019,7 +6019,7 @@ awe_detect_base(int addr)
 	return 1;
 }
 
-static int __init awe_detect_legacy_devices(void)
+static int __devinit awe_detect_legacy_devices(void)
 {
 	int base;
 	for (base = 0x620; base <= 0x680; base += 0x20)
@@ -6082,7 +6082,7 @@ static struct pnp_driver awe_pnp_driver 
 	.remove		= awe_pnp_remove,
 };
 
-static int __init awe_detect_pnp_devices(void)
+static int __devinit awe_detect_pnp_devices(void)
 {
 	int ret;
 
@@ -6097,7 +6097,7 @@ static int __init awe_detect_pnp_devices
  * device / lowlevel (module) interface
  */
 
-static int __init
+static int __devinit
 awe_detect(void)
 {
 	printk(KERN_INFO "AWE32: Probing for WaveTable...\n");
@@ -6113,7 +6113,7 @@ awe_detect(void)
 	return 0;
 }
 
-static int __init attach_awe(void)
+static int __devinit attach_awe(void)
 {
 	return awe_detect() ? 0 : -ENODEV;
 }
@@ -6129,7 +6129,7 @@ module_init(attach_awe);
 module_exit(unload_awe);
 
 #ifndef MODULE
-static int __init setup_awe(char *str)
+static int __devinit setup_awe(char *str)
 {
 	/* io, memsize, isapnp */
 	int ints[4];
diff --git a/sound/oss/bin2hex.c b/sound/oss/bin2hex.c
--- a/sound/oss/bin2hex.c
+++ b/sound/oss/bin2hex.c
@@ -24,7 +24,7 @@ int main( int argc, const char * argv []
     
     varname = argv[1];
     printf( "/* automatically generated by bin2hex */\n" );
-    printf( "static unsigned char %s [] %s =\n{\n", varname , id?"__initdata":"");
+    printf( "static unsigned char %s [] %s =\n{\n", varname , id?"__devinitdata":"");
 
     while ( ( c = getchar( ) ) != EOF )
     {
diff --git a/sound/oss/cmpci.c b/sound/oss/cmpci.c
--- a/sound/oss/cmpci.c
+++ b/sound/oss/cmpci.c
@@ -3363,7 +3363,7 @@ static struct pci_driver cm_driver = {
        .remove	 = __devexit_p(cm_remove)
 };
 
-static int __init init_cmpci(void)
+static int __devinit init_cmpci(void)
 {
 	printk(KERN_INFO "cmpci: version $Revision: 6.82 $ time " __TIME__ " " __DATE__ "\n");
 	return pci_module_init(&cm_driver);
diff --git a/sound/oss/cs4232.c b/sound/oss/cs4232.c
--- a/sound/oss/cs4232.c
+++ b/sound/oss/cs4232.c
@@ -43,7 +43,7 @@
  * 					simple cleanups
  * 	Arnaldo C. de Melo	got rid of attach_uart401
  *	Bartlomiej Zolnierkiewicz
- *				Added some __init/__initdata/__exit
+ *				Added some __devinit/__devinitdata/__exit
  *	Marcus Meissner		Added ISA PnP support.
  */
 
@@ -72,7 +72,7 @@ static void CS_OUT(unsigned char a)
 #define CS_OUT2(a, b)		{CS_OUT(a);CS_OUT(b);}
 #define CS_OUT3(a, b, c)	{CS_OUT(a);CS_OUT(b);CS_OUT(c);}
 
-static int __initdata bss       = 0;
+static int __devinitdata bss       = 0;
 static int mpu_base, mpu_irq;
 static int synth_base, synth_irq;
 static int mpu_detected;
@@ -127,7 +127,7 @@ static void enable_xctrl(int baseio)
         outb(((unsigned char) (ENABLE_PINS | regd)), baseio + INDEX_DATA );
 }
 
-static int __init probe_cs4232(struct address_info *hw_config, int isapnp_configured)
+static int __devinit probe_cs4232(struct address_info *hw_config, int isapnp_configured)
 {
 	int i, n;
 	int base = hw_config->io_base, irq = hw_config->irq;
@@ -348,15 +348,15 @@ static void __devexit unload_cs4232(stru
 static struct address_info cfg;
 static struct address_info cfg_mpu;
 
-static int __initdata io	= -1;
-static int __initdata irq	= -1;
-static int __initdata dma	= -1;
-static int __initdata dma2	= -1;
-static int __initdata mpuio	= -1;
-static int __initdata mpuirq	= -1;
-static int __initdata synthio	= -1;
-static int __initdata synthirq	= -1;
-static int __initdata isapnp	= 1;
+static int __devinitdata io	= -1;
+static int __devinitdata irq	= -1;
+static int __devinitdata dma	= -1;
+static int __devinitdata dma2	= -1;
+static int __devinitdata mpuio	= -1;
+static int __devinitdata mpuirq	= -1;
+static int __devinitdata synthio	= -1;
+static int __devinitdata synthirq	= -1;
+static int __devinitdata isapnp	= 1;
 
 MODULE_DESCRIPTION("CS4232 based soundcard driver"); 
 MODULE_AUTHOR("Hannu Savolainen, Paul Barton-Davis"); 
@@ -438,7 +438,7 @@ static struct pnp_driver cs4232_driver =
 	.remove		= __devexit_p(cs4232_pnp_remove),
 };
 
-static int __init init_cs4232(void)
+static int __devinit init_cs4232(void)
 {
 #ifdef CONFIG_SOUND_WAVEFRONT_MODULE
 	if(synthio == -1)
@@ -495,7 +495,7 @@ module_init(init_cs4232);
 module_exit(cleanup_cs4232);
 
 #ifndef MODULE
-static int __init setup_cs4232(char *str)
+static int __devinit setup_cs4232(char *str)
 {
 	/* io, irq, dma, dma2 mpuio, mpuirq*/
 	int ints[7];
diff --git a/sound/oss/cs4281/cs4281m.c b/sound/oss/cs4281/cs4281m.c
--- a/sound/oss/cs4281/cs4281m.c
+++ b/sound/oss/cs4281/cs4281m.c
@@ -4468,7 +4468,7 @@ static struct pci_driver cs4281_pci_driv
 	.resume	  = CS4281_RESUME_TBL,
 };
 
-static int __init cs4281_init_module(void)
+static int __devinit cs4281_init_module(void)
 {
 	int rtn = 0;
 	CS_DBGOUT(CS_INIT | CS_FUNCTION, 2, printk(KERN_INFO 
diff --git a/sound/oss/cs46xx.c b/sound/oss/cs46xx.c
--- a/sound/oss/cs46xx.c
+++ b/sound/oss/cs46xx.c
@@ -4213,7 +4213,7 @@ static /*const*/ struct file_operations 
 };
 
 /* AC97 codec initialisation. */
-static int __init cs_ac97_init(struct cs_card *card)
+static int __devinit cs_ac97_init(struct cs_card *card)
 {
 	int num_ac97 = 0;
 	int ready_2nd = 0;
@@ -5706,7 +5706,7 @@ static struct pci_driver cs46xx_pci_driv
 	.resume	  = CS46XX_RESUME_TBL,
 };
 
-static int __init cs46xx_init_module(void)
+static int __devinit cs46xx_init_module(void)
 {
 	int rtn = 0;
 	CS_DBGOUT(CS_INIT | CS_FUNCTION, 2, printk(KERN_INFO 
diff --git a/sound/oss/dmasound/dmasound_atari.c b/sound/oss/dmasound/dmasound_atari.c
--- a/sound/oss/dmasound/dmasound_atari.c
+++ b/sound/oss/dmasound/dmasound_atari.c
@@ -820,7 +820,7 @@ static void AtaFree(void *obj, unsigned 
 	atari_stram_free( obj );
 }
 
-static int __init AtaIrqInit(void)
+static int __devinit AtaIrqInit(void)
 {
 	/* Set up timer A. Timer A
 	   will receive a signal upon end of playing from the sound
@@ -1320,7 +1320,7 @@ static irqreturn_t AtaInterrupt(int irq,
 #define RECLEVEL_GAIN_TO_VOXWARE(v)	(((v) * 20 + 2) / 3)
 
 
-static void __init TTMixerInit(void)
+static void __devinit TTMixerInit(void)
 {
 	atari_microwire_cmd(MW_LM1992_VOLUME(0));
 	dmasound.volume_left = 0;
@@ -1331,7 +1331,7 @@ static void __init TTMixerInit(void)
 	atari_microwire_cmd(MW_LM1992_BASS(0));
 }
 
-static void __init FalconMixerInit(void)
+static void __devinit FalconMixerInit(void)
 {
 	dmasound.volume_left = (tt_dmasnd.output_atten & 0xf00) >> 8;
 	dmasound.volume_right = (tt_dmasnd.output_atten & 0xf0) >> 4;
@@ -1565,7 +1565,7 @@ static MACHINE machFalcon = {
 /*** Config & Setup **********************************************************/
 
 
-static int __init dmasound_atari_init(void)
+static int __devinit dmasound_atari_init(void)
 {
 	if (MACH_IS_ATARI && ATARIHW_PRESENT(PCM_8BIT)) {
 	    if (ATARIHW_PRESENT(CODEC)) {
diff --git a/sound/oss/dmasound/dmasound_awacs.c b/sound/oss/dmasound/dmasound_awacs.c
--- a/sound/oss/dmasound/dmasound_awacs.c
+++ b/sound/oss/dmasound/dmasound_awacs.c
@@ -581,7 +581,7 @@ tas_mixer_ioctl(u_int cmd, u_long arg)
 	return rc;
 }
 
-static void __init
+static void __devinit
 tas_init_frame_rates(unsigned int *prop, unsigned int l)
 {
 	int i ;
@@ -624,7 +624,7 @@ static void PMacFree(void *ptr, unsigned
 	kfree(ptr);
 }
 
-static int __init PMacIrqInit(void)
+static int __devinit PMacIrqInit(void)
 {
 	if (awacs)
 		if (request_irq(awacs_irq, pmac_awacs_intr, 0, "Built-in Sound misc", NULL))
@@ -2524,7 +2524,7 @@ static MACHINE machPMac = {
 /* Check for pmac models that we care about in terms of special actions.
 */
 
-void __init
+void __devinit
 set_model(void)
 {
 	/* portables/lap-tops */
@@ -2551,7 +2551,7 @@ set_model(void)
   code that looks for chip properties knows how to go about it.
 */
 
-static struct device_node* __init
+static struct device_node* __devinit
 get_snd_io_node(void)
 {
 	struct device_node *np = NULL;
@@ -2593,7 +2593,7 @@ get_snd_io_node(void)
    we have to deduce the info other ways for these.
 */
 
-static struct device_node* __init
+static struct device_node* __devinit
 get_snd_info_node(struct device_node *io)
 {
 	struct device_node *info;
@@ -2607,7 +2607,7 @@ get_snd_info_node(struct device_node *io
 /* Find out what type of codec we have.
 */
 
-static int __init
+static int __devinit
 get_codec_type(struct device_node *info)
 {
 	/* already set if pre-davbus model and info will be NULL */
@@ -2633,7 +2633,7 @@ get_codec_type(struct device_node *info)
 
 /* find out what type, if any, of expansion card we have
 */
-static void __init
+static void __devinit
 get_expansion_type(void)
 {
 	if (find_devices("perch") != NULL)
@@ -2652,7 +2652,7 @@ get_expansion_type(void)
  *       Set dmasound.mach.max_dsp_rate on the basis of these routines.
 */
 
-static void __init
+static void __devinit
 awacs_init_frame_rates(unsigned int *prop, unsigned int l)
 {
 	int i ;
@@ -2675,7 +2675,7 @@ awacs_init_frame_rates(unsigned int *pro
 	/* else we assume that all the rates are available */
 }
 
-static void __init
+static void __devinit
 burgundy_init_frame_rates(unsigned int *prop, unsigned int l)
 {
 	int temp[9] ;
@@ -2701,7 +2701,7 @@ if (i > 1){
 #endif
 }
 
-static void __init
+static void __devinit
 daca_init_frame_rates(unsigned int *prop, unsigned int l)
 {
 	int temp[9] ;
@@ -2728,7 +2728,7 @@ if (i > 1){
 #endif
 }
 
-static void __init
+static void __devinit
 init_frame_rates(unsigned int *prop, unsigned int l)
 {
 	switch (awacs_revision) {
@@ -2751,7 +2751,7 @@ init_frame_rates(unsigned int *prop, uns
 /* find things/machines that can't do mac-io byteswap
 */
 
-static void __init
+static void __devinit
 set_hw_byteswap(struct device_node *io)
 {
 	struct device_node *mio ;
@@ -2779,7 +2779,7 @@ set_hw_byteswap(struct device_node *io)
 */
 
 int32_t
-__init setup_beep(void)
+__devinit setup_beep(void)
 {
 	/* Initialize beep stuff */
 	/* want one cmd buffer for beeps, and a second one for emergencies
@@ -2816,7 +2816,7 @@ static struct input_dev awacs_beep_dev =
 	},
 };
 
-int __init dmasound_awacs_init(void)
+int __devinit dmasound_awacs_init(void)
 {
 	struct device_node *io = NULL, *info = NULL;
 	int vol, res;
diff --git a/sound/oss/dmasound/dmasound_paula.c b/sound/oss/dmasound/dmasound_paula.c
--- a/sound/oss/dmasound/dmasound_paula.c
+++ b/sound/oss/dmasound/dmasound_paula.c
@@ -327,7 +327,7 @@ static void AmiFree(void *obj, unsigned 
 	amiga_chip_free (obj);
 }
 
-static int __init AmiIrqInit(void)
+static int __devinit AmiIrqInit(void)
 {
 	/* turn off DMA for audio channels */
 	StopDMA();
@@ -606,7 +606,7 @@ static irqreturn_t AmiInterrupt(int irq,
  * /dev/mixer abstraction
  */
 
-static void __init AmiMixerInit(void)
+static void __devinit AmiMixerInit(void)
 {
 	dmasound.volume_left = 64;
 	dmasound.volume_right = 64;
@@ -713,7 +713,7 @@ static MACHINE machAmiga = {
 /*** Config & Setup **********************************************************/
 
 
-int __init dmasound_paula_init(void)
+int __devinit dmasound_paula_init(void)
 {
 	int err;
 
diff --git a/sound/oss/dmasound/dmasound_q40.c b/sound/oss/dmasound/dmasound_q40.c
--- a/sound/oss/dmasound/dmasound_q40.c
+++ b/sound/oss/dmasound/dmasound_q40.c
@@ -368,7 +368,7 @@ static void Q40Free(void *ptr, unsigned 
 	kfree(ptr);
 }
 
-static int __init Q40IrqInit(void)
+static int __devinit Q40IrqInit(void)
 {
 	/* Register interrupt handler. */
 	request_irq(Q40_IRQ_SAMPLE, Q40StereoInterrupt, 0,
@@ -611,7 +611,7 @@ static MACHINE machQ40 = {
 /*** Config & Setup **********************************************************/
 
 
-int __init dmasound_q40_init(void)
+int __devinit dmasound_q40_init(void)
 {
 	if (MACH_IS_Q40) {
 	    dmasound.mach = machQ40;
diff --git a/sound/oss/dmasound/tas_common.c b/sound/oss/dmasound/tas_common.c
--- a/sound/oss/dmasound/tas_common.c
+++ b/sound/oss/dmasound/tas_common.c
@@ -188,7 +188,7 @@ tas_cleanup(void)
 	i2c_del_driver(&tas_driver);
 }
 
-int __init
+int __devinit
 tas_init(int driver_id, const char *driver_name)
 {
 	u32* paddr;
diff --git a/sound/oss/emu10k1/main.c b/sound/oss/emu10k1/main.c
--- a/sound/oss/emu10k1/main.c
+++ b/sound/oss/emu10k1/main.c
@@ -1424,7 +1424,7 @@ static struct pci_driver emu10k1_pci_dri
 	.remove		= __devexit_p(emu10k1_remove),
 };
 
-static int __init emu10k1_init_module(void)
+static int __devinit emu10k1_init_module(void)
 {
 	printk(KERN_INFO "Creative EMU10K1 PCI Audio Driver, version " DRIVER_VERSION ", " __TIME__ " " __DATE__ "\n");
 
diff --git a/sound/oss/es1370.c b/sound/oss/es1370.c
--- a/sound/oss/es1370.c
+++ b/sound/oss/es1370.c
@@ -98,7 +98,7 @@
  *    28.06.1999   0.24  Add pci_set_master
  *    02.08.1999   0.25  Added workaround for the "phantom write" bug first
  *                       documented by Dave Sharpless from Anchor Games
- *    03.08.1999   0.26  adapt to Linus' new __setup/__initcall
+ *    03.08.1999   0.26  adapt to Linus' new __setup/__devinitcall
  *                       added kernel command line option "es1370=joystick[,lineout[,micbias]]"
  *                       removed CONFIG_SOUND_ES1370_JOYPORT_BOOT kludge
  *    12.08.1999   0.27  module_init/__setup fixes
@@ -2776,7 +2776,7 @@ static struct pci_driver es1370_driver =
 	.remove		= __devexit_p(es1370_remove),
 };
 
-static int __init init_es1370(void)
+static int __devinit init_es1370(void)
 {
 	printk(KERN_INFO "es1370: version v0.38 time " __TIME__ " " __DATE__ "\n");
 	return pci_module_init(&es1370_driver);
@@ -2797,9 +2797,9 @@ module_exit(cleanup_es1370);
 
 /* format is: es1370=lineout[,micbias]] */
 
-static int __init es1370_setup(char *str)
+static int __devinit es1370_setup(char *str)
 {
-	static unsigned __initdata nr_dev = 0;
+	static unsigned __devinitdata nr_dev = 0;
 
 	if (nr_dev >= NR_DEVICE)
 		return 0;
diff --git a/sound/oss/es1371.c b/sound/oss/es1371.c
--- a/sound/oss/es1371.c
+++ b/sound/oss/es1371.c
@@ -62,7 +62,7 @@
  *    15.06.1999   0.12  Fix bad allocation bug.
  *                       Thanks to Deti Fliegl <fliegl@in.tum.de>
  *    28.06.1999   0.13  Add pci_set_master
- *    03.08.1999   0.14  adapt to Linus' new __setup/__initcall
+ *    03.08.1999   0.14  adapt to Linus' new __setup/__devinitcall
  *                       added kernel command line option "es1371=joystickaddr"
  *                       removed CONFIG_SOUND_ES1371_JOYPORT_BOOT kludge
  *    10.08.1999   0.15  (Re)added S/PDIF module option for cards revision >= 4.
@@ -3087,7 +3087,7 @@ static struct pci_driver es1371_driver =
 	.remove		= __devexit_p(es1371_remove),
 };
 
-static int __init init_es1371(void)
+static int __devinit init_es1371(void)
 {
 	printk(KERN_INFO PFX "version v0.32 time " __TIME__ " " __DATE__ "\n");
 	return pci_module_init(&es1371_driver);
@@ -3108,9 +3108,9 @@ module_exit(cleanup_es1371);
 
 /* format is: es1371=[spdif,[nomix,[amplifier]]] */
 
-static int __init es1371_setup(char *str)
+static int __devinit es1371_setup(char *str)
 {
-	static unsigned __initdata nr_dev = 0;
+	static unsigned __devinitdata nr_dev = 0;
 
 	if (nr_dev >= NR_DEVICE)
 		return 0;
diff --git a/sound/oss/esssolo1.c b/sound/oss/esssolo1.c
--- a/sound/oss/esssolo1.c
+++ b/sound/oss/esssolo1.c
@@ -2488,7 +2488,7 @@ static struct pci_driver solo1_driver = 
 };
 
 
-static int __init init_solo1(void)
+static int __devinit init_solo1(void)
 {
 	printk(KERN_INFO "solo1: version v0.20 time " __TIME__ " " __DATE__ "\n");
 	return pci_register_driver(&solo1_driver);
diff --git a/sound/oss/forte.c b/sound/oss/forte.c
--- a/sound/oss/forte.c
+++ b/sound/oss/forte.c
@@ -1838,7 +1838,7 @@ forte_proc_read (char *page, char **star
  * Creates driver info entries in /proc
  */
 
-static int __init 
+static int __devinit 
 forte_proc_init (void)
 {
 	if (!proc_mkdir ("driver/forte", NULL))
@@ -1982,7 +1982,7 @@ forte_chip_init (struct forte_chip *chip
  * Description:
  *		Allocates chip instance, I/O region, and IRQ
  */
-static int __init 
+static int __devinit 
 forte_probe (struct pci_dev *pci_dev, const struct pci_device_id *pci_id)
 {
 	struct forte_chip *chip;
@@ -2107,7 +2107,7 @@ static struct pci_driver forte_pci_drive
  *
  */
 
-static int __init
+static int __devinit
 forte_init_module (void)
 {
 	printk (KERN_INFO PFX DRIVER_VERSION "\n");
diff --git a/sound/oss/gus_card.c b/sound/oss/gus_card.c
--- a/sound/oss/gus_card.c
+++ b/sound/oss/gus_card.c
@@ -37,7 +37,7 @@ int             gus_pnp_flag = 0;
 static int      db16;	/* Has a Gus16 AD1848 on it */
 #endif
 
-static void __init attach_gus(struct address_info *hw_config)
+static void __devinit attach_gus(struct address_info *hw_config)
 {
 	gus_wave_init(hw_config);
 
@@ -53,7 +53,7 @@ static void __init attach_gus(struct add
 	return;
 }
 
-static int __init probe_gus(struct address_info *hw_config)
+static int __devinit probe_gus(struct address_info *hw_config)
 {
 	int             irq;
 	int             io_addr;
@@ -160,7 +160,7 @@ irqreturn_t gusintr(int irq, void *dev_i
 
 #ifdef CONFIG_SOUND_GUS16
 
-static int __init init_gus_db16(struct address_info *hw_config)
+static int __devinit init_gus_db16(struct address_info *hw_config)
 {
 	struct resource *ports;
 
@@ -212,11 +212,11 @@ static int no_wave_dma;   /* Set if no d
 
 static struct address_info cfg;
 
-static int __initdata io = -1;
-static int __initdata irq = -1;
-static int __initdata dma = -1;
-static int __initdata dma16 = -1;	/* Set this for modules that need it */
-static int __initdata type = 0;		/* 1 for PnP */
+static int __devinitdata io = -1;
+static int __devinitdata irq = -1;
+static int __devinitdata dma = -1;
+static int __devinitdata dma16 = -1;	/* Set this for modules that need it */
+static int __devinitdata type = 0;		/* 1 for PnP */
 
 module_param(io, int, 0);
 module_param(irq, int, 0);
@@ -232,7 +232,7 @@ module_param(gus16, int, 0);
 #endif
 MODULE_LICENSE("GPL");
 
-static int __init init_gus(void)
+static int __devinit init_gus(void)
 {
 	printk(KERN_INFO "Gravis Ultrasound audio driver Copyright (C) by Hannu Savolainen 1993-1996\n");
 
@@ -274,7 +274,7 @@ module_init(init_gus);
 module_exit(cleanup_gus);
 
 #ifndef MODULE
-static int __init setup_gus(char *str)
+static int __devinit setup_gus(char *str)
 {
 	/* io, irq, dma, dma2 */
 	int ints[5];
diff --git a/sound/oss/gus_midi.c b/sound/oss/gus_midi.c
--- a/sound/oss/gus_midi.c
+++ b/sound/oss/gus_midi.c
@@ -12,7 +12,7 @@
  *
  * Changes:
  * 11-10-2000	Bartlomiej Zolnierkiewicz <bkz@linux-ide.org>
- *		Added __init to gus_midi_init()
+ *		Added __devinit to gus_midi_init()
  */
 
 #include <linux/init.h>
@@ -201,7 +201,7 @@ static struct midi_operations gus_midi_o
 	.buffer_status	= gus_midi_buffer_status,
 };
 
-void __init gus_midi_init(struct address_info *hw_config)
+void __devinit gus_midi_init(struct address_info *hw_config)
 {
 	int dev = sound_alloc_mididev();
 
diff --git a/sound/oss/gus_wave.c b/sound/oss/gus_wave.c
--- a/sound/oss/gus_wave.c
+++ b/sound/oss/gus_wave.c
@@ -14,7 +14,7 @@
  * Thomas Sailer    : ioctl code reworked (vmalloc/vfree removed)
  * Frank van de Pol : Fixed GUS MAX interrupt handling. Enabled simultanious
  *                    usage of CS4231A codec, GUS wave and MIDI for GUS MAX.
- * Bartlomiej Zolnierkiewicz : added some __init/__exit
+ * Bartlomiej Zolnierkiewicz : added some __devinit/__exit
  */
  
 #include <linux/init.h> 
@@ -803,7 +803,7 @@ static void gus_initialize(void)
 }
 
 
-static void __init pnp_mem_init(void)
+static void __devinit pnp_mem_init(void)
 {
 #include "iwmem.h"
 #define CHUNK_SIZE (256*1024)
@@ -972,7 +972,7 @@ static void __init pnp_mem_init(void)
 	gus_write8(0x19, (gus_read8(0x19) | 0x01) & ~0x02);
 }
 
-int __init gus_wave_detect(int baseaddr)
+int __devinit gus_wave_detect(int baseaddr)
 {
 	unsigned long   i, max_mem = 1024L;
 	unsigned long   loc;
@@ -2831,7 +2831,7 @@ static struct mixer_operations gus_mixer
 	.ioctl	= gus_default_mixer_ioctl
 };
 
-static int __init gus_default_mixer_init(void)
+static int __devinit gus_default_mixer_init(void)
 {
 	int n;
 
@@ -2856,7 +2856,7 @@ static int __init gus_default_mixer_init
 	return n;
 }
 
-void __init gus_wave_init(struct address_info *hw_config)
+void __devinit gus_wave_init(struct address_info *hw_config)
 {
 	unsigned long flags;
 	unsigned char val;
diff --git a/sound/oss/hal2.c b/sound/oss/hal2.c
--- a/sound/oss/hal2.c
+++ b/sound/oss/hal2.c
@@ -1516,7 +1516,7 @@ extern void (*indy_volume_button)(int);
  * Assuming only one HAL2 card. Mail me if you ever meet machine with
  * more than one.
  */
-static int __init init_hal2(void)
+static int __devinit init_hal2(void)
 {
 	int i, error;
 
diff --git a/sound/oss/harmony.c b/sound/oss/harmony.c
--- a/sound/oss/harmony.c
+++ b/sound/oss/harmony.c
@@ -220,7 +220,7 @@ static struct harmony_buffer played_buf,
 	} while (0) 
 
 	
-static int __init harmony_alloc_buffer(struct harmony_buffer *b, 
+static int __devinit harmony_alloc_buffer(struct harmony_buffer *b, 
 		unsigned int buffer_count)
 {
 	b->len = buffer_count * HARMONY_BUF_SIZE;
@@ -1183,7 +1183,7 @@ static struct file_operations harmony_mi
  * Mute all the output and reset Harmony.
  */
 
-static void __init harmony_mixer_reset(void)
+static void __devinit harmony_mixer_reset(void)
 {
 	harmony.current_gain = GAIN_TOTAL_SILENCE;
 	harmony_mixer_set_gain();
@@ -1195,7 +1195,7 @@ static void __init harmony_mixer_reset(v
 	harmony_mixer_set_gain();
 }
 
-static int __init harmony_mixer_init(void)
+static int __devinit harmony_mixer_init(void)
 {
 	/* Register the device file operations */
 	harmony.mixer_unit = register_sound_mixer(&harmony_mixer_fops, -1);
@@ -1303,7 +1303,7 @@ static struct parisc_driver harmony_driv
 	.probe		= harmony_driver_probe,
 };
 
-static int __init init_harmony(void)
+static int __devinit init_harmony(void)
 {
 	return register_parisc_driver(&harmony_driver);
 }
diff --git a/sound/oss/hex2hex.c b/sound/oss/hex2hex.c
--- a/sound/oss/hex2hex.c
+++ b/sound/oss/hex2hex.c
@@ -87,7 +87,7 @@ int main( int argc, const char * argv []
 
 	printf("/*\n *\t Computer generated file. Do not edit.\n */\n");
         printf("static int %s_len = %d;\n", varline, l);
-	printf("static unsigned char %s[] %s = {\n", varline, id?"__initdata":"");
+	printf("static unsigned char %s[] %s = {\n", varline, id?"__devinitdata":"");
 
 	for (i=0;i<l;i++)
 	{
diff --git a/sound/oss/i810_audio.c b/sound/oss/i810_audio.c
--- a/sound/oss/i810_audio.c
+++ b/sound/oss/i810_audio.c
@@ -3617,7 +3617,7 @@ static struct pci_driver i810_pci_driver
 };
 
 
-static int __init i810_init_module (void)
+static int __devinit i810_init_module (void)
 {
 	int retval;
 
diff --git a/sound/oss/ics2101.c b/sound/oss/ics2101.c
--- a/sound/oss/ics2101.c
+++ b/sound/oss/ics2101.c
@@ -12,7 +12,7 @@
  *
  *
  * Thomas Sailer   : ioctl code reworked (vmalloc/vfree removed)
- * Bartlomiej Zolnierkiewicz : added __init to ics2101_mixer_init()
+ * Bartlomiej Zolnierkiewicz : added __devinit to ics2101_mixer_init()
  */
 #include <linux/init.h>
 #include <linux/spinlock.h>
@@ -215,7 +215,7 @@ static struct mixer_operations ics2101_m
 	.ioctl	= ics2101_mixer_ioctl
 };
 
-int __init ics2101_mixer_init(void)
+int __devinit ics2101_mixer_init(void)
 {
 	int i;
 	int n;
diff --git a/sound/oss/ite8172.c b/sound/oss/ite8172.c
--- a/sound/oss/ite8172.c
+++ b/sound/oss/ite8172.c
@@ -2203,7 +2203,7 @@ static struct pci_driver it8172_driver =
 	.remove = __devexit_p(it8172_remove)
 };
 
-static int __init init_it8172(void)
+static int __devinit init_it8172(void)
 {
 	info("version v0.5 time " __TIME__ " " __DATE__);
 	return pci_module_init(&it8172_driver);
@@ -2224,10 +2224,10 @@ module_exit(cleanup_it8172);
 
 /* format is: it8172=[spdif],[i2s:<I2S format>] */
 
-static int __init it8172_setup(char *options)
+static int __devinit it8172_setup(char *options)
 {
 	char* this_opt;
-	static unsigned __initdata nr_dev = 0;
+	static unsigned __devinitdata nr_dev = 0;
 
 	if (nr_dev >= NR_DEVICE)
 		return 0;
diff --git a/sound/oss/kahlua.c b/sound/oss/kahlua.c
--- a/sound/oss/kahlua.c
+++ b/sound/oss/kahlua.c
@@ -215,7 +215,7 @@ static struct pci_driver kahlua_driver =
 };
 
 
-static int __init kahlua_init_module(void)
+static int __devinit kahlua_init_module(void)
 {
 	printk(KERN_INFO "Cyrix Kahlua VSA1 XpressAudio support (c) Copyright 2003 Red Hat Inc\n");
 	return pci_module_init(&kahlua_driver);
diff --git a/sound/oss/mad16.c b/sound/oss/mad16.c
--- a/sound/oss/mad16.c
+++ b/sound/oss/mad16.c
@@ -188,7 +188,7 @@ static void mad_write(int port, int valu
 	spin_unlock_irqrestore(&lock,flags);
 }
 
-static int __init detect_c930(void)
+static int __devinit detect_c930(void)
 {
 	unsigned char   tmp = mad_read(MC1_PORT);
 
@@ -261,7 +261,7 @@ static int __init detect_c930(void)
 	return 1;
 }
 
-static int __init detect_mad16(void)
+static int __devinit detect_mad16(void)
 {
 	unsigned char tmp, tmp2, bit;
 	int i, port;
@@ -313,7 +313,7 @@ static int __init detect_mad16(void)
 	return 1;		/* Bingo */
 }
 
-static int __init wss_init(struct address_info *hw_config)
+static int __devinit wss_init(struct address_info *hw_config)
 {
 	/*
 	 * Check if the IO port returns valid signature. The original MS Sound
@@ -340,7 +340,7 @@ static int __init wss_init(struct addres
 	return 1;
 }
 
-static void __init init_c930(struct address_info *hw_config, int base)
+static void __devinit init_c930(struct address_info *hw_config, int base)
 {
 	unsigned char cfg = 0;
 
@@ -376,7 +376,7 @@ static void __init init_c930(struct addr
 	mad_write(MC10_PORT, 0x11);
 }
 
-static int __init chip_detect(void)
+static int __devinit chip_detect(void)
 {
 	int i;
 
@@ -463,7 +463,7 @@ static int __init chip_detect(void)
 	return 0;
 }
 
-static int __init probe_mad16(struct address_info *hw_config)
+static int __devinit probe_mad16(struct address_info *hw_config)
 {
 	int i;
 	unsigned char tmp;
@@ -673,7 +673,7 @@ fail:
 	return 0;
 }
 
-static int __init probe_mad16_mpu(struct address_info *hw_config)
+static int __devinit probe_mad16_mpu(struct address_info *hw_config)
 {
 	unsigned char tmp;
 
@@ -864,18 +864,18 @@ static struct address_info cfg_mpu;
 
 static int found_mpu;
 
-static int __initdata mpu_io = 0;
-static int __initdata mpu_irq = 0;
-static int __initdata io = -1;
-static int __initdata dma = -1;
-static int __initdata dma16 = -1; /* Set this for modules that need it */
-static int __initdata irq = -1;
-static int __initdata cdtype = 0;
-static int __initdata cdirq = 0;
-static int __initdata cdport = 0x340;
-static int __initdata cddma = -1;
-static int __initdata opl4 = 0;
-static int __initdata joystick = 0;
+static int __devinitdata mpu_io = 0;
+static int __devinitdata mpu_irq = 0;
+static int __devinitdata io = -1;
+static int __devinitdata dma = -1;
+static int __devinitdata dma16 = -1; /* Set this for modules that need it */
+static int __devinitdata irq = -1;
+static int __devinitdata cdtype = 0;
+static int __devinitdata cdirq = 0;
+static int __devinitdata cdport = 0x340;
+static int __devinitdata cddma = -1;
+static int __devinitdata opl4 = 0;
+static int __devinitdata joystick = 0;
 
 module_param(mpu_io, int, 0);
 module_param(mpu_irq, int, 0);
@@ -891,13 +891,13 @@ module_param(opl4, int, 0);
 module_param(joystick, bool, 0);
 module_param(debug, bool, 0644);
 
-static int __initdata dma_map[2][8] =
+static int __devinitdata dma_map[2][8] =
 {
 	{0x03, -1, -1, -1, -1, 0x00, 0x01, 0x02},
 	{0x03, -1, 0x01, 0x00, -1, -1, -1, -1}
 };
 
-static int __initdata irq_map[16] =
+static int __devinitdata irq_map[16] =
 {
 	0x00, -1, -1, 0x0A,
 	-1, 0x04, -1, 0x08,
@@ -1090,7 +1090,7 @@ module_init(init_mad16);
 module_exit(cleanup_mad16);
 
 #ifndef MODULE
-static int __init setup_mad16(char *str)
+static int __devinit setup_mad16(char *str)
 {
 	/* io, irq */
 	int ints[8];
diff --git a/sound/oss/maestro.c b/sound/oss/maestro.c
--- a/sound/oss/maestro.c
+++ b/sound/oss/maestro.c
@@ -124,7 +124,7 @@
  *  (still kind of v0.14) Nov 23 - Alan Cox <alan@redhat.com>
  *	Add clocking= for people with seriously warped hardware
  *  (still v0.14) Nov 10 2000 - Bartlomiej Zolnierkiewicz <bkz@linux-ide.org>
- *	add __init to maestro_ac97_init() and maestro_install()
+ *	add __devinit to maestro_ac97_init() and maestro_install()
  *  (still based on v0.14) Mar 29 2000 - Zach Brown <zab@redhat.com>
  *	move to 2.3 power management interface, which
  *		required hacking some suspend/resume/check paths 
@@ -832,7 +832,7 @@ ac97_recmask_io(struct ess_card *card, i
  *	The PT101 setup is untested.
  */
  
-static u16 __init maestro_ac97_init(struct ess_card *card)
+static u16 __devinit maestro_ac97_init(struct ess_card *card)
 {
 	u16 vend1, vend2, caps;
 
@@ -3394,7 +3394,7 @@ parse_power(struct ess_card *card, struc
 	return card->power_regs ? 1 : 0;
 }
 
-static int __init
+static int __devinit
 maestro_probe(struct pci_dev *pcidev,const struct pci_device_id *pdid)
 {
 	int card_type = pdid->driver_data;
@@ -3629,7 +3629,7 @@ static struct pci_driver maestro_pci_dri
 	.remove	  = maestro_remove,
 };
 
-static int __init init_maestro(void)
+static int __devinit init_maestro(void)
 {
 	int rc;
 
diff --git a/sound/oss/maestro3.c b/sound/oss/maestro3.c
--- a/sound/oss/maestro3.c
+++ b/sound/oss/maestro3.c
@@ -2933,7 +2933,7 @@ static struct pci_driver m3_pci_driver =
 	.resume	  = m3_resume,
 };
 
-static int __init m3_init_module(void)
+static int __devinit m3_init_module(void)
 {
     printk(KERN_INFO PFX "version " DRIVER_VERSION " built at " __TIME__ " " __DATE__ "\n");
 
diff --git a/sound/oss/maui.c b/sound/oss/maui.c
--- a/sound/oss/maui.c
+++ b/sound/oss/maui.c
@@ -15,7 +15,7 @@
  *					system
  *		Christoph Hellwig	Adapted to module_init/module_exit
  *		Bartlomiej Zolnierkiewicz
- *					Added __init to download_code()
+ *					Added __devinit to download_code()
  *
  *	Status:
  *		Andrew J. Kroll		Tested 06/01/1999 with:
@@ -108,7 +108,7 @@ static irqreturn_t mauiintr(int irq, voi
 	return IRQ_HANDLED;
 }
 
-static int __init download_code(void)
+static int __devinit download_code(void)
 {
 	int i, lines = 0;
 	int eol_seen = 0, done = 0;
@@ -170,7 +170,7 @@ failure:
 	return 0;
 }
 
-static int __init maui_init(int irq)
+static int __devinit maui_init(int irq)
 {
 	unsigned char bits;
 
@@ -299,7 +299,7 @@ static int maui_load_patch(int dev, int 
 	return 0;
 }
 
-static int __init probe_maui(struct address_info *hw_config)
+static int __devinit probe_maui(struct address_info *hw_config)
 {
 	struct resource *ports;
 	int this_dev;
@@ -417,8 +417,8 @@ static int fw_load;
 
 static struct address_info cfg;
 
-static int __initdata io = -1;
-static int __initdata irq = -1;
+static int __devinitdata io = -1;
+static int __devinitdata irq = -1;
 
 module_param(io, int, 0);
 module_param(irq, int, 0);
@@ -427,7 +427,7 @@ module_param(irq, int, 0);
  *	Install a Maui card. Needs mpu401 loaded already.
  */
 
-static int __init init_maui(void)
+static int __devinit init_maui(void)
 {
 	printk(KERN_INFO "Turtle beach Maui and Tropez driver, Copyright (C) by Hannu Savolainen 1993-1996\n");
 
@@ -460,7 +460,7 @@ module_init(init_maui);
 module_exit(cleanup_maui);
 
 #ifndef MODULE
-static int __init setup_maui(char *str)
+static int __devinit setup_maui(char *str)
 {
         /* io, irq */
 	int ints[3];
diff --git a/sound/oss/mpu401.c b/sound/oss/mpu401.c
--- a/sound/oss/mpu401.c
+++ b/sound/oss/mpu401.c
@@ -13,7 +13,7 @@
  *
  * Thomas Sailer	ioctl code reworked (vmalloc/vfree removed)
  * Alan Cox		modularisation, use normal request_irq, use dev_id
- * Bartlomiej Zolnierkiewicz	removed some __init to allow using many drivers
+ * Bartlomiej Zolnierkiewicz	removed some __devinit to allow using many drivers
  * Chris Rankin		Update the module-usage counter for the coprocessor
  * Zwane Mwaikambo	Changed attach/unload resource freeing
  */
@@ -1772,7 +1772,7 @@ static int irq = -1;
 module_param(irq, int, 0);
 module_param(io, int, 0);
 
-static int __init init_mpu401(void)
+static int __devinit init_mpu401(void)
 {
 	int ret;
 	/* Can be loaded either for module use or to provide functions
@@ -1807,7 +1807,7 @@ module_init(init_mpu401);
 module_exit(cleanup_mpu401);
 
 #ifndef MODULE
-static int __init setup_mpu401(char *str)
+static int __devinit setup_mpu401(char *str)
 {
         /* io, irq */
 	int ints[3];
diff --git a/sound/oss/msnd.c b/sound/oss/msnd.c
--- a/sound/oss/msnd.c
+++ b/sound/oss/msnd.c
@@ -48,7 +48,7 @@
 static multisound_dev_t		*devs[MSND_MAX_DEVS];
 static int			num_devs;
 
-int __init msnd_register(multisound_dev_t *dev)
+int __devinit msnd_register(multisound_dev_t *dev)
 {
 	int i;
 
diff --git a/sound/oss/msnd_pinnacle.c b/sound/oss/msnd_pinnacle.c
--- a/sound/oss/msnd_pinnacle.c
+++ b/sound/oss/msnd_pinnacle.c
@@ -1137,7 +1137,7 @@ static int reset_dsp(void)
 	return -EIO;
 }
 
-static int __init probe_multisound(void)
+static int __devinit probe_multisound(void)
 {
 #ifndef MSND_CLASSIC
 	char *xv, *rev = NULL;
@@ -1267,7 +1267,7 @@ static int init_sma(void)
 	return 0;
 }
 
-static int __init calibrate_adc(WORD srate)
+static int __devinit calibrate_adc(WORD srate)
 {
 	writew(srate, dev.SMA + SMA_wCalFreqAtoD);
 	if (dev.calibrate_signal == 0)
@@ -1389,7 +1389,7 @@ static int dsp_full_reset(void)
 	return rv;
 }
 
-static int __init attach_multisound(void)
+static int __devinit attach_multisound(void)
 {
 	int err;
 
@@ -1453,7 +1453,7 @@ static void __exit unload_multisound(voi
 
 /* Pinnacle/Fiji Logical Device Configuration */
 
-static int __init msnd_write_cfg(int cfg, int reg, int value)
+static int __devinit msnd_write_cfg(int cfg, int reg, int value)
 {
 	msnd_outb(reg, cfg);
 	msnd_outb(value, cfg + 1);
@@ -1464,7 +1464,7 @@ static int __init msnd_write_cfg(int cfg
 	return 0;
 }
 
-static int __init msnd_write_cfg_io0(int cfg, int num, WORD io)
+static int __devinit msnd_write_cfg_io0(int cfg, int num, WORD io)
 {
 	if (msnd_write_cfg(cfg, IREG_LOGDEVICE, num))
 		return -EIO;
@@ -1475,7 +1475,7 @@ static int __init msnd_write_cfg_io0(int
 	return 0;
 }
 
-static int __init msnd_write_cfg_io1(int cfg, int num, WORD io)
+static int __devinit msnd_write_cfg_io1(int cfg, int num, WORD io)
 {
 	if (msnd_write_cfg(cfg, IREG_LOGDEVICE, num))
 		return -EIO;
@@ -1486,7 +1486,7 @@ static int __init msnd_write_cfg_io1(int
 	return 0;
 }
 
-static int __init msnd_write_cfg_irq(int cfg, int num, WORD irq)
+static int __devinit msnd_write_cfg_irq(int cfg, int num, WORD irq)
 {
 	if (msnd_write_cfg(cfg, IREG_LOGDEVICE, num))
 		return -EIO;
@@ -1497,7 +1497,7 @@ static int __init msnd_write_cfg_irq(int
 	return 0;
 }
 
-static int __init msnd_write_cfg_mem(int cfg, int num, int mem)
+static int __devinit msnd_write_cfg_mem(int cfg, int num, int mem)
 {
 	WORD wmem;
 
@@ -1515,7 +1515,7 @@ static int __init msnd_write_cfg_mem(int
 	return 0;
 }
 
-static int __init msnd_activate_logical(int cfg, int num)
+static int __devinit msnd_activate_logical(int cfg, int num)
 {
 	if (msnd_write_cfg(cfg, IREG_LOGDEVICE, num))
 		return -EIO;
@@ -1524,7 +1524,7 @@ static int __init msnd_activate_logical(
 	return 0;
 }
 
-static int __init msnd_write_cfg_logical(int cfg, int num, WORD io0, WORD io1, WORD irq, int mem)
+static int __devinit msnd_write_cfg_logical(int cfg, int num, WORD io0, WORD io1, WORD irq, int mem)
 {
 	if (msnd_write_cfg(cfg, IREG_LOGDEVICE, num))
 		return -EIO;
@@ -1546,7 +1546,7 @@ typedef struct msnd_pinnacle_cfg_device 
 	int mem;
 } msnd_pinnacle_cfg_t[4];
 
-static int __init msnd_pinnacle_cfg_devices(int cfg, int reset, msnd_pinnacle_cfg_t device)
+static int __devinit msnd_pinnacle_cfg_devices(int cfg, int reset, msnd_pinnacle_cfg_t device)
 {
 	int i;
 
@@ -1603,44 +1603,44 @@ MODULE_AUTHOR				("Andrew Veliath <andre
 MODULE_DESCRIPTION			("Turtle Beach " LONGNAME " Linux Driver");
 MODULE_LICENSE("GPL");
 
-static int io __initdata =		-1;
-static int irq __initdata =		-1;
-static int mem __initdata =		-1;
-static int write_ndelay __initdata =	-1;
+static int io __devinitdata =		-1;
+static int irq __devinitdata =		-1;
+static int mem __devinitdata =		-1;
+static int write_ndelay __devinitdata =	-1;
 
 #ifndef MSND_CLASSIC
 /* Pinnacle/Fiji non-PnP Config Port */
-static int cfg __initdata =		-1;
+static int cfg __devinitdata =		-1;
 
 /* Extra Peripheral Configuration */
-static int reset __initdata = 0;
-static int mpu_io __initdata = 0;
-static int mpu_irq __initdata = 0;
-static int ide_io0 __initdata = 0;
-static int ide_io1 __initdata = 0;
-static int ide_irq __initdata = 0;
-static int joystick_io __initdata = 0;
+static int reset __devinitdata = 0;
+static int mpu_io __devinitdata = 0;
+static int mpu_irq __devinitdata = 0;
+static int ide_io0 __devinitdata = 0;
+static int ide_io1 __devinitdata = 0;
+static int ide_irq __devinitdata = 0;
+static int joystick_io __devinitdata = 0;
 
 /* If we have the digital daugherboard... */
-static int digital __initdata = 0;
+static int digital __devinitdata = 0;
 #endif
 
-static int fifosize __initdata =	DEFFIFOSIZE;
-static int calibrate_signal __initdata = 0;
+static int fifosize __devinitdata =	DEFFIFOSIZE;
+static int calibrate_signal __devinitdata = 0;
 
 #else /* not a module */
 
-static int write_ndelay __initdata =	-1;
+static int write_ndelay __devinitdata =	-1;
 
 #ifdef MSND_CLASSIC
-static int io __initdata =		CONFIG_MSNDCLAS_IO;
-static int irq __initdata =		CONFIG_MSNDCLAS_IRQ;
-static int mem __initdata =		CONFIG_MSNDCLAS_MEM;
+static int io __devinitdata =		CONFIG_MSNDCLAS_IO;
+static int irq __devinitdata =		CONFIG_MSNDCLAS_IRQ;
+static int mem __devinitdata =		CONFIG_MSNDCLAS_MEM;
 #else /* Pinnacle/Fiji */
 
-static int io __initdata =		CONFIG_MSNDPIN_IO;
-static int irq __initdata =		CONFIG_MSNDPIN_IRQ;
-static int mem __initdata =		CONFIG_MSNDPIN_MEM;
+static int io __devinitdata =		CONFIG_MSNDPIN_IO;
+static int irq __devinitdata =		CONFIG_MSNDPIN_IRQ;
+static int mem __devinitdata =		CONFIG_MSNDPIN_MEM;
 
 /* Pinnacle/Fiji non-PnP Config Port */
 #ifdef CONFIG_MSNDPIN_NONPNP
@@ -1653,7 +1653,7 @@ static int mem __initdata =		CONFIG_MSND
 #  endif
 #  define CONFIG_MSNDPIN_CFG		-1
 #endif
-static int cfg __initdata =		CONFIG_MSNDPIN_CFG;
+static int cfg __devinitdata =		CONFIG_MSNDPIN_CFG;
 /* If not a module, we don't need to bother with reset=1 */
 static int reset;
 
@@ -1661,51 +1661,51 @@ static int reset;
 #ifndef CONFIG_MSNDPIN_MPU_IO
 #  define CONFIG_MSNDPIN_MPU_IO		0
 #endif
-static int mpu_io __initdata =		CONFIG_MSNDPIN_MPU_IO;
+static int mpu_io __devinitdata =		CONFIG_MSNDPIN_MPU_IO;
 
 #ifndef CONFIG_MSNDPIN_MPU_IRQ
 #  define CONFIG_MSNDPIN_MPU_IRQ	0
 #endif
-static int mpu_irq __initdata =		CONFIG_MSNDPIN_MPU_IRQ;
+static int mpu_irq __devinitdata =		CONFIG_MSNDPIN_MPU_IRQ;
 
 #ifndef CONFIG_MSNDPIN_IDE_IO0
 #  define CONFIG_MSNDPIN_IDE_IO0	0
 #endif
-static int ide_io0 __initdata =		CONFIG_MSNDPIN_IDE_IO0;
+static int ide_io0 __devinitdata =		CONFIG_MSNDPIN_IDE_IO0;
 
 #ifndef CONFIG_MSNDPIN_IDE_IO1
 #  define CONFIG_MSNDPIN_IDE_IO1	0
 #endif
-static int ide_io1 __initdata =		CONFIG_MSNDPIN_IDE_IO1;
+static int ide_io1 __devinitdata =		CONFIG_MSNDPIN_IDE_IO1;
 
 #ifndef CONFIG_MSNDPIN_IDE_IRQ
 #  define CONFIG_MSNDPIN_IDE_IRQ	0
 #endif
-static int ide_irq __initdata =		CONFIG_MSNDPIN_IDE_IRQ;
+static int ide_irq __devinitdata =		CONFIG_MSNDPIN_IDE_IRQ;
 
 #ifndef CONFIG_MSNDPIN_JOYSTICK_IO
 #  define CONFIG_MSNDPIN_JOYSTICK_IO	0
 #endif
-static int joystick_io __initdata =	CONFIG_MSNDPIN_JOYSTICK_IO;
+static int joystick_io __devinitdata =	CONFIG_MSNDPIN_JOYSTICK_IO;
 
 /* Have SPDIF (Digital) Daughterboard */
 #ifndef CONFIG_MSNDPIN_DIGITAL
 #  define CONFIG_MSNDPIN_DIGITAL	0
 #endif
-static int digital __initdata =		CONFIG_MSNDPIN_DIGITAL;
+static int digital __devinitdata =		CONFIG_MSNDPIN_DIGITAL;
 
 #endif /* MSND_CLASSIC */
 
 #ifndef CONFIG_MSND_FIFOSIZE
 #  define CONFIG_MSND_FIFOSIZE		DEFFIFOSIZE
 #endif
-static int fifosize __initdata =	CONFIG_MSND_FIFOSIZE;
+static int fifosize __devinitdata =	CONFIG_MSND_FIFOSIZE;
 
 #ifndef CONFIG_MSND_CALSIGNAL
 #  define CONFIG_MSND_CALSIGNAL		0
 #endif
 static int
-calibrate_signal __initdata =		CONFIG_MSND_CALSIGNAL;
+calibrate_signal __devinitdata =		CONFIG_MSND_CALSIGNAL;
 #endif /* MODULE */
 
 module_param				(io, int, 0);
@@ -1726,7 +1726,7 @@ module_param				(ide_irq, int, 0);
 module_param				(joystick_io, int, 0);
 #endif
 
-static int __init msnd_init(void)
+static int __devinit msnd_init(void)
 {
 	int err;
 #ifndef MSND_CLASSIC
diff --git a/sound/oss/nec_vrc5477.c b/sound/oss/nec_vrc5477.c
--- a/sound/oss/nec_vrc5477.c
+++ b/sound/oss/nec_vrc5477.c
@@ -2042,7 +2042,7 @@ static struct pci_driver vrc5477_ac97_dr
 	.remove		= __devexit_p(vrc5477_ac97_remove)
 };
 
-static int __init init_vrc5477_ac97(void)
+static int __devinit init_vrc5477_ac97(void)
 {
 	printk("Vrc5477 AC97 driver: version v0.2 time " __TIME__ " " __DATE__ " by Jun Sun\n");
 	return pci_module_init(&vrc5477_ac97_driver);
diff --git a/sound/oss/nm256_audio.c b/sound/oss/nm256_audio.c
--- a/sound/oss/nm256_audio.c
+++ b/sound/oss/nm256_audio.c
@@ -14,7 +14,7 @@
  *
  * Changes:
  * 11-10-2000	Bartlomiej Zolnierkiewicz <bkz@linux-ide.org>
- *		Added some __init
+ *		Added some __devinit
  * 19-04-2001	Marcus Meissner <mm@caldera.de>
  *		Ported to 2.4 PCI API.
  */
@@ -962,7 +962,7 @@ static struct ac97_mixer_value_list mixe
 
 
 /* Installs the AC97 mixer into CARD.  */
-static int __init
+static int __devinit
 nm256_install_mixer (struct nm256_info *card)
 {
     int mixer;
@@ -1006,7 +1006,7 @@ nm256_full_reset (struct nm256_info *car
  * RAM.
  */
 
-static void __init
+static void __devinit
 nm256_peek_for_sig (struct nm256_info *card)
 {
     u32 port1offset 
@@ -1686,7 +1686,7 @@ module_param(buffertop, int, 0);
 module_param(nm256_debug, bool, 0644);
 module_param(force_load, bool, 0);
 
-static int __init do_init_nm256(void)
+static int __devinit do_init_nm256(void)
 {
     printk (KERN_INFO "NeoMagic 256AV/256ZX audio driver, version 1.1p\n");
     return pci_module_init(&nm256_pci_driver);
diff --git a/sound/oss/opl3.c b/sound/oss/opl3.c
--- a/sound/oss/opl3.c
+++ b/sound/oss/opl3.c
@@ -1204,7 +1204,7 @@ static int io = -1;
 
 module_param(io, int, 0);
 
-static int __init init_opl3 (void)
+static int __devinit init_opl3 (void)
 {
 	printk(KERN_INFO "YM3812 and OPL-3 driver Copyright (C) by Hannu Savolainen, Rob Hooft 1993-1996\n");
 
@@ -1240,7 +1240,7 @@ module_init(init_opl3);
 module_exit(cleanup_opl3);
 
 #ifndef MODULE
-static int __init setup_opl3(char *str)
+static int __devinit setup_opl3(char *str)
 {
         /* io  */
 	int ints[2];
diff --git a/sound/oss/opl3sa.c b/sound/oss/opl3sa.c
--- a/sound/oss/opl3sa.c
+++ b/sound/oss/opl3sa.c
@@ -63,7 +63,7 @@ static void opl3sa_write(int addr, int d
 	spin_unlock_irqrestore(&lock,flags);
 }
 
-static int __init opl3sa_detect(void)
+static int __devinit opl3sa_detect(void)
 {
 	int tmp;
 
@@ -103,7 +103,7 @@ static int __init opl3sa_detect(void)
  *     OPL3-SA
  */
 
-static int __init probe_opl3sa_wss(struct address_info *hw_config, struct resource *ports)
+static int __devinit probe_opl3sa_wss(struct address_info *hw_config, struct resource *ports)
 {
 	unsigned char tmp = 0x24;	/* WSS enable */
 
@@ -143,7 +143,7 @@ static int __init probe_opl3sa_wss(struc
 	return probe_ms_sound(hw_config, ports);
 }
 
-static void __init attach_opl3sa_wss(struct address_info *hw_config, struct resource *ports)
+static void __devinit attach_opl3sa_wss(struct address_info *hw_config, struct resource *ports)
 {
 	int nm = num_mixers;
 
@@ -158,7 +158,7 @@ static void __init attach_opl3sa_wss(str
 }
 
 
-static int __init probe_opl3sa_mpu(struct address_info *hw_config)
+static int __devinit probe_opl3sa_mpu(struct address_info *hw_config)
 {
 	unsigned char conf;
 	static signed char irq_bits[] = {
@@ -238,12 +238,12 @@ static int found_mpu;
 static struct address_info cfg;
 static struct address_info cfg_mpu;
 
-static int __initdata io	= -1;
-static int __initdata irq	= -1;
-static int __initdata dma	= -1;
-static int __initdata dma2	= -1;
-static int __initdata mpu_io	= -1;
-static int __initdata mpu_irq	= -1;
+static int __devinitdata io	= -1;
+static int __devinitdata irq	= -1;
+static int __devinitdata dma	= -1;
+static int __devinitdata dma2	= -1;
+static int __devinitdata mpu_io	= -1;
+static int __devinitdata mpu_irq	= -1;
 
 module_param(io, int, 0);
 module_param(irq, int, 0);
@@ -252,7 +252,7 @@ module_param(dma2, int, 0);
 module_param(mpu_io, int, 0);
 module_param(mpu_irq, int, 0);
 
-static int __init init_opl3sa(void)
+static int __devinit init_opl3sa(void)
 {
 	struct resource *ports;
 	if (io == -1 || irq == -1 || dma == -1) {
@@ -307,7 +307,7 @@ module_init(init_opl3sa);
 module_exit(cleanup_opl3sa);
 
 #ifndef MODULE
-static int __init setup_opl3sa(char *str)
+static int __devinit setup_opl3sa(char *str)
 {
 	/* io, irq, dma, dma2, mpu_io, mpu_irq */
 	int ints[7];
diff --git a/sound/oss/opl3sa2.c b/sound/oss/opl3sa2.c
--- a/sound/oss/opl3sa2.c
+++ b/sound/oss/opl3sa2.c
@@ -163,25 +163,25 @@ static opl3sa2_state_t opl3sa2_state[OPL
 	
 
 /* Our parameters */
-static int __initdata io	= -1;
-static int __initdata mss_io	= -1;
-static int __initdata mpu_io	= -1;
-static int __initdata irq	= -1;
-static int __initdata dma	= -1;
-static int __initdata dma2	= -1;
-static int __initdata ymode	= -1;
-static int __initdata loopback	= -1;
+static int __devinitdata io	= -1;
+static int __devinitdata mss_io	= -1;
+static int __devinitdata mpu_io	= -1;
+static int __devinitdata irq	= -1;
+static int __devinitdata dma	= -1;
+static int __devinitdata dma2	= -1;
+static int __devinitdata ymode	= -1;
+static int __devinitdata loopback	= -1;
 
 #ifdef CONFIG_PNP
 /* PnP specific parameters */
-static int __initdata isapnp = 1;
-static int __initdata multiple = 1;
+static int __devinitdata isapnp = 1;
+static int __devinitdata multiple = 1;
 
 /* Whether said devices have been activated */
 static int opl3sa2_activated[OPL3SA2_CARDS_MAX];
 #else
-static int __initdata isapnp; /* = 0 */
-static int __initdata multiple; /* = 0 */
+static int __devinitdata isapnp; /* = 0 */
+static int __devinitdata multiple; /* = 0 */
 #endif
 
 MODULE_DESCRIPTION("Module for OPL3-SA2 and SA3 sound cards (uses AD1848 MSS driver).");
@@ -542,7 +542,7 @@ static inline void __exit unload_opl3sa2
 }
 
 
-static void __init attach_opl3sa2_mss(struct address_info* hw_config, struct resource *ports)
+static void __devinit attach_opl3sa2_mss(struct address_info* hw_config, struct resource *ports)
 {
 	int initial_mixers;
 
@@ -569,7 +569,7 @@ static inline void __exit unload_opl3sa2
 }
 
 
-static int __init probe_opl3sa2(struct address_info* hw_config, int card)
+static int __devinit probe_opl3sa2(struct address_info* hw_config, int card)
 {
 	unsigned char misc;
 	unsigned char tmp;
@@ -664,7 +664,7 @@ out_nodev:
 }
 
 
-static void __init attach_opl3sa2(struct address_info* hw_config, int card)
+static void __devinit attach_opl3sa2(struct address_info* hw_config, int card)
 {
 	/* Initialize IRQ configuration to IRQ-B: -, IRQ-A: WSS+MPU+OPL3 */
 	opl3sa2_write(hw_config->io_base, OPL3SA2_IRQ_CONFIG, 0x0d);
@@ -681,7 +681,7 @@ static void __init attach_opl3sa2(struct
 }
 
 
-static void __init attach_opl3sa2_mixer(struct address_info *hw_config, int card)
+static void __devinit attach_opl3sa2_mixer(struct address_info *hw_config, int card)
 {
 	struct mixer_operations* mixer_operations;
 	opl3sa2_state_t* devc = &opl3sa2_state[card];
@@ -721,7 +721,7 @@ static void opl3sa2_clear_slots(struct a
 }
 
 
-static void __init opl3sa2_set_ymode(struct address_info* hw_config, int ymode)
+static void __devinit opl3sa2_set_ymode(struct address_info* hw_config, int ymode)
 {
 	/*
 	 * Set the Yamaha 3D enhancement mode (aka Ymersion) if asked to and
@@ -745,7 +745,7 @@ static void __init opl3sa2_set_ymode(str
 }
 
 
-static void __init opl3sa2_set_loopback(struct address_info* hw_config, int loopback)
+static void __devinit opl3sa2_set_loopback(struct address_info* hw_config, int loopback)
 {
 	if(loopback >= 0 && loopback <= 1) {
 		unsigned char misc;
@@ -913,7 +913,7 @@ static int opl3sa2_pm_callback(struct pm
  *
  * Need to have ad1848 and mpu401 loaded ready.
  */
-static int __init init_opl3sa2(void)
+static int __devinit init_opl3sa2(void)
 {
 	int card, max;
 
@@ -1100,7 +1100,7 @@ module_init(init_opl3sa2);
 module_exit(cleanup_opl3sa2);
 
 #ifndef MODULE
-static int __init setup_opl3sa2(char *str)
+static int __devinit setup_opl3sa2(char *str)
 {
 	/* io, irq, dma, dma2,... */
 #ifdef CONFIG_PNP
diff --git a/sound/oss/pas2_card.c b/sound/oss/pas2_card.c
--- a/sound/oss/pas2_card.c
+++ b/sound/oss/pas2_card.c
@@ -135,7 +135,7 @@ int pas_remove_intr(int mask)
 
 /******************* Begin of the Initialization Code ******************/
 
-static int __init config_pas_hw(struct address_info *hw_config)
+static int __devinit config_pas_hw(struct address_info *hw_config)
 {
 	char            ok = 1;
 	unsigned        int_ptrs;	/* scsi/sound interrupt pointers */
@@ -284,7 +284,7 @@ static int __init config_pas_hw(struct a
 	return ok;
 }
 
-static int __init detect_pas_hw(struct address_info *hw_config)
+static int __devinit detect_pas_hw(struct address_info *hw_config)
 {
 	unsigned char   board_id, foo;
 
@@ -325,7 +325,7 @@ static int __init detect_pas_hw(struct a
 	return pas_model;
 }
 
-static void __init attach_pas_card(struct address_info *hw_config)
+static void __devinit attach_pas_card(struct address_info *hw_config)
 {
 	pas_irq = hw_config->irq;
 
@@ -350,7 +350,7 @@ static void __init attach_pas_card(struc
 	}
 }
 
-static inline int __init probe_pas(struct address_info *hw_config)
+static inline int __devinit probe_pas(struct address_info *hw_config)
 {
 	return detect_pas_hw(hw_config);
 }
@@ -373,15 +373,15 @@ static void __exit unload_pas(struct add
 		sound_unload_audiodev(pas_audiodev);
 }
 
-static int __initdata io	= -1;
-static int __initdata irq	= -1;
-static int __initdata dma	= -1;
-static int __initdata dma16	= -1;	/* Set this for modules that need it */
-
-static int __initdata sb_io	= 0;
-static int __initdata sb_irq	= -1;
-static int __initdata sb_dma	= -1;
-static int __initdata sb_dma16	= -1;
+static int __devinitdata io	= -1;
+static int __devinitdata irq	= -1;
+static int __devinitdata dma	= -1;
+static int __devinitdata dma16	= -1;	/* Set this for modules that need it */
+
+static int __devinitdata sb_io	= 0;
+static int __devinitdata sb_irq	= -1;
+static int __devinitdata sb_dma	= -1;
+static int __devinitdata sb_dma16	= -1;
 
 module_param(io, int, 0);
 module_param(irq, int, 0);
@@ -399,7 +399,7 @@ module_param(broken_bus_clock, bool, 0);
 
 MODULE_LICENSE("GPL");
 
-static int __init init_pas2(void)
+static int __devinit init_pas2(void)
 {
 	printk(KERN_INFO "Pro Audio Spectrum driver Copyright (C) by Hannu Savolainen 1993-1996\n");
 
@@ -434,7 +434,7 @@ module_init(init_pas2);
 module_exit(cleanup_pas2);
 
 #ifndef MODULE
-static int __init setup_pas2(char *str)
+static int __devinit setup_pas2(char *str)
 {
 	/* io, irq, dma, dma2, sb_io, sb_irq, sb_dma, sb_dma2 */
 	int ints[9];
diff --git a/sound/oss/pas2_midi.c b/sound/oss/pas2_midi.c
--- a/sound/oss/pas2_midi.c
+++ b/sound/oss/pas2_midi.c
@@ -10,7 +10,7 @@
  * Version 2 (June 1991). See the "COPYING" file distributed with this software
  * for more info.
  *
- * Bartlomiej Zolnierkiewicz	: Added __init to pas_init_mixer()
+ * Bartlomiej Zolnierkiewicz	: Added __devinit to pas_init_mixer()
  */
 
 #include <linux/init.h>
@@ -207,7 +207,7 @@ static struct midi_operations pas_midi_o
 	.buffer_status	= pas_buffer_status,
 };
 
-void __init pas_midi_init(void)
+void __devinit pas_midi_init(void)
 {
 	int dev = sound_alloc_mididev();
 
diff --git a/sound/oss/pas2_mixer.c b/sound/oss/pas2_mixer.c
--- a/sound/oss/pas2_mixer.c
+++ b/sound/oss/pas2_mixer.c
@@ -14,7 +14,7 @@
  */
 /*
  * Thomas Sailer   : ioctl code reworked (vmalloc/vfree removed)
- * Bartlomiej Zolnierkiewicz : added __init to pas_init_mixer()
+ * Bartlomiej Zolnierkiewicz : added __devinit to pas_init_mixer()
  */
 #include <linux/init.h>
 #include "sound_config.h"
@@ -318,7 +318,7 @@ static struct mixer_operations pas_mixer
 	.ioctl	= pas_mixer_ioctl
 };
 
-int __init
+int __devinit
 pas_init_mixer(void)
 {
 	int             d;
diff --git a/sound/oss/pas2_pcm.c b/sound/oss/pas2_pcm.c
--- a/sound/oss/pas2_pcm.c
+++ b/sound/oss/pas2_pcm.c
@@ -12,7 +12,7 @@
  * Thomas Sailer   : ioctl code reworked (vmalloc/vfree removed)
  * Alan Cox	   : Swatted a double allocation of device bug. Made a few
  *		     more things module options.
- * Bartlomiej Zolnierkiewicz : Added __init to pas_pcm_init()
+ * Bartlomiej Zolnierkiewicz : Added __devinit to pas_pcm_init()
  */
 
 #include <linux/init.h>
@@ -386,7 +386,7 @@ static struct audio_driver pas_audio_dri
 	.trigger		= pas_audio_trigger
 };
 
-void __init pas_pcm_init(struct address_info *hw_config)
+void __devinit pas_pcm_init(struct address_info *hw_config)
 {
 	DEB(printk("pas2_pcm.c: long pas_pcm_init()\n"));
 
diff --git a/sound/oss/pss.c b/sound/oss/pss.c
--- a/sound/oss/pss.c
+++ b/sound/oss/pss.c
@@ -51,7 +51,7 @@
  * 00-03-03: Christoph Hellwig <chhellwig@infradead.org>
  *	    Adapted to module_init/module_exit
  * 11-10-2000: Bartlomiej Zolnierkiewicz <bkz@linux-ide.org>
- *	    Added __init to probe_pss(), attach_pss() and probe_pss_mpu()
+ *	    Added __devinit to probe_pss(), attach_pss() and probe_pss_mpu()
  * 02-Jan-2001: Chris Rankin
  *          Specify that this module owns the coprocessor
  */
@@ -175,7 +175,7 @@ static void pss_write(pss_confdata *devc
  	printk(KERN_WARNING "PSS: DSP Command (%04x) Timeout.\n", data);
 }
 
-static int __init probe_pss(struct address_info *hw_config)
+static int __devinit probe_pss(struct address_info *hw_config)
 {
 	unsigned short id;
 	int irq, dma;
@@ -692,7 +692,7 @@ static void configure_nonsound_component
 	}
 }
 
-static int __init attach_pss(struct address_info *hw_config)
+static int __devinit attach_pss(struct address_info *hw_config)
 {
 	unsigned short  id;
 	char tmp[100];
@@ -745,7 +745,7 @@ static int __init attach_pss(struct addr
 	return 1;
 }
 
-static int __init probe_pss_mpu(struct address_info *hw_config)
+static int __devinit probe_pss_mpu(struct address_info *hw_config)
 {
 	struct resource *ports;
 	int timeout;
@@ -1039,7 +1039,7 @@ static coproc_operations pss_coproc_oper
 	&pss_data
 };
 
-static int __init probe_pss_mss(struct address_info *hw_config)
+static int __devinit probe_pss_mss(struct address_info *hw_config)
 {
 	volatile int timeout;
 	struct resource *ports;
@@ -1143,12 +1143,12 @@ static struct address_info cfg;
 static struct address_info cfg2;
 static struct address_info cfg_mpu;
 
-static int pss_io __initdata	= -1;
-static int mss_io __initdata	= -1;
-static int mss_irq __initdata	= -1;
-static int mss_dma __initdata	= -1;
-static int mpu_io __initdata	= -1;
-static int mpu_irq __initdata	= -1;
+static int pss_io __devinitdata	= -1;
+static int mss_io __devinitdata	= -1;
+static int mss_irq __devinitdata	= -1;
+static int mss_dma __devinitdata	= -1;
+static int mpu_io __devinitdata	= -1;
+static int mpu_irq __devinitdata	= -1;
 static int pss_no_sound = 0;	/* Just configure non-sound components */
 static int pss_keep_settings  = 1;	/* Keep hardware settings at module exit */
 static char *pss_firmware = "/etc/sound/pss_synth";
@@ -1189,7 +1189,7 @@ static int pssmpu = 0, pssmss = 0;
  *    Load a PSS sound card module
  */
 
-static int __init init_pss(void)
+static int __devinit init_pss(void)
 {
 
 	if(pss_no_sound)		/* If configuring only nonsound components */
@@ -1262,7 +1262,7 @@ module_init(init_pss);
 module_exit(cleanup_pss);
 
 #ifndef MODULE
-static int __init setup_pss(char *str)
+static int __devinit setup_pss(char *str)
 {
 	/* io, mss_io, mss_irq, mss_dma, mpu_io, mpu_irq */
 	int ints[7];
diff --git a/sound/oss/rme96xx.c b/sound/oss/rme96xx.c
--- a/sound/oss/rme96xx.c
+++ b/sound/oss/rme96xx.c
@@ -1090,7 +1090,7 @@ static struct pci_driver rme96xx_driver 
 	.remove	  = __devexit_p(rme96xx_remove),
 };
 
-static int __init init_rme96xx(void)
+static int __devinit init_rme96xx(void)
 {
 	printk(KERN_INFO RME_MESS" version "RMEVERSION" time " __TIME__ " " __DATE__ "\n");
 	devices = ((devices-1) & RME96xx_MASK_DEVS) + 1;
diff --git a/sound/oss/sb_card.c b/sound/oss/sb_card.c
--- a/sound/oss/sb_card.c
+++ b/sound/oss/sb_card.c
@@ -39,25 +39,25 @@ MODULE_LICENSE("GPL");
 
 extern void *smw_free;
 
-static int __initdata mpu_io	= 0;
-static int __initdata io	= -1;
-static int __initdata irq	= -1;
-static int __initdata dma	= -1;
-static int __initdata dma16	= -1;
-static int __initdata type	= 0; /* Can set this to a specific card type */
-static int __initdata esstype   = 0; /* ESS chip type */
-static int __initdata acer 	= 0; /* Do acer notebook init? */
-static int __initdata sm_games 	= 0; /* Logitech soundman games? */
+static int __devinitdata mpu_io	= 0;
+static int __devinitdata io	= -1;
+static int __devinitdata irq	= -1;
+static int __devinitdata dma	= -1;
+static int __devinitdata dma16	= -1;
+static int __devinitdata type	= 0; /* Can set this to a specific card type */
+static int __devinitdata esstype   = 0; /* ESS chip type */
+static int __devinitdata acer 	= 0; /* Do acer notebook init? */
+static int __devinitdata sm_games 	= 0; /* Logitech soundman games? */
 
 static struct sb_card_config *legacy = NULL;
 
 #ifdef CONFIG_PNP
-static int __initdata pnp       = 1;
+static int __devinitdata pnp       = 1;
 /*
-static int __initdata uart401	= 0;
+static int __devinitdata uart401	= 0;
 */
 #else
-static int __initdata pnp       = 0;
+static int __devinitdata pnp       = 0;
 #endif
 
 module_param(io, int, 000);
@@ -289,7 +289,7 @@ static struct pnp_card_driver sb_pnp_dri
 MODULE_DEVICE_TABLE(pnp_card, sb_pnp_card_table);
 #endif /* CONFIG_PNP */
 
-static int __init sb_init(void)
+static int __devinit sb_init(void)
 {
 	int lres = 0;
 	int pres = 0;
diff --git a/sound/oss/sgalaxy.c b/sound/oss/sgalaxy.c
--- a/sound/oss/sgalaxy.c
+++ b/sound/oss/sgalaxy.c
@@ -19,7 +19,7 @@
  *
  * Changes:
  * 11-10-2000	Bartlomiej Zolnierkiewicz <bkz@linux-ide.org>
- *		Added __init to sb_rst() and sb_cmd()
+ *		Added __devinit to sb_rst() and sb_cmd()
  */
 
 #include <linux/init.h>
@@ -44,7 +44,7 @@ static void sleep( unsigned howlong )
 #define SBDSP_STATUS     SBDSP_COMMAND
 #define SBDSP_DATA_AVAIL 0xE
 
-static int __init sb_rst(int base)
+static int __devinit sb_rst(int base)
 {
 	int   i;
    
@@ -66,7 +66,7 @@ static int __init sb_rst(int base)
 	return 1;
 }
 
-static int __init sb_cmd( int base, unsigned char val )
+static int __devinit sb_cmd( int base, unsigned char val )
 {
 	int  i;
 
@@ -84,7 +84,7 @@ static int __init sb_cmd( int base, unsi
 
 #define ai_sgbase    driver_use_1
 
-static int __init probe_sgalaxy( struct address_info *ai )
+static int __devinit probe_sgalaxy( struct address_info *ai )
 {
 	struct resource *ports;
 	int n;
@@ -147,11 +147,11 @@ static void __exit unload_sgalaxy( struc
 
 static struct address_info cfg;
 
-static int __initdata io	= -1;
-static int __initdata irq	= -1;
-static int __initdata dma	= -1;
-static int __initdata dma2	= -1;
-static int __initdata sgbase	= -1;
+static int __devinitdata io	= -1;
+static int __devinitdata irq	= -1;
+static int __devinitdata dma	= -1;
+static int __devinitdata dma2	= -1;
+static int __devinitdata sgbase	= -1;
 
 module_param(io, int, 0);
 module_param(irq, int, 0);
@@ -159,7 +159,7 @@ module_param(dma, int, 0);
 module_param(dma2, int, 0);
 module_param(sgbase, int, 0);
 
-static int __init init_sgalaxy(void)
+static int __devinit init_sgalaxy(void)
 {
 	cfg.io_base   = io;
 	cfg.irq       = irq;
@@ -187,7 +187,7 @@ module_init(init_sgalaxy);
 module_exit(cleanup_sgalaxy);
 
 #ifndef MODULE
-static int __init setup_sgalaxy(char *str)
+static int __devinit setup_sgalaxy(char *str)
 {
 	/* io, irq, dma, dma2, sgbase */
 	int ints[6];
diff --git a/sound/oss/sh_dac_audio.c b/sound/oss/sh_dac_audio.c
--- a/sound/oss/sh_dac_audio.c
+++ b/sound/oss/sh_dac_audio.c
@@ -279,7 +279,7 @@ static irqreturn_t timer1_interrupt(int 
 	return IRQ_HANDLED;
 }
 
-static int __init dac_audio_init(void)
+static int __devinit dac_audio_init(void)
 {
 	int retval;
 
diff --git a/sound/oss/sonicvibes.c b/sound/oss/sonicvibes.c
--- a/sound/oss/sonicvibes.c
+++ b/sound/oss/sonicvibes.c
@@ -71,7 +71,7 @@
  *    15.06.1999   0.15  Fix bad allocation bug.
  *                       Thanks to Deti Fliegl <fliegl@in.tum.de>
  *    28.06.1999   0.16  Add pci_set_master
- *    03.08.1999   0.17  adapt to Linus' new __setup/__initcall
+ *    03.08.1999   0.17  adapt to Linus' new __setup/__devinitcall
  *                       added kernel command line options "sonicvibes=reverb" and "sonicvibesdmaio=dmaioaddr"
  *    12.08.1999   0.18  module_init/__setup fixes
  *    24.08.1999   0.19  get rid of the dmaio kludge, replace with allocate_resource
@@ -2758,7 +2758,7 @@ static struct pci_driver sv_driver = {
        .remove		= __devexit_p(sv_remove),
 };
  
-static int __init init_sonicvibes(void)
+static int __devinit init_sonicvibes(void)
 {
 	printk(KERN_INFO "sv: version v0.31 time " __TIME__ " " __DATE__ "\n");
 #if 0
@@ -2785,9 +2785,9 @@ module_exit(cleanup_sonicvibes);
 
 /* format is: sonicvibes=[reverb] sonicvibesdmaio=dmaioaddr */
 
-static int __init sonicvibes_setup(char *str)
+static int __devinit sonicvibes_setup(char *str)
 {
-	static unsigned __initdata nr_dev = 0;
+	static unsigned __devinitdata nr_dev = 0;
 
 	if (nr_dev >= NR_DEVICE)
 		return 0;
diff --git a/sound/oss/soundcard.c b/sound/oss/soundcard.c
--- a/sound/oss/soundcard.c
+++ b/sound/oss/soundcard.c
@@ -538,7 +538,7 @@ static int dmabug;
 module_param(dmabuf, int, 0444);
 module_param(dmabug, int, 0444);
 
-static int __init oss_init(void)
+static int __devinit oss_init(void)
 {
 	int             err;
 	int i, j;
diff --git a/sound/oss/sscape.c b/sound/oss/sscape.c
--- a/sound/oss/sscape.c
+++ b/sound/oss/sscape.c
@@ -14,7 +14,7 @@
  * Thomas Sailer   	: ioctl code reworked (vmalloc/vfree removed)
  * Sergey Smitienko	: ensoniq p'n'p support
  * Christoph Hellwig	: adapted to module_init/module_exit
- * Bartlomiej Zolnierkiewicz : added __init to attach_sscape()
+ * Bartlomiej Zolnierkiewicz : added __devinit to attach_sscape()
  * Chris Rankin		: Specify that this module owns the coprocessor
  * Arnaldo C. de Melo	: added missing restore_flags in sscape_pnp_upload_file
  */
@@ -603,7 +603,7 @@ static coproc_operations sscape_coproc_o
 static struct resource *sscape_ports;
 static int sscape_is_pnp;
 
-static void __init attach_sscape(struct address_info *hw_config)
+static void __devinit attach_sscape(struct address_info *hw_config)
 {
 #ifndef SSCAPE_REGS
 	/*
@@ -985,7 +985,7 @@ static	int	sscape_pnp_upload_file(sscape
 	return 1;
 }
 
-static void __init sscape_pnp_init_hw(sscape_info* devc)
+static void __devinit sscape_pnp_init_hw(sscape_info* devc)
 {	
 	unsigned char midi_irq = 0, sb_irq = 0;
 	unsigned i;
@@ -1101,7 +1101,7 @@ static void __init sscape_pnp_init_hw(ss
 	sscape_pnp_free_dma(devc);
 }
 
-static int __init detect_sscape_pnp(sscape_info* devc)
+static int __devinit detect_sscape_pnp(sscape_info* devc)
 {
 	long	 i, irq_bits = 0xff;
 	unsigned int d;
@@ -1210,7 +1210,7 @@ fail:
 	return 0;
 }
 
-static int __init probe_sscape(struct address_info *hw_config)
+static int __devinit probe_sscape(struct address_info *hw_config)
 {
 	devc->base = hw_config->io_base;
 	devc->irq = hw_config->irq;
@@ -1263,7 +1263,7 @@ static int __init probe_sscape(struct ad
 	return 1;
 }
 
-static int __init init_ss_ms_sound(struct address_info *hw_config)
+static int __devinit init_ss_ms_sound(struct address_info *hw_config)
 {
 	int i, irq_bits = 0xff;
 	int ad_flags = 0;
@@ -1386,13 +1386,13 @@ static void __exit unload_ss_ms_sound(st
 static struct address_info cfg;
 static struct address_info cfg_mpu;
 
-static int __initdata spea = -1;
+static int __devinitdata spea = -1;
 static int mss = 0;
-static int __initdata dma = -1;
-static int __initdata irq = -1;
-static int __initdata io = -1;
-static int __initdata mpu_irq = -1;
-static int __initdata mpu_io = -1;
+static int __devinitdata dma = -1;
+static int __devinitdata irq = -1;
+static int __devinitdata io = -1;
+static int __devinitdata mpu_irq = -1;
+static int __devinitdata mpu_io = -1;
 
 module_param(dma, int, 0);
 module_param(irq, int, 0);
@@ -1402,7 +1402,7 @@ module_param(mpu_irq, int, 0);
 module_param(mpu_io, int, 0);
 module_param(mss, int, 0);
 
-static int __init init_sscape(void)
+static int __devinit init_sscape(void)
 {
 	printk(KERN_INFO "Soundscape driver Copyright (C) by Hannu Savolainen 1993-1996\n");
 	
@@ -1458,7 +1458,7 @@ module_init(init_sscape);
 module_exit(cleanup_sscape);
 
 #ifndef MODULE
-static int __init setup_sscape(char *str)
+static int __devinit setup_sscape(char *str)
 {
 	/* io, irq, dma, mpu_io, mpu_irq */
 	int ints[6];
diff --git a/sound/oss/swarm_cs4297a.c b/sound/oss/swarm_cs4297a.c
--- a/sound/oss/swarm_cs4297a.c
+++ b/sound/oss/swarm_cs4297a.c
@@ -2561,7 +2561,7 @@ static void cs4297a_interrupt(int irq, v
 static struct initvol {
 	int mixch;
 	int vol;
-} initvol[] __initdata = {
+} initvol[] __devinitdata = {
 
   	{SOUND_MIXER_WRITE_VOLUME, 0x4040},
         {SOUND_MIXER_WRITE_PCM, 0x4040},
@@ -2575,7 +2575,7 @@ static struct initvol {
 };
 #endif
 
-static int __init cs4297a_init(void)
+static int __devinit cs4297a_init(void)
 {
 	struct cs4297a_state *s;
 	u32 pwr, id;
diff --git a/sound/oss/trident.c b/sound/oss/trident.c
--- a/sound/oss/trident.c
+++ b/sound/oss/trident.c
@@ -169,7 +169,7 @@
  *  v0.06 Jan 11 2000 Ollie Lho
  *	Preliminary support for dual (more ?) AC97 codecs
  *  v0.05 Jan 08 2000 Luca Montecchiani <m.luca@iname.com>
- *	adapt to 2.3.x new __setup/__init call
+ *	adapt to 2.3.x new __setup/__devinit call
  *  v0.04 Dec 31 1999 Ollie Lho
  *	Multiple Open, using Middle Loop Interrupt to smooth playback
  *  v0.03 Dec 24 1999 Ollie Lho
@@ -4621,7 +4621,7 @@ static struct pci_driver trident_pci_dri
 	.resume = trident_resume
 };
 
-static int __init
+static int __devinit
 trident_init_module(void)
 {
 	printk(KERN_INFO "Trident 4DWave/SiS 7018/ALi 5451,Tvia CyberPro " 
diff --git a/sound/oss/trix.c b/sound/oss/trix.c
--- a/sound/oss/trix.c
+++ b/sound/oss/trix.c
@@ -120,7 +120,7 @@ static int trix_set_wss_port(struct addr
  *      AudioTrix Pro
  */
 
-static int __init init_trix_wss(struct address_info *hw_config)
+static int __devinit init_trix_wss(struct address_info *hw_config)
 {
 	static unsigned char dma_bits[4] = {
 		1, 2, 0, 3
@@ -268,7 +268,7 @@ fail:
 	return 0;
 }
 
-static int __init probe_trix_sb(struct address_info *hw_config)
+static int __devinit probe_trix_sb(struct address_info *hw_config)
 {
 
 	int tmp;
@@ -327,7 +327,7 @@ static int __init probe_trix_sb(struct a
 	return 1;
 }
 
-static int __init probe_trix_mpu(struct address_info *hw_config)
+static int __devinit probe_trix_mpu(struct address_info *hw_config)
 {
 	unsigned char conf;
 	static int irq_bits[] = {
@@ -403,15 +403,15 @@ static struct address_info cfg_mpu;
 static int sb;
 static int fw_load;
 
-static int __initdata io	= -1;
-static int __initdata irq	= -1;
-static int __initdata dma	= -1;
-static int __initdata dma2	= -1;	/* Set this for modules that need it */
-static int __initdata sb_io	= -1;
-static int __initdata sb_dma	= -1;
-static int __initdata sb_irq	= -1;
-static int __initdata mpu_io	= -1;
-static int __initdata mpu_irq	= -1;
+static int __devinitdata io	= -1;
+static int __devinitdata irq	= -1;
+static int __devinitdata dma	= -1;
+static int __devinitdata dma2	= -1;	/* Set this for modules that need it */
+static int __devinitdata sb_io	= -1;
+static int __devinitdata sb_dma	= -1;
+static int __devinitdata sb_irq	= -1;
+static int __devinitdata mpu_io	= -1;
+static int __devinitdata mpu_irq	= -1;
 
 module_param(io, int, 0);
 module_param(irq, int, 0);
@@ -424,7 +424,7 @@ module_param(mpu_io, int, 0);
 module_param(mpu_irq, int, 0);
 module_param(joystick, bool, 0);
 
-static int __init init_trix(void)
+static int __devinit init_trix(void)
 {
 	printk(KERN_INFO "MediaTrix audio driver Copyright (C) by Hannu Savolainen 1993-1996\n");
 
@@ -500,7 +500,7 @@ module_init(init_trix);
 module_exit(cleanup_trix);
 
 #ifndef MODULE
-static int __init setup_trix (char *str)
+static int __devinit setup_trix (char *str)
 {
 	/* io, irq, dma, dma2, sb_io, sb_irq, sb_dma, mpu_io, mpu_irq */
 	int ints[9];
diff --git a/sound/oss/uart401.c b/sound/oss/uart401.c
--- a/sound/oss/uart401.c
+++ b/sound/oss/uart401.c
@@ -437,7 +437,7 @@ module_param(io, int, 0444);
 module_param(irq, int, 0444);
 
 
-static int __init init_uart401(void)
+static int __devinit init_uart401(void)
 {
 	cfg_mpu.irq = irq;
 	cfg_mpu.io_base = io;
@@ -463,7 +463,7 @@ module_init(init_uart401);
 module_exit(cleanup_uart401);
 
 #ifndef MODULE
-static int __init setup_uart401(char *str)
+static int __devinit setup_uart401(char *str)
 {
 	/* io, irq */
 	int ints[3];
diff --git a/sound/oss/uart6850.c b/sound/oss/uart6850.c
--- a/sound/oss/uart6850.c
+++ b/sound/oss/uart6850.c
@@ -247,7 +247,7 @@ static struct midi_operations uart6850_o
 };
 
 
-static void __init attach_uart6850(struct address_info *hw_config)
+static void __devinit attach_uart6850(struct address_info *hw_config)
 {
 	int ok, timeout;
 	unsigned long   flags;
@@ -289,7 +289,7 @@ static inline int reset_uart6850(void)
 				 */
 }
 
-static int __init probe_uart6850(struct address_info *hw_config)
+static int __devinit probe_uart6850(struct address_info *hw_config)
 {
 	int ok;
 
@@ -313,13 +313,13 @@ static void __exit unload_uart6850(struc
 
 static struct address_info cfg_mpu;
 
-static int __initdata io = -1;
-static int __initdata irq = -1;
+static int __devinitdata io = -1;
+static int __devinitdata irq = -1;
 
 module_param(io, int, 0);
 module_param(irq, int, 0);
 
-static int __init init_uart6850(void)
+static int __devinit init_uart6850(void)
 {
 	cfg_mpu.io_base = io;
 	cfg_mpu.irq = irq;
@@ -345,7 +345,7 @@ module_init(init_uart6850);
 module_exit(cleanup_uart6850);
 
 #ifndef MODULE
-static int __init setup_uart6850(char *str)
+static int __devinit setup_uart6850(char *str)
 {
 	/* io, irq */
 	int ints[3];
diff --git a/sound/oss/v_midi.c b/sound/oss/v_midi.c
--- a/sound/oss/v_midi.c
+++ b/sound/oss/v_midi.c
@@ -171,7 +171,7 @@ struct vmidi_memory
 	struct vmidi_devc v_ops[2];
 };
 
-static void __init attach_v_midi (struct address_info *hw_config)
+static void __devinit attach_v_midi (struct address_info *hw_config)
 {
 	struct vmidi_memory *m;
 	/* printk("Attaching v_midi device.....\n"); */
@@ -254,7 +254,7 @@ static void __init attach_v_midi (struct
 	/* printk("Attached v_midi device\n"); */
 }
 
-static inline int __init probe_v_midi(struct address_info *hw_config)
+static inline int __devinit probe_v_midi(struct address_info *hw_config)
 {
 	return(1);	/* always OK */
 }
@@ -269,7 +269,7 @@ static void __exit unload_v_midi(struct 
 
 static struct address_info cfg; /* dummy */
 
-static int __init init_vmidi(void)
+static int __devinit init_vmidi(void)
 {
 	printk("MIDI Loopback device driver\n");
 	if (!probe_v_midi(&cfg))
diff --git a/sound/oss/via82cxxx_audio.c b/sound/oss/via82cxxx_audio.c
--- a/sound/oss/via82cxxx_audio.c
+++ b/sound/oss/via82cxxx_audio.c
@@ -3580,7 +3580,7 @@ static void __devexit via_remove_one (st
  *
  */
 
-static int __init init_via82cxxx_audio(void)
+static int __devinit init_via82cxxx_audio(void)
 {
 	int rc;
 
diff --git a/sound/oss/vidc.c b/sound/oss/vidc.c
--- a/sound/oss/vidc.c
+++ b/sound/oss/vidc.c
@@ -437,7 +437,7 @@ void vidc_update_filler(int format, int 
 	}
 }
 
-static void __init attach_vidc(struct address_info *hw_config)
+static void __devinit attach_vidc(struct address_info *hw_config)
 {
 	char name[32];
 	int i, adev;
@@ -509,7 +509,7 @@ audio_failed:
 	return;
 }
 
-static int __init probe_vidc(struct address_info *hw_config)
+static int __devinit probe_vidc(struct address_info *hw_config)
 {
 	hw_config->irq		= IRQ_DMAS0;
 	hw_config->dma		= DMA_VIRTUAL_SOUND;
@@ -538,7 +538,7 @@ static void __exit unload_vidc(struct ad
 
 static struct address_info cfg;
 
-static int __init init_vidc(void)
+static int __devinit init_vidc(void)
 {
 	if (probe_vidc(&cfg) == 0)
 		return -ENODEV;
diff --git a/sound/oss/vwsnd.c b/sound/oss/vwsnd.c
--- a/sound/oss/vwsnd.c
+++ b/sound/oss/vwsnd.c
@@ -138,7 +138,7 @@
  *
  * Changes:
  * 11-10-2000	Bartlomiej Zolnierkiewicz <bkz@linux-ide.org>
- *		Added some __init/__exit
+ *		Added some __devinit/__exit
  */
 
 #include <linux/module.h>
@@ -252,7 +252,7 @@ typedef struct lithium {
  * Returns 0 on success, -errno on failure.
  */
 
-static int __init li_create(lithium_t *lith, unsigned long baseaddr)
+static int __devinit li_create(lithium_t *lith, unsigned long baseaddr)
 {
 	static void li_destroy(lithium_t *);
 
@@ -1332,7 +1332,7 @@ static void ad1843_shutdown_adc(lithium_
  *
  * return 0 on success, -errno on failure.  */
 
-static int __init ad1843_init(lithium_t *lith)
+static int __devinit ad1843_init(lithium_t *lith)
 {
 	unsigned long later;
 	int err;
@@ -3239,7 +3239,7 @@ static struct file_operations vwsnd_mixe
 
 /* driver probe routine.  Return nonzero if hardware is found. */
 
-static int __init probe_vwsnd(struct address_info *hw_config)
+static int __devinit probe_vwsnd(struct address_info *hw_config)
 {
 	lithium_t lith;
 	int w;
@@ -3292,7 +3292,7 @@ static int __init probe_vwsnd(struct add
  * Return +minor_dev on success, -errno on failure.
  */
 
-static int __init attach_vwsnd(struct address_info *hw_config)
+static int __devinit attach_vwsnd(struct address_info *hw_config)
 {
 	vwsnd_dev_t *devc = NULL;
 	int err = -ENOMEM;
@@ -3459,7 +3459,7 @@ MODULE_DESCRIPTION("SGI Visual Workstati
 MODULE_AUTHOR("Bob Miller <kbob@sgi.com>");
 MODULE_LICENSE("GPL");
 
-static int __init init_vwsnd(void)
+static int __devinit init_vwsnd(void)
 {
 	int err;
 
diff --git a/sound/oss/waveartist.c b/sound/oss/waveartist.c
--- a/sound/oss/waveartist.c
+++ b/sound/oss/waveartist.c
@@ -20,7 +20,7 @@
  *
  * Changes:
  * 11-10-2000	Bartlomiej Zolnierkiewicz <bkz@linux-ide.org>
- *		Added __init to waveartist_init()
+ *		Added __devinit to waveartist_init()
  */
 
 /* Debugging */
@@ -1248,7 +1248,7 @@ waveartist_mixer_reset(wavnc_info *devc)
 		waveartist_mixer_update(devc, i);
 }
 
-static int __init waveartist_init(wavnc_info *devc)
+static int __devinit waveartist_init(wavnc_info *devc)
 {
 	wavnc_port_info *portc;
 	char rev[3], dev_name[64];
@@ -1337,7 +1337,7 @@ nomem:
 	return -1;
 }
 
-static int __init probe_waveartist(struct address_info *hw_config)
+static int __devinit probe_waveartist(struct address_info *hw_config)
 {
 	wavnc_info *devc = &adev_info[nr_waveartist_devs];
 
@@ -1373,7 +1373,7 @@ static int __init probe_waveartist(struc
 	return 1;
 }
 
-static void __init
+static void __devinit
 attach_waveartist(struct address_info *hw, const struct waveartist_mixer_info *mix)
 {
 	wavnc_info *devc = &adev_info[nr_waveartist_devs];
@@ -1958,13 +1958,13 @@ static struct address_info cfg;
 
 static int attached;
 
-static int __initdata io = 0;
-static int __initdata irq = 0;
-static int __initdata dma = 0;
-static int __initdata dma2 = 0;
+static int __devinitdata io = 0;
+static int __devinitdata irq = 0;
+static int __devinitdata dma = 0;
+static int __devinitdata dma2 = 0;
 
 
-static int __init init_waveartist(void)
+static int __devinit init_waveartist(void)
 {
 	const struct waveartist_mixer_info *mix;
 
@@ -2010,7 +2010,7 @@ module_init(init_waveartist);
 module_exit(cleanup_waveartist);
 
 #ifndef MODULE
-static int __init setup_waveartist(char *str)
+static int __devinit setup_waveartist(char *str)
 {
 	/* io, irq, dma, dma2 */
 	int ints[5];
diff --git a/sound/oss/wavfront.c b/sound/oss/wavfront.c
--- a/sound/oss/wavfront.c
+++ b/sound/oss/wavfront.c
@@ -64,7 +64,7 @@
  *
  * Changes:
  * 11-10-2000	Bartlomiej Zolnierkiewicz <bkz@linux-ide.org>
- *		Added some __init and __initdata to entries in yss225.c
+ *		Added some __devinit and __devinitdata to entries in yss225.c
  */
 
 #include <linux/module.h>
@@ -2113,12 +2113,12 @@ static struct synth_operations wavefront
 
 #if OSS_SUPPORT_LEVEL & OSS_SUPPORT_STATIC_INSTALL
 
-static void __init attach_wavefront (struct address_info *hw_config)
+static void __devinit attach_wavefront (struct address_info *hw_config)
 {
     (void) install_wavefront ();
 }
 
-static int __init probe_wavefront (struct address_info *hw_config)
+static int __devinit probe_wavefront (struct address_info *hw_config)
 {
     return !detect_wavefront (hw_config->irq, hw_config->io_base);
 }
@@ -2223,7 +2223,7 @@ wavefront_should_cause_interrupt (int va
 	spin_unlock_irqrestore(&lock,flags);
 }
 
-static int __init wavefront_hw_reset (void)
+static int __devinit wavefront_hw_reset (void)
 {
 	int bits;
 	int hwv[2];
@@ -2425,7 +2425,7 @@ static int __init wavefront_hw_reset (vo
 	return (1);
 }
 
-static int __init detect_wavefront (int irq, int io_base)
+static int __devinit detect_wavefront (int irq, int io_base)
 {
 	unsigned char   rbuf[4], wbuf[4];
 
@@ -2600,7 +2600,7 @@ wavefront_download_firmware (char *path)
 	return 1;
 }
 
-static int __init wavefront_config_midi (void)
+static int __devinit wavefront_config_midi (void)
 {
 	unsigned char rbuf[4], wbuf[4];
     
@@ -2672,7 +2672,7 @@ static int __init wavefront_config_midi 
 	return 0;
 }
 
-static int __init wavefront_do_reset (int atboot)
+static int __devinit wavefront_do_reset (int atboot)
 {
 	char voices[1];
 
@@ -2774,7 +2774,7 @@ static int __init wavefront_do_reset (in
 	return 1;
 }
 
-static int __init wavefront_init (int atboot)
+static int __devinit wavefront_init (int atboot)
 {
 	int samples_are_from_rom;
 
@@ -2803,7 +2803,7 @@ static int __init wavefront_init (int at
 	return (0);
 }
 
-static int __init install_wavefront (void)
+static int __devinit install_wavefront (void)
 
 {
 	if ((dev.synth_dev = register_sound_synth (&wavefront_fops, -1)) < 0) {
@@ -2895,7 +2895,7 @@ wffx_idle (void) 
 	return (1);
 }
 
-int __init detect_wffx (void)
+int __devinit detect_wffx (void)
 {
 	/* This is a crude check, but its the best one I have for now.
 	   Certainly on the Maui and the Tropez, wffx_idle() will
@@ -3036,7 +3036,7 @@ wffx_ioctl (wavefront_fx_info *r)
    a somewhat "algorithmic" approach.
 */
 
-static int __init wffx_init (void)
+static int __devinit wffx_init (void)
 {
 	int i;
 	int j;
@@ -3499,7 +3499,7 @@ MODULE_LICENSE("GPL");
 module_param       (io, int, 0);
 module_param       (irq, int, 0);
 
-static int __init init_wavfront (void)
+static int __devinit init_wavfront (void)
 {
 	printk ("Turtle Beach WaveFront Driver\n"
 		"Copyright (C) by Hannu Solvainen, "
diff --git a/sound/oss/wf_midi.c b/sound/oss/wf_midi.c
--- a/sound/oss/wf_midi.c
+++ b/sound/oss/wf_midi.c
@@ -782,7 +782,7 @@ virtual_midi_disable (void)
 	return 0;
 }
 
-int __init detect_wf_mpu (int irq, int io_base)
+int __devinit detect_wf_mpu (int irq, int io_base)
 {
 	if (!request_region(io_base, 2, "wavefront midi")) {
 		printk (KERN_WARNING "WF-MPU: I/O port %x already in use.\n",
@@ -798,7 +798,7 @@ int __init detect_wf_mpu (int irq, int i
 	return 0;
 }
 
-int __init install_wf_mpu (void)
+int __devinit install_wf_mpu (void)
 {
 	if ((phys_dev->devno = sound_alloc_mididev()) < 0){
 
diff --git a/sound/oss/ymfpci.c b/sound/oss/ymfpci.c
--- a/sound/oss/ymfpci.c
+++ b/sound/oss/ymfpci.c
@@ -2677,7 +2677,7 @@ static struct pci_driver ymfpci_driver =
 	.resume		= ymf_resume
 };
 
-static int __init ymf_init_module(void)
+static int __devinit ymf_init_module(void)
 {
 	return pci_module_init(&ymfpci_driver);
 }
diff --git a/sound/oss/yss225.c b/sound/oss/yss225.c
--- a/sound/oss/yss225.c
+++ b/sound/oss/yss225.c
@@ -1,6 +1,6 @@
 #include <linux/init.h>
 
-unsigned char page_zero[] __initdata = {
+unsigned char page_zero[] __devinitdata = {
 0x01, 0x7c, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf5, 0x00,
 0x11, 0x00, 0x20, 0x00, 0x32, 0x00, 0x40, 0x00, 0x13, 0x00, 0x00,
 0x00, 0x14, 0x02, 0x76, 0x00, 0x60, 0x00, 0x80, 0x02, 0x00, 0x00,
@@ -27,7 +27,7 @@ unsigned char page_zero[] __initdata = {
 0x1d, 0x02, 0xdf
 };    
 
-unsigned char page_one[] __initdata = {
+unsigned char page_one[] __devinitdata = {
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x19, 0x00,
 0x1f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xd8, 0x00, 0x00,
 0x02, 0x20, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x01,
@@ -54,7 +54,7 @@ unsigned char page_one[] __initdata = {
 0x60, 0x00, 0x1b
 };
 
-unsigned char page_two[] __initdata = {
+unsigned char page_two[] __devinitdata = {
 0xc4, 0x00, 0x44, 0x07, 0x44, 0x00, 0x40, 0x25, 0x01, 0x06, 0xc4,
 0x07, 0x40, 0x25, 0x01, 0x00, 0x46, 0x46, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -69,7 +69,7 @@ unsigned char page_two[] __initdata = {
 0x46, 0x05, 0x46, 0x07, 0x46, 0x07, 0x44
 };
 
-unsigned char page_three[] __initdata = {
+unsigned char page_three[] __devinitdata = {
 0x07, 0x40, 0x00, 0x00, 0x00, 0x47, 0x00, 0x40, 0x00, 0x40, 0x06,
 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -84,7 +84,7 @@ unsigned char page_three[] __initdata = 
 0x02, 0x00, 0x42, 0x00, 0xc0, 0x00, 0x40
 };
 
-unsigned char page_four[] __initdata = {
+unsigned char page_four[] __devinitdata = {
 0x63, 0x03, 0x26, 0x02, 0x2c, 0x00, 0x24, 0x00, 0x2e, 0x02, 0x02,
 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -99,7 +99,7 @@ unsigned char page_four[] __initdata = {
 0x02, 0x62, 0x02, 0x20, 0x01, 0x21, 0x01
 };
 
-unsigned char page_six[] __initdata = {
+unsigned char page_six[] __devinitdata = {
 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x04, 0x00, 0x00, 0x06, 0x00,
 0x00, 0x08, 0x00, 0x00, 0x0a, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x0e,
 0x00, 0x00, 0x10, 0x00, 0x00, 0x12, 0x00, 0x00, 0x14, 0x00, 0x00,
@@ -120,7 +120,7 @@ unsigned char page_six[] __initdata = {
 0x80, 0x00, 0x7e, 0x80, 0x80
 };
 
-unsigned char page_seven[] __initdata = {
+unsigned char page_seven[] __devinitdata = {
 0x0f, 0xff, 0x00, 0x00, 0x08, 0x00, 0x08, 0x00, 0x02, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x0f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00,
 0x08, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x0f,
@@ -147,7 +147,7 @@ unsigned char page_seven[] __initdata = 
 0x00, 0x02, 0x00
 };
 
-unsigned char page_zero_v2[] __initdata = {
+unsigned char page_zero_v2[] __devinitdata = {
 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -159,7 +159,7 @@ unsigned char page_zero_v2[] __initdata 
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
-unsigned char page_one_v2[] __initdata = {
+unsigned char page_one_v2[] __devinitdata = {
 0x01, 0xc0, 0x01, 0xfa, 0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -171,21 +171,21 @@ unsigned char page_one_v2[] __initdata =
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
-unsigned char page_two_v2[] __initdata = {
+unsigned char page_two_v2[] __devinitdata = {
 0x46, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00
 };
-unsigned char page_three_v2[] __initdata = {
+unsigned char page_three_v2[] __devinitdata = {
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00
 };
-unsigned char page_four_v2[] __initdata = {
+unsigned char page_four_v2[] __devinitdata = {
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -193,7 +193,7 @@ unsigned char page_four_v2[] __initdata 
 0x00, 0x00, 0x00, 0x00
 };
 
-unsigned char page_seven_v2[] __initdata = {
+unsigned char page_seven_v2[] __devinitdata = {
 0x0f, 0xff, 0x0f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -204,7 +204,7 @@ unsigned char page_seven_v2[] __initdata
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
-unsigned char mod_v2[] __initdata = {
+unsigned char mod_v2[] __devinitdata = {
 0x01, 0x00, 0x02, 0x00, 0x01, 0x01, 0x02, 0x00, 0x01, 0x02, 0x02,
 0x00, 0x01, 0x03, 0x02, 0x00, 0x01, 0x04, 0x02, 0x00, 0x01, 0x05,
 0x02, 0x00, 0x01, 0x06, 0x02, 0x00, 0x01, 0x07, 0x02, 0x00, 0xb0,
@@ -234,7 +234,7 @@ unsigned char mod_v2[] __initdata = {
 0x02, 0x01, 0x01, 0x04, 0x02, 0x01, 0x01, 0x05, 0x02, 0x01, 0x01,
 0x06, 0x02, 0x01, 0x01, 0x07, 0x02, 0x01
 };
-unsigned char coefficients[] __initdata = {
+unsigned char coefficients[] __devinitdata = {
 0x07, 0x46, 0x00, 0x00, 0x07, 0x49, 0x00, 0x00, 0x00, 0x4b, 0x03,
 0x11, 0x00, 0x4d, 0x01, 0x32, 0x07, 0x46, 0x00, 0x00, 0x07, 0x49,
 0x00, 0x00, 0x07, 0x40, 0x00, 0x00, 0x07, 0x41, 0x00, 0x00, 0x01,
@@ -270,14 +270,14 @@ unsigned char coefficients[] __initdata 
 0x06, 0x6c, 0x4c, 0x6c, 0x06, 0x50, 0x52, 0xe2, 0x06, 0x42, 0x02,
 0xba
 };
-unsigned char coefficients2[] __initdata = {
+unsigned char coefficients2[] __devinitdata = {
 0x07, 0x46, 0x00, 0x00, 0x07, 0x49, 0x00, 0x00, 0x07, 0x45, 0x0f,
 0xff, 0x07, 0x48, 0x0f, 0xff, 0x07, 0x7b, 0x04, 0xcc, 0x07, 0x7d,
 0x04, 0xcc, 0x07, 0x7c, 0x00, 0x00, 0x07, 0x7e, 0x00, 0x00, 0x07,
 0x46, 0x00, 0x00, 0x07, 0x49, 0x00, 0x00, 0x07, 0x47, 0x00, 0x00,
 0x07, 0x4a, 0x00, 0x00, 0x07, 0x4c, 0x00, 0x00, 0x07, 0x4e, 0x00, 0x00
 };
-unsigned char coefficients3[] __initdata = { 
+unsigned char coefficients3[] __devinitdata = { 
 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x28, 0x00, 0x51, 0x00,
 0x51, 0x00, 0x7a, 0x00, 0x7a, 0x00, 0xa3, 0x00, 0xa3, 0x00, 0xcc,
 0x00, 0xcc, 0x00, 0xf5, 0x00, 0xf5, 0x01, 0x1e, 0x01, 0x1e, 0x01,
diff --git a/sound/parisc/harmony.c b/sound/parisc/harmony.c
--- a/sound/parisc/harmony.c
+++ b/sound/parisc/harmony.c
@@ -773,7 +773,7 @@ static snd_kcontrol_new_t snd_harmony_co
 		       HARMONY_GAIN_RI_SHIFT, HARMONY_GAIN_IN, 0),
 };
 
-static void __init 
+static void __devinit 
 snd_harmony_mixer_reset(harmony_t *h)
 {
 	harmony_mute(h);
@@ -782,7 +782,7 @@ snd_harmony_mixer_reset(harmony_t *h)
 	harmony_unmute(h);
 }
 
-static int __init 
+static int __devinit 
 snd_harmony_mixer_init(harmony_t *h)
 {
 	snd_card_t *card = h->card;
@@ -958,7 +958,7 @@ static struct parisc_driver snd_harmony_
 	.remove = snd_harmony_remove,
 };
 
-static int __init 
+static int __devinit 
 alsa_harmony_init(void)
 {
 	int err;
diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -2594,7 +2594,7 @@ EXPORT_SYMBOL(snd_ac97_suspend);
  *  INIT part
  */
 
-static int __init alsa_ac97_init(void)
+static int __devinit alsa_ac97_init(void)
 {
 	return 0;
 }
diff --git a/sound/pci/ac97/ak4531_codec.c b/sound/pci/ac97/ak4531_codec.c
--- a/sound/pci/ac97/ak4531_codec.c
+++ b/sound/pci/ac97/ak4531_codec.c
@@ -424,7 +424,7 @@ EXPORT_SYMBOL(snd_ak4531_mixer);
  *  INIT part
  */
 
-static int __init alsa_ak4531_init(void)
+static int __devinit alsa_ak4531_init(void)
 {
 	return 0;
 }
diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -2423,7 +2423,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };                                
 
-static int __init alsa_card_ali_init(void)
+static int __devinit alsa_card_ali_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -775,7 +775,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_card_als4000_remove),
 };
 
-static int __init alsa_card_als4000_init(void)
+static int __devinit alsa_card_als4000_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1643,7 +1643,7 @@ static struct pci_driver driver = {
 };
 
 
-static int __init alsa_card_atiixp_init(void)
+static int __devinit alsa_card_atiixp_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -1325,7 +1325,7 @@ static struct pci_driver driver = {
 };
 
 
-static int __init alsa_card_atiixp_init(void)
+static int __devinit alsa_card_atiixp_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -373,7 +373,7 @@ static struct pci_driver driver = {
 };
 
 // initialization of the module
-static int __init alsa_card_vortex_init(void)
+static int __devinit alsa_card_vortex_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -1516,7 +1516,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_azf3328_remove),
 };
 
-static int __init alsa_card_azf3328_init(void)
+static int __devinit alsa_card_azf3328_init(void)
 {
 	int err;
 	snd_azf3328_dbgcallenter();
diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -916,7 +916,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_bt87x_remove),
 };
 
-static int __init alsa_card_bt87x_init(void)
+static int __devinit alsa_card_bt87x_init(void)
 {
 	if (load_all)
 		driver.id_table = snd_bt87x_default_ids;
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1388,7 +1388,7 @@ static struct pci_driver driver = {
 };
 
 // initialization of the module
-static int __init alsa_card_ca0106_init(void)
+static int __devinit alsa_card_ca0106_init(void)
 {
 	int err;
 
diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -3068,7 +3068,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_cmipci_remove),
 };
 	
-static int __init alsa_card_cmipci_init(void)
+static int __devinit alsa_card_cmipci_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -2125,7 +2125,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };
 	
-static int __init alsa_card_cs4281_init(void)
+static int __devinit alsa_card_cs4281_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/cs46xx/cs46xx.c b/sound/pci/cs46xx/cs46xx.c
--- a/sound/pci/cs46xx/cs46xx.c
+++ b/sound/pci/cs46xx/cs46xx.c
@@ -169,7 +169,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };
 
-static int __init alsa_card_cs46xx_init(void)
+static int __devinit alsa_card_cs46xx_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -228,7 +228,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_card_emu10k1_remove),
 };
 
-static int __init alsa_card_emu10k1_init(void)
+static int __devinit alsa_card_emu10k1_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/emu10k1/emu10k1_synth.c b/sound/pci/emu10k1/emu10k1_synth.c
--- a/sound/pci/emu10k1/emu10k1_synth.c
+++ b/sound/pci/emu10k1/emu10k1_synth.c
@@ -101,7 +101,7 @@ static int snd_emu10k1_synth_delete_devi
  *  INIT part
  */
 
-static int __init alsa_emu10k1_synth_init(void)
+static int __devinit alsa_emu10k1_synth_init(void)
 {
 	
 	static snd_seq_dev_ops_t ops = {
diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -1621,7 +1621,7 @@ static struct pci_driver driver = {
 };
 
 // initialization of the module
-static int __init alsa_card_emu10k1x_init(void)
+static int __devinit alsa_card_emu10k1x_init(void)
 {
 	int err;
 
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -2399,7 +2399,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_audiopci_remove),
 };
 	
-static int __init alsa_card_ens137x_init(void)
+static int __devinit alsa_card_ens137x_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1759,7 +1759,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };
 
-static int __init alsa_card_es1938_init(void)
+static int __devinit alsa_card_es1938_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2788,7 +2788,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };
 
-static int __init alsa_card_es1968_init(void)
+static int __devinit alsa_card_es1968_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1467,7 +1467,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_card_fm801_remove),
 };
 
-static int __init alsa_card_fm801_init(void)
+static int __devinit alsa_card_fm801_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -1939,7 +1939,7 @@ EXPORT_SYMBOL(snd_hda_resume);
  *  INIT part
  */
 
-static int __init alsa_hda_init(void)
+static int __devinit alsa_hda_init(void)
 {
 	return 0;
 }
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1478,7 +1478,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };
 
-static int __init alsa_card_azx_init(void)
+static int __devinit alsa_card_azx_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/ice1712/ak4xxx.c b/sound/pci/ice1712/ak4xxx.c
--- a/sound/pci/ice1712/ak4xxx.c
+++ b/sound/pci/ice1712/ak4xxx.c
@@ -177,7 +177,7 @@ int snd_ice1712_akm4xxx_build_controls(i
 	return 0;
 }
 
-static int __init alsa_ice1712_akm4xxx_module_init(void)
+static int __devinit alsa_ice1712_akm4xxx_module_init(void)
 {
 	return 0;
 }
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2746,7 +2746,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_ice1712_remove),
 };
 
-static int __init alsa_card_ice1712_init(void)
+static int __devinit alsa_card_ice1712_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2326,7 +2326,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_vt1724_remove),
 };
 
-static int __init alsa_card_ice1724_init(void)
+static int __devinit alsa_card_ice1724_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2870,7 +2870,7 @@ static struct pci_driver driver = {
 };
 
 
-static int __init alsa_card_intel8x0_init(void)
+static int __devinit alsa_card_intel8x0_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -1378,7 +1378,7 @@ static struct pci_driver driver = {
 };
 
 
-static int __init alsa_card_intel8x0m_init(void)
+static int __devinit alsa_card_intel8x0m_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2539,7 +2539,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_korg1212_remove),
 };
 
-static int __init alsa_card_korg1212_init(void)
+static int __devinit alsa_card_korg1212_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -2896,7 +2896,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };
 	
-static int __init alsa_card_m3_init(void)
+static int __devinit alsa_card_m3_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -1429,7 +1429,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_mixart_remove),
 };
 
-static int __init alsa_card_mixart_init(void)
+static int __devinit alsa_card_mixart_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -1643,7 +1643,7 @@ static struct pci_driver driver = {
 };
 
 
-static int __init alsa_card_nm256_init(void)
+static int __devinit alsa_card_nm256_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -2029,7 +2029,7 @@ static struct pci_driver driver = {
 	.remove =	__devexit_p(snd_rme32_remove),
 };
 
-static int __init alsa_card_rme32_init(void)
+static int __devinit alsa_card_rme32_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -2435,7 +2435,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_rme96_remove),
 };
 
-static int __init alsa_card_rme96_init(void)
+static int __devinit alsa_card_rme96_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -5228,7 +5228,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_hdsp_remove),
 };
 
-static int __init alsa_card_hdsp_init(void)
+static int __devinit alsa_card_hdsp_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -3657,7 +3657,7 @@ static struct pci_driver driver = {
 };
 
 
-static int __init alsa_card_hdspm_init(void)
+static int __devinit alsa_card_hdspm_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -2666,7 +2666,7 @@ static struct pci_driver driver = {
 	.remove	  = __devexit_p(snd_rme9652_remove),
 };
 
-static int __init alsa_card_hammerfall_init(void)
+static int __devinit alsa_card_hammerfall_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -1520,7 +1520,7 @@ static struct pci_driver driver = {
 	.remove = __devexit_p(snd_sonic_remove),
 };
 
-static int __init alsa_card_sonicvibes_init(void)
+static int __devinit alsa_card_sonicvibes_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/trident/trident.c b/sound/pci/trident/trident.c
--- a/sound/pci/trident/trident.c
+++ b/sound/pci/trident/trident.c
@@ -183,7 +183,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };
 
-static int __init alsa_card_trident_init(void)
+static int __devinit alsa_card_trident_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/trident/trident_synth.c b/sound/pci/trident/trident_synth.c
--- a/sound/pci/trident/trident_synth.c
+++ b/sound/pci/trident/trident_synth.c
@@ -1010,7 +1010,7 @@ static int snd_trident_synth_delete_devi
 	return 0;
 }
 
-static int __init alsa_trident_synth_init(void)
+static int __devinit alsa_trident_synth_init(void)
 {
 	static snd_seq_dev_ops_t ops =
 	{
diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -2351,7 +2351,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };
 
-static int __init alsa_card_via82xx_init(void)
+static int __devinit alsa_card_via82xx_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -1212,7 +1212,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };
 
-static int __init alsa_card_via82xx_init(void)
+static int __devinit alsa_card_via82xx_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/vx222/vx222.c b/sound/pci/vx222/vx222.c
--- a/sound/pci/vx222/vx222.c
+++ b/sound/pci/vx222/vx222.c
@@ -258,7 +258,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };
 
-static int __init alsa_card_vx222_init(void)
+static int __devinit alsa_card_vx222_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pci/ymfpci/ymfpci.c b/sound/pci/ymfpci/ymfpci.c
--- a/sound/pci/ymfpci/ymfpci.c
+++ b/sound/pci/ymfpci/ymfpci.c
@@ -358,7 +358,7 @@ static struct pci_driver driver = {
 	SND_PCI_PM_CALLBACKS
 };
 
-static int __init alsa_card_ymfpci_init(void)
+static int __devinit alsa_card_ymfpci_init(void)
 {
 	return pci_register_driver(&driver);
 }
diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf.c b/sound/pcmcia/pdaudiocf/pdaudiocf.c
--- a/sound/pcmcia/pdaudiocf/pdaudiocf.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf.c
@@ -388,7 +388,7 @@ static struct pcmcia_driver pdacf_cs_dri
 	.id_table	= snd_pdacf_ids,
 };
 
-static int __init init_pdacf(void)
+static int __devinit init_pdacf(void)
 {
 	return pcmcia_register_driver(&pdacf_cs_driver);
 }
diff --git a/sound/pcmcia/vx/vxpocket.c b/sound/pcmcia/vx/vxpocket.c
--- a/sound/pcmcia/vx/vxpocket.c
+++ b/sound/pcmcia/vx/vxpocket.c
@@ -463,7 +463,7 @@ static struct pcmcia_driver vxp_cs_drive
 	.id_table	= vxp_ids,
 };
 
-static int __init init_vxpocket(void)
+static int __devinit init_vxpocket(void)
 {
 	return pcmcia_register_driver(&vxp_cs_driver);
 }
diff --git a/sound/ppc/awacs.c b/sound/ppc/awacs.c
--- a/sound/ppc/awacs.c
+++ b/sound/ppc/awacs.c
@@ -450,7 +450,7 @@ static int snd_pmac_awacs_put_master_amp
 #define AMP_CH_SPK	0
 #define AMP_CH_HD	1
 
-static snd_kcontrol_new_t snd_pmac_awacs_amp_vol[] __initdata = {
+static snd_kcontrol_new_t snd_pmac_awacs_amp_vol[] __devinitdata = {
 	{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	  .name = "PC Speaker Playback Volume",
 	  .info = snd_pmac_awacs_info_volume_amp,
@@ -487,7 +487,7 @@ static snd_kcontrol_new_t snd_pmac_awacs
 	},
 };
 
-static snd_kcontrol_new_t snd_pmac_awacs_amp_hp_sw __initdata = {
+static snd_kcontrol_new_t snd_pmac_awacs_amp_hp_sw __devinitdata = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Headphone Playback Switch",
 	.info = snd_pmac_boolean_stereo_info,
@@ -496,7 +496,7 @@ static snd_kcontrol_new_t snd_pmac_awacs
 	.private_value = AMP_CH_HD,
 };
 
-static snd_kcontrol_new_t snd_pmac_awacs_amp_spk_sw __initdata = {
+static snd_kcontrol_new_t snd_pmac_awacs_amp_spk_sw __devinitdata = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "PC Speaker Playback Switch",
 	.info = snd_pmac_boolean_stereo_info,
@@ -568,7 +568,7 @@ static int snd_pmac_screamer_mic_boost_p
 /*
  * lists of mixer elements
  */
-static snd_kcontrol_new_t snd_pmac_awacs_mixers[] __initdata = {
+static snd_kcontrol_new_t snd_pmac_awacs_mixers[] __devinitdata = {
 	AWACS_VOLUME("Master Playback Volume", 2, 6, 1),
 	AWACS_SWITCH("Master Capture Switch", 1, SHIFT_LOOPTHRU, 0),
 	AWACS_VOLUME("Capture Volume", 0, 4, 0),
@@ -578,24 +578,24 @@ static snd_kcontrol_new_t snd_pmac_awacs
 /* FIXME: is this correct order?
  * screamer (powerbook G3 pismo) seems to have different bits...
  */
-static snd_kcontrol_new_t snd_pmac_awacs_mixers2[] __initdata = {
+static snd_kcontrol_new_t snd_pmac_awacs_mixers2[] __devinitdata = {
 	AWACS_SWITCH("Line Capture Switch", 0, SHIFT_MUX_LINE, 0),
 	AWACS_SWITCH("Mic Capture Switch", 0, SHIFT_MUX_MIC, 0),
 };
 
-static snd_kcontrol_new_t snd_pmac_screamer_mixers2[] __initdata = {
+static snd_kcontrol_new_t snd_pmac_screamer_mixers2[] __devinitdata = {
 	AWACS_SWITCH("Line Capture Switch", 0, SHIFT_MUX_MIC, 0),
 	AWACS_SWITCH("Mic Capture Switch", 0, SHIFT_MUX_LINE, 0),
 };
 
-static snd_kcontrol_new_t snd_pmac_awacs_master_sw __initdata =
+static snd_kcontrol_new_t snd_pmac_awacs_master_sw __devinitdata =
 AWACS_SWITCH("Master Playback Switch", 1, SHIFT_HDMUTE, 1);
 
-static snd_kcontrol_new_t snd_pmac_awacs_mic_boost[] __initdata = {
+static snd_kcontrol_new_t snd_pmac_awacs_mic_boost[] __devinitdata = {
 	AWACS_SWITCH("Mic Boost", 0, SHIFT_GAINLINE, 0),
 };
 
-static snd_kcontrol_new_t snd_pmac_screamer_mic_boost[] __initdata = {
+static snd_kcontrol_new_t snd_pmac_screamer_mic_boost[] __devinitdata = {
 	{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	  .name = "Mic Boost",
 	  .info = snd_pmac_screamer_mic_boost_info,
@@ -604,10 +604,10 @@ static snd_kcontrol_new_t snd_pmac_screa
 	},
 };
 
-static snd_kcontrol_new_t snd_pmac_awacs_speaker_vol[] __initdata = {
+static snd_kcontrol_new_t snd_pmac_awacs_speaker_vol[] __devinitdata = {
 	AWACS_VOLUME("PC Speaker Playback Volume", 4, 6, 1),
 };
-static snd_kcontrol_new_t snd_pmac_awacs_speaker_sw __initdata =
+static snd_kcontrol_new_t snd_pmac_awacs_speaker_sw __devinitdata =
 AWACS_SWITCH("PC Speaker Playback Switch", 1, SHIFT_SPKMUTE, 1);
 
 
@@ -745,7 +745,7 @@ static void snd_pmac_awacs_update_automu
 /*
  * initialize chip
  */
-int __init
+int __devinit
 snd_pmac_awacs_init(pmac_t *chip)
 {
 	int err, vol;
diff --git a/sound/ppc/beep.c b/sound/ppc/beep.c
--- a/sound/ppc/beep.c
+++ b/sound/ppc/beep.c
@@ -209,7 +209,7 @@ static snd_kcontrol_new_t snd_pmac_beep_
 };
 
 /* Initialize beep stuff */
-int __init snd_pmac_attach_beep(pmac_t *chip)
+int __devinit snd_pmac_attach_beep(pmac_t *chip)
 {
 	pmac_beep_t *beep;
 	int err;
diff --git a/sound/ppc/burgundy.c b/sound/ppc/burgundy.c
--- a/sound/ppc/burgundy.c
+++ b/sound/ppc/burgundy.c
@@ -308,7 +308,7 @@ static int snd_pmac_burgundy_put_volume_
   .put = snd_pmac_burgundy_put_volume_out,\
   .private_value = (ADDR2BASE(addr) | ((stereo) << 24)) }
 
-static snd_kcontrol_new_t snd_pmac_burgundy_mixers[] __initdata = {
+static snd_kcontrol_new_t snd_pmac_burgundy_mixers[] __devinitdata = {
 	BURGUNDY_VOLUME("Master Playback Volume", 0, MASK_ADDR_BURGUNDY_MASTER_VOLUME, 8),
 	BURGUNDY_VOLUME("Line Playback Volume", 0, MASK_ADDR_BURGUNDY_VOLLINE, 16),
 	BURGUNDY_VOLUME("CD Playback Volume", 0, MASK_ADDR_BURGUNDY_VOLCD, 16),
@@ -317,9 +317,9 @@ static snd_kcontrol_new_t snd_pmac_burgu
 	/*BURGUNDY_OUTPUT_VOLUME("PCM Playback Volume", 0, MASK_ADDR_BURGUNDY_ATTENLINEOUT, 1),*/
 	BURGUNDY_OUTPUT_VOLUME("Headphone Playback Volume", 0, MASK_ADDR_BURGUNDY_ATTENSPEAKER, 1),
 };	
-static snd_kcontrol_new_t snd_pmac_burgundy_master_sw __initdata = 
+static snd_kcontrol_new_t snd_pmac_burgundy_master_sw __devinitdata = 
 BURGUNDY_OUTPUT_SWITCH("Headphone Playback Switch", 0, BURGUNDY_OUTPUT_LEFT, BURGUNDY_OUTPUT_RIGHT, 1);
-static snd_kcontrol_new_t snd_pmac_burgundy_speaker_sw __initdata = 
+static snd_kcontrol_new_t snd_pmac_burgundy_speaker_sw __devinitdata = 
 BURGUNDY_OUTPUT_SWITCH("PC Speaker Playback Switch", 0, BURGUNDY_OUTPUT_INTERN, 0, 0);
 
 
@@ -361,7 +361,7 @@ static void snd_pmac_burgundy_update_aut
 /*
  * initialize burgundy
  */
-int __init snd_pmac_burgundy_init(pmac_t *chip)
+int __devinit snd_pmac_burgundy_init(pmac_t *chip)
 {
 	int i, err;
 
diff --git a/sound/ppc/daca.c b/sound/ppc/daca.c
--- a/sound/ppc/daca.c
+++ b/sound/ppc/daca.c
@@ -241,7 +241,7 @@ static void daca_cleanup(pmac_t *chip)
 }
 
 /* exported */
-int __init snd_pmac_daca_init(pmac_t *chip)
+int __devinit snd_pmac_daca_init(pmac_t *chip)
 {
 	int i, err;
 	pmac_daca_t *mix;
diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
--- a/sound/ppc/keywest.c
+++ b/sound/ppc/keywest.c
@@ -114,7 +114,7 @@ void snd_pmac_keywest_cleanup(pmac_keywe
 	}
 }
 
-int __init snd_pmac_tumbler_post_init(void)
+int __devinit snd_pmac_tumbler_post_init(void)
 {
 	int err;
 	
@@ -126,7 +126,7 @@ int __init snd_pmac_tumbler_post_init(vo
 }
 
 /* exported */
-int __init snd_pmac_keywest_init(pmac_keywest_t *i2c)
+int __devinit snd_pmac_keywest_init(pmac_keywest_t *i2c)
 {
 	int err;
 
diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -638,7 +638,7 @@ static void pmac_pcm_free(snd_pcm_t *pcm
 	snd_pcm_lib_preallocate_free_for_all(pcm);
 }
 
-int __init snd_pmac_pcm_new(pmac_t *chip)
+int __devinit snd_pmac_pcm_new(pmac_t *chip)
 {
 	snd_pcm_t *pcm;
 	int err;
@@ -848,7 +848,7 @@ static int snd_pmac_dev_free(snd_device_
  * check the machine support byteswap (little-endian)
  */
 
-static void __init detect_byte_swap(pmac_t *chip)
+static void __devinit detect_byte_swap(pmac_t *chip)
 {
 	struct device_node *mio;
 
@@ -874,7 +874,7 @@ static void __init detect_byte_swap(pmac
 /*
  * detect a sound chip
  */
-static int __init snd_pmac_detect(pmac_t *chip)
+static int __devinit snd_pmac_detect(pmac_t *chip)
 {
 	struct device_node *sound = NULL;
 	unsigned int *prop, l;
@@ -1113,7 +1113,7 @@ static int pmac_hp_detect_get(snd_kcontr
 	return 0;
 }
 
-static snd_kcontrol_new_t auto_mute_controls[] __initdata = {
+static snd_kcontrol_new_t auto_mute_controls[] __devinitdata = {
 	{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	  .name = "Auto Mute Switch",
 	  .info = snd_pmac_boolean_mono_info,
@@ -1128,7 +1128,7 @@ static snd_kcontrol_new_t auto_mute_cont
 	},
 };
 
-int __init snd_pmac_add_automute(pmac_t *chip)
+int __devinit snd_pmac_add_automute(pmac_t *chip)
 {
 	int err;
 	chip->auto_mute = 1;
@@ -1145,7 +1145,7 @@ int __init snd_pmac_add_automute(pmac_t 
 /*
  * create and detect a pmac chip record
  */
-int __init snd_pmac_new(snd_card_t *card, pmac_t **chip_return)
+int __devinit snd_pmac_new(snd_card_t *card, pmac_t **chip_return)
 {
 	pmac_t *chip;
 	struct device_node *np;
@@ -1396,7 +1396,7 @@ static struct pmu_sleep_notifier snd_pma
 	snd_pmac_sleep_notify, SLEEP_LEVEL_SOUND,
 };
 
-static int __init snd_pmac_register_sleep_notifier(pmac_t *chip)
+static int __devinit snd_pmac_register_sleep_notifier(pmac_t *chip)
 {
 	/* should be protected here.. */
 	snd_assert(! sleeping_pmac, return -EBUSY);
diff --git a/sound/ppc/powermac.c b/sound/ppc/powermac.c
--- a/sound/ppc/powermac.c
+++ b/sound/ppc/powermac.c
@@ -54,7 +54,7 @@ static snd_card_t *snd_pmac_card = NULL;
 /*
  */
 
-static int __init snd_pmac_probe(void)
+static int __devinit snd_pmac_probe(void)
 {
 	snd_card_t *card;
 	pmac_t *chip;
@@ -147,7 +147,7 @@ __error:
  * MODULE stuff
  */
 
-static int __init alsa_card_pmac_init(void)
+static int __devinit alsa_card_pmac_init(void)
 {
 	int err;
 	if ((err = snd_pmac_probe()) < 0)
diff --git a/sound/ppc/toonie.c b/sound/ppc/toonie.c
--- a/sound/ppc/toonie.c
+++ b/sound/ppc/toonie.c
@@ -156,7 +156,7 @@ static int toonie_put_mute_switch(snd_kc
 	return 0;
 }
 
-static snd_kcontrol_new_t toonie_hp_sw __initdata = {
+static snd_kcontrol_new_t toonie_hp_sw __devinitdata = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Headphone Playback Switch",
 	.info = snd_pmac_boolean_mono_info,
@@ -164,7 +164,7 @@ static snd_kcontrol_new_t toonie_hp_sw _
 	.put = toonie_put_mute_switch,
 	.private_value = TOONIE_MUTE_HP,
 };
-static snd_kcontrol_new_t toonie_speaker_sw __initdata = {
+static snd_kcontrol_new_t toonie_speaker_sw __devinitdata = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "PC Speaker Playback Switch",
 	.info = snd_pmac_boolean_mono_info,
diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -794,7 +794,7 @@ static int snapper_put_capture_source(sn
 
 /*
  */
-static snd_kcontrol_new_t tumbler_mixers[] __initdata = {
+static snd_kcontrol_new_t tumbler_mixers[] __devinitdata = {
 	{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	  .name = "Master Playback Volume",
 	  .info = tumbler_info_master_volume,
@@ -818,7 +818,7 @@ static snd_kcontrol_new_t tumbler_mixers
 	},
 };
 
-static snd_kcontrol_new_t snapper_mixers[] __initdata = {
+static snd_kcontrol_new_t snapper_mixers[] __devinitdata = {
 	{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	  .name = "Master Playback Volume",
 	  .info = tumbler_info_master_volume,
@@ -850,7 +850,7 @@ static snd_kcontrol_new_t snapper_mixers
 	},
 };
 
-static snd_kcontrol_new_t tumbler_hp_sw __initdata = {
+static snd_kcontrol_new_t tumbler_hp_sw __devinitdata = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Headphone Playback Switch",
 	.info = snd_pmac_boolean_mono_info,
@@ -858,7 +858,7 @@ static snd_kcontrol_new_t tumbler_hp_sw 
 	.put = tumbler_put_mute_switch,
 	.private_value = TUMBLER_MUTE_HP,
 };
-static snd_kcontrol_new_t tumbler_speaker_sw __initdata = {
+static snd_kcontrol_new_t tumbler_speaker_sw __devinitdata = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "PC Speaker Playback Switch",
 	.info = snd_pmac_boolean_mono_info,
@@ -866,7 +866,7 @@ static snd_kcontrol_new_t tumbler_speake
 	.put = tumbler_put_mute_switch,
 	.private_value = TUMBLER_MUTE_AMP,
 };
-static snd_kcontrol_new_t tumbler_lineout_sw __initdata = {
+static snd_kcontrol_new_t tumbler_lineout_sw __devinitdata = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Line Out Playback Switch",
 	.info = snd_pmac_boolean_mono_info,
@@ -874,7 +874,7 @@ static snd_kcontrol_new_t tumbler_lineou
 	.put = tumbler_put_mute_switch,
 	.private_value = TUMBLER_MUTE_LINE,
 };
-static snd_kcontrol_new_t tumbler_drc_sw __initdata = {
+static snd_kcontrol_new_t tumbler_drc_sw __devinitdata = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "DRC Switch",
 	.info = snd_pmac_boolean_mono_info,
@@ -1202,7 +1202,7 @@ static void tumbler_resume(pmac_t *chip)
 #endif
 
 /* initialize tumbler */
-static int __init tumbler_init(pmac_t *chip)
+static int __devinit tumbler_init(pmac_t *chip)
 {
 	int irq;
 	pmac_tumbler_t *mix = chip->mixer_data;
@@ -1273,7 +1273,7 @@ static void tumbler_cleanup(pmac_t *chip
 }
 
 /* exported */
-int __init snd_pmac_tumbler_init(pmac_t *chip)
+int __devinit snd_pmac_tumbler_init(pmac_t *chip)
 {
 	int i, err;
 	pmac_tumbler_t *mix;
diff --git a/sound/sound_core.c b/sound/sound_core.c
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -565,7 +565,7 @@ static void __exit cleanup_soundcore(voi
 	class_destroy(sound_class);
 }
 
-static int __init init_soundcore(void)
+static int __devinit init_soundcore(void)
 {
 	if (register_chrdev(SOUND_MAJOR, "sound", &soundcore_fops)==-1) {
 		printk(KERN_ERR "soundcore: sound device already in use.\n");
diff --git a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
--- a/sound/sparc/amd7930.c
+++ b/sound/sparc/amd7930.c
@@ -763,7 +763,7 @@ static void snd_amd7930_pcm_free(snd_pcm
 	snd_pcm_lib_preallocate_free_for_all(pcm);
 }
 
-static int __init snd_amd7930_pcm(amd7930_t *amd)
+static int __devinit snd_amd7930_pcm(amd7930_t *amd)
 {
 	snd_pcm_t *pcm;
 	int err;
@@ -879,7 +879,7 @@ static int snd_amd7930_put_volume(snd_kc
 	return change;
 }
 
-static snd_kcontrol_new_t amd7930_controls[] __initdata = {
+static snd_kcontrol_new_t amd7930_controls[] __devinitdata = {
 	{
 		.iface		=	SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name		=	"Monitor Volume",
@@ -909,7 +909,7 @@ static snd_kcontrol_new_t amd7930_contro
 	},
 };
 
-static int __init snd_amd7930_mixer(amd7930_t *amd)
+static int __devinit snd_amd7930_mixer(amd7930_t *amd)
 {
 	snd_card_t *card;
 	int idx, err;
@@ -954,7 +954,7 @@ static snd_device_ops_t snd_amd7930_dev_
 	.dev_free	=	snd_amd7930_dev_free,
 };
 
-static int __init snd_amd7930_create(snd_card_t *card,
+static int __devinit snd_amd7930_create(snd_card_t *card,
 				     struct sbus_dev *sdev,
 				     struct resource *rp,
 				     unsigned int reg_size,
@@ -1026,7 +1026,7 @@ static int __init snd_amd7930_create(snd
 	return 0;
 }
 
-static int __init amd7930_attach(int prom_node, struct sbus_dev *sdev)
+static int __devinit amd7930_attach(int prom_node, struct sbus_dev *sdev)
 {
 	static int dev;
 	struct linux_prom_registers reg_prop;
@@ -1102,7 +1102,7 @@ out_err:
 	return err;
 }
 
-static int __init amd7930_init(void)
+static int __devinit amd7930_init(void)
 {
 	struct sbus_bus *sbus;
 	struct sbus_dev *sdev;
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -1957,7 +1957,7 @@ static snd_device_ops_t snd_cs4231_sbus_
 	.dev_free	=	snd_cs4231_sbus_dev_free,
 };
 
-static int __init snd_cs4231_sbus_create(snd_card_t *card,
+static int __devinit snd_cs4231_sbus_create(snd_card_t *card,
 					 struct sbus_dev *sdev,
 					 int dev,
 					 cs4231_t **rchip)
@@ -2071,7 +2071,7 @@ static snd_device_ops_t snd_cs4231_ebus_
 	.dev_free	=	snd_cs4231_ebus_dev_free,
 };
 
-static int __init snd_cs4231_ebus_create(snd_card_t *card,
+static int __devinit snd_cs4231_ebus_create(snd_card_t *card,
 					 struct linux_ebus_device *edev,
 					 int dev,
 					 cs4231_t **rchip)
@@ -2176,7 +2176,7 @@ static int cs4231_ebus_attach(struct lin
 }
 #endif
 
-static int __init cs4231_init(void)
+static int __devinit cs4231_init(void)
 {
 #ifdef SBUS_SUPPORT
 	struct sbus_bus *sbus;
diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -2443,7 +2443,7 @@ static snd_kcontrol_new_t dbri_controls[
 
 #define NUM_CS4215_CONTROLS (sizeof(dbri_controls)/sizeof(snd_kcontrol_new_t))
 
-static int __init snd_dbri_mixer(snd_dbri_t * dbri)
+static int __devinit snd_dbri_mixer(snd_dbri_t * dbri)
 {
 	snd_card_t *card;
 	int idx, err;
@@ -2544,7 +2544,7 @@ void snd_dbri_proc(snd_dbri_t * dbri)
 */
 static void snd_dbri_free(snd_dbri_t * dbri);
 
-static int __init snd_dbri_create(snd_card_t * card,
+static int __devinit snd_dbri_create(snd_card_t * card,
 				  struct sbus_dev *sdev,
 				  struct linux_prom_irqs *irq, int dev)
 {
@@ -2615,7 +2615,7 @@ static void snd_dbri_free(snd_dbri_t * d
 				     (void *)dbri->dma, dbri->dma_dvma);
 }
 
-static int __init dbri_attach(int prom_node, struct sbus_dev *sdev)
+static int __devinit dbri_attach(int prom_node, struct sbus_dev *sdev)
 {
 	snd_dbri_t *dbri;
 	struct linux_prom_irqs irq;
@@ -2687,7 +2687,7 @@ static int __init dbri_attach(int prom_n
 }
 
 /* Probe for the dbri chip and then attach the driver. */
-static int __init dbri_init(void)
+static int __devinit dbri_init(void)
 {
 	struct sbus_bus *sbus;
 	struct sbus_dev *sdev;
diff --git a/sound/synth/emux/emux.c b/sound/synth/emux/emux.c
--- a/sound/synth/emux/emux.c
+++ b/sound/synth/emux/emux.c
@@ -161,7 +161,7 @@ EXPORT_SYMBOL(snd_sf_linear_to_log);
  *  INIT part
  */
 
-static int __init alsa_emux_init(void)
+static int __devinit alsa_emux_init(void)
 {
 	return 0;
 }
diff --git a/sound/synth/util_mem.c b/sound/synth/util_mem.c
--- a/sound/synth/util_mem.c
+++ b/sound/synth/util_mem.c
@@ -194,7 +194,7 @@ EXPORT_SYMBOL(__snd_util_memblk_new);
  *  INIT part
  */
 
-static int __init alsa_util_mem_init(void)
+static int __devinit alsa_util_mem_init(void)
 {
 	return 0;
 }
diff --git a/sound/usb/usbaudio.c b/sound/usb/usbaudio.c
--- a/sound/usb/usbaudio.c
+++ b/sound/usb/usbaudio.c
@@ -3332,7 +3332,7 @@ static void usb_audio_disconnect(struct 
 }
 
 
-static int __init snd_usb_audio_init(void)
+static int __devinit snd_usb_audio_init(void)
 {
 	if (nrpacks < MIN_PACKS_URB || nrpacks > MAX_PACKS) {
 		printk(KERN_WARNING "invalid nrpacks value.\n");
diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -450,7 +450,7 @@ static void usX2Y_usb_disconnect(struct 
 	}
 }
 
-static int __init snd_usX2Y_module_init(void)
+static int __devinit snd_usX2Y_module_init(void)
 {
 	return usb_register(&snd_usX2Y_usb_driver);
 }



--===============80843002094577376==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80843002094577376==--
