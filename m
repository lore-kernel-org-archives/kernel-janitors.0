From: Rahul Ruikar <rahul.ruikar@gmail.com>
Date: Wed, 22 Sep 2010 16:21:01 +0000
Subject: kernel compilation error linux-2.6.35.5
Message-Id: <AANLkTini3-so-=GNdVZiLA9XXLfunosGgAtMB_iC67q-@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

I compiled kernel 2.6.35.5 on Fedora 13 ( laptop ) i got following errors.
After completing installation I boot up system with this kernel but
sound is not working ..that is

[root@Ganesha linux-2.6.35.5]# make install
sh /home/rahul/Downloads/stable/linux-2.6.35.5/arch/x86/boot/install.sh
2.6.35.5 arch/x86/boot/bzImage \
		System.map "/boot"
ERROR: modinfo: could not find module snd_hda_codec_idt
ERROR: modinfo: could not find module snd_hda_intel
ERROR: modinfo: could not find module snd_hda_codec
ERROR: modinfo: could not find module snd_hwdep
ERROR: modinfo: could not find module snd_seq
ERROR: modinfo: could not find module snd_seq_device
ERROR: modinfo: could not find module snd_pcm
ERROR: modinfo: could not find module snd_timer
ERROR: modinfo: could not find module snd
ERROR: modinfo: could not find module soundcore
ERROR: modinfo: could not find module snd_page_alloc
