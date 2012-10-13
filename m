From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 13 Oct 2012 08:29:16 +0000
Subject: Re: sound/pci/hda/hda_codec.c:1435:46: error: 'AC_VERB_GET_CON' undeclared
Message-Id: <s5h7gquixlv.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121012170109.GD20312@localhost>
In-Reply-To: <20121012170109.GD20312@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Sat, 13 Oct 2012 01:01:09 +0800,
Fengguang Wu wrote:
> 
> Hi Takashi,
> 
> FYI, kernel build failed on
> 
> commit: 645cf3b5656e47fa9a46e2fbc8d212ab572ab05b  Merge branch 'topic/3.8'
> config: x86_64-allyesdebian (attached as .config)
> 
> 
> All error/warnings:
> 
> sound/pci/hda/hda_codec.c: In function 'update_pcm_stream_id':
> sound/pci/hda/hda_codec.c:1435:46: error: 'AC_VERB_GET_CON' undeclared (first use in this function)
> sound/pci/hda/hda_codec.c:1435:46: note: each undeclared identifier is reported only once for each function it appears in

Thanks, this must be already fixed.  It was a temporary merge error.
(One shouldn't work during updating the system....)


Takashi
