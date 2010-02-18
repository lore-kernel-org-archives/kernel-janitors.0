From: Dan Carpenter <error27@gmail.com>
Date: Thu, 18 Feb 2010 09:19:36 +0000
Subject: bug report:  using snd_BUG_ON() instead of WARN_ON()
Message-Id: <20100218091936.GA5621@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org

Smatch found a couple places try use the return value for snd_BUG_ON() 
without realizing it's always zero or that it can be defined away entirely
under certain configs.

sound/core/info_oss.c
    46          if (snd_BUG_ON(dev < 0 || dev >= SNDRV_OSS_INFO_DEV_COUNT))
    47                  return -ENXIO;
    48          if (snd_BUG_ON(num < 0 || num >= SNDRV_CARDS))
    49                  return -ENXIO;

sound/drivers/opl3/opl3_midi.c +652 snd_opl3_kill_voice(34) warn: buffer overflow 'opl3->voices' 18 <= 20

	opl3_midi.c checks the range with snd_BUG_ON() and then adds 3 so 
	it possibly goes out of bounds.  I'm not sure the situation there.

sound/core/seq/seq_midi.c +403 snd_seq_midisynth_register_port(126) error: buffer overflow 'client->ports_per_device' 8 <= 8
sound/core/seq/seq_midi.c +404 snd_seq_midisynth_register_port(127) error: buffer overflow 'client->ports' 8 <= 8
sound/core/info_oss.c +52 snd_oss_info_register(10) error: buffer overflow 'snd_sndstat_strings[num]' 6 <= 6
sound/core/info_oss.c +52 snd_oss_info_register(10) error: buffer overflow 'snd_sndstat_strings' 32 <= 32
sound/core/info_oss.c +63 snd_oss_info_register(21) error: buffer overflow 'snd_sndstat_strings[num]' 6 <= 6
sound/core/info_oss.c +63 snd_oss_info_register(21) error: buffer overflow 'snd_sndstat_strings' 32 <= 32
sound/pci/cs46xx/dsp_spos_scb_lib.c +1497 cs46xx_dsp_destroy_pcm_channel(28) error: buffer overflow 'ins->src_scb_slots' 14 <= 14

regards,
dan carpenter
