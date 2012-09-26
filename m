From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 26 Sep 2012 16:08:08 +0000
Subject: [samsung:v4l-next 51/121] drivers/media/usb/tlg2300/pd-alsa.c:309:3: error: implicit declaration of
Message-Id: <20120926160807.GD14447@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Alan,

FYI, kernel build failed on

tree:   git://git.infradead.org/users/kmpark/linux-samsung v4l-next
head:   01882ac3debd75dcf39c45b9cfc9eb12c4b50ba0
commit: da35de640a0e9c805aba70439f524234890b96c5 [51/121] [media] tlg2300: fix missing check for audio creation
config: x86_64-allmodconfig

All error/warnings:

drivers/media/usb/tlg2300/pd-alsa.c: In function 'poseidon_audio_init':
drivers/media/usb/tlg2300/pd-alsa.c:309:3: error: implicit declaration of function 'snd_free_card' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +309 drivers/media/usb/tlg2300/pd-alsa.c
   303		ret = snd_card_create(-1, "Telegent", THIS_MODULE, 0, &card);
   304		if (ret != 0)
   305			return ret;
   306	
   307		ret = snd_pcm_new(card, "poseidon audio", 0, 0, 1, &pcm);
   308		if (ret < 0) {
 > 309			snd_free_card(card);
   310			return ret;
   311		}
   312		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pcm_capture_ops);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
