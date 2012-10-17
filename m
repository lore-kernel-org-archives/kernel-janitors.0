From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 17 Oct 2012 08:45:36 +0000
Subject: [sound:for-next 12/13] sound/pci/ice1712/ice1712.h:501:2: error: implicit declaration of function 'o
Message-Id: <20121017084536.GA21734@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121017084104.GA21654@localhost>
In-Reply-To: <20121017084104.GA21654@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Ondrej,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   a2af050f8df6eeec29818639859f14eb237d6957
commit: 77b0b254af72add59c8125cd8799f390bc508f2b [12/13] ALSA: ice1712: Add Philips PSC724 Ultimate Edge
config: powerpc-allmodconfig # make ARCH=powerpc allmodconfig

All error/warnings:

In file included from sound/pci/ice1712/psc724.c:29:0:
sound/pci/ice1712/ice1712.h: In function 'snd_ice1712_write':
sound/pci/ice1712/ice1712.h:501:2: error: implicit declaration of function 'outb' [-Werror=implicit-function-declaration]
sound/pci/ice1712/ice1712.h: In function 'snd_ice1712_read':
sound/pci/ice1712/ice1712.h:508:2: error: implicit declaration of function 'inb' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +501 sound/pci/ice1712/ice1712.h

2bf864ac Takashi Iwai        2009-05-06  485  int snd_ice1724_put_route_val(struct snd_ice1712 *ice, unsigned int val,
2bf864ac Takashi Iwai        2009-05-06  486  								int shift);
2bf864ac Takashi Iwai        2009-05-06  487  
6ca308d4 Takashi Iwai        2005-11-17  488  int snd_ice1712_spdif_build_controls(struct snd_ice1712 *ice);
^1da177e Linus Torvalds      2005-04-16  489  
2bf864ac Takashi Iwai        2009-05-06  490  int snd_ice1712_akm4xxx_init(struct snd_akm4xxx *ak,
2bf864ac Takashi Iwai        2009-05-06  491  			     const struct snd_akm4xxx *template,
2bf864ac Takashi Iwai        2009-05-06  492  			     const struct snd_ak4xxx_private *priv,
2bf864ac Takashi Iwai        2009-05-06  493  			     struct snd_ice1712 *ice);
6ca308d4 Takashi Iwai        2005-11-17  494  void snd_ice1712_akm4xxx_free(struct snd_ice1712 *ice);
6ca308d4 Takashi Iwai        2005-11-17  495  int snd_ice1712_akm4xxx_build_controls(struct snd_ice1712 *ice);
^1da177e Linus Torvalds      2005-04-16  496  
6ca308d4 Takashi Iwai        2005-11-17  497  int snd_ice1712_init_cs8427(struct snd_ice1712 *ice, int addr);
^1da177e Linus Torvalds      2005-04-16  498  
3d8cb466 Alexander Beregalov 2008-09-07  499  static inline void snd_ice1712_write(struct snd_ice1712 *ice, u8 addr, u8 data)
^1da177e Linus Torvalds      2005-04-16  500  {
^1da177e Linus Torvalds      2005-04-16 @501  	outb(addr, ICEREG(ice, INDEX));
^1da177e Linus Torvalds      2005-04-16  502  	outb(data, ICEREG(ice, DATA));
^1da177e Linus Torvalds      2005-04-16  503  }
^1da177e Linus Torvalds      2005-04-16  504  
3d8cb466 Alexander Beregalov 2008-09-07  505  static inline u8 snd_ice1712_read(struct snd_ice1712 *ice, u8 addr)
^1da177e Linus Torvalds      2005-04-16  506  {
^1da177e Linus Torvalds      2005-04-16  507  	outb(addr, ICEREG(ice, INDEX));
^1da177e Linus Torvalds      2005-04-16  508  	return inb(ICEREG(ice, DATA));
^1da177e Linus Torvalds      2005-04-16  509  }

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
