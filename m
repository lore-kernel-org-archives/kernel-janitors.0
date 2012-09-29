From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 13:29:00 +0000
Subject: [calxeda:ubuntu-quantal 228/299] sound/pci/hda/patch_realtek.c:6768:13: error: 'alc662_fixup_inv_dmi
Message-Id: <20120929132900.GA13792@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Takashi,

FYI, kernel build failed on

tree:   git://sources.calxeda.com/kernel/linux.git ubuntu-quantal
head:   c07f1571f9b6e609109d50bd6ba2b2547e873614
commit: 228b38983729cef0b906ed604df22632aa81263a [228/299] ALSA: hda - Add the inverted digital mic workaround to Realtek codecs
config: x86_64-allmodconfig

All error/warnings:

sound/pci/hda/patch_realtek.c:6768:13: error: 'alc662_fixup_inv_dmic' undeclared here (not in a function)
sound/pci/hda/patch_realtek.c:1786:12: warning: 'alc_add_inv_dmic_mixer' defined but not used [-Wunused-function]

vim +6768 sound/pci/hda/patch_realtek.c

edfe3bfc (David Henningsson 2012-06-12  6762) 			{ 0x1b, 0x02214020 }, /* Front HP */
edfe3bfc (David Henningsson 2012-06-12  6763) 			{ }
edfe3bfc (David Henningsson 2012-06-12  6764) 		}
edfe3bfc (David Henningsson 2012-06-12  6765) 	},
228b3898 (Takashi Iwai      2012-06-22  6766) 	[ALC662_FIXUP_INV_DMIC] = {
228b3898 (Takashi Iwai      2012-06-22  6767) 		.type = ALC_FIXUP_FUNC,
228b3898 (Takashi Iwai      2012-06-22 @6768) 		.v.func = alc662_fixup_inv_dmic,
228b3898 (Takashi Iwai      2012-06-22  6769) 	},
6cb3b707 (David Henningsson 2010-09-09  6770) };
6cb3b707 (David Henningsson 2010-09-09  6771) 

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
