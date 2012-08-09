From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 09 Aug 2012 16:00:56 +0000
Subject: Re: [sound-unstable:master 94/97] sound/pci/hda/hda_intel.c:3174:6: error: 'struct azx' has no membe
Message-Id: <s5hy5loys07.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120809153406.GA14070@localhost>
In-Reply-To: <20120809153406.GA14070@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Thu, 9 Aug 2012 23:34:06 +0800,
Fengguang Wu wrote:
> 
> Hi Takashi,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-unstable.git master
> head:   d2dfd82739080fefb704c0d8e4c9b2b2093a601c
> commit: 5cb543dba9867588786f87af2e64fca371b69283 [94/97] ALSA: hda - Deferred probing with request_firmware_nowait()
> config: i386-defconfig (attached as .config)
> 
> All related error/warning messages:
> 
> sound/pci/hda/hda_intel.c: In function 'azx_firmware_cb':
> sound/pci/hda/hda_intel.c:3174:6: error: 'struct azx' has no member named 'fw'
> sound/pci/hda/hda_intel.c: At top level:
> sound/pci/hda/hda_intel.c:3163:13: warning: 'azx_firmware_cb' defined but not used [-Wunused-function]

Oh, a typical mistake, a forgotten ifdef.
Fixed now.


Thanks!

Takashi
