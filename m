From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 20 Aug 2012 16:10:42 +0000
Subject: Re: [sound:master 88/92] sound/pci/hda/./hda_trace.h:90:1: error: 'struct hda_codec' has no member n
Message-Id: <s5ha9xpo871.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50325d03.lHpcUKzbQHgu7MKm%fengguang.wu@intel.com>
In-Reply-To: <50325d03.lHpcUKzbQHgu7MKm%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Mon, 20 Aug 2012 23:51:31 +0800,
Fengguang Wu wrote:
> 
> Hi Takashi,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git master
> head:   b9687805cf4e70e08221856b1bbadfa5e37c3342
> commit: b244d335609f9bbf4c0204a365bf03b7ac53c3c8 [88/92] ALSA: hda - Add tracepoints at snd_hda_power_up/down entrances.
> config: i386-randconfig-k767 (attached as .config)
> 
> All related error/warning messages:
> 
> make[4]: *** [sound/pci/hda/hda_codec.o] Error 1
> make[4]: Target `__build' not remade because of errors.
> --
> In file included from include/trace/ftrace.h:567:0,
>                  from include/trace/define_trace.h:86,
>                  from sound/pci/hda/hda_trace.h:141,
>                  from sound/pci/hda/hda_codec.c:41:
> sound/pci/hda/./hda_trace.h: In function 'ftrace_raw_event_hda_power_count':
> sound/pci/hda/./hda_trace.h:90:1: error: 'struct hda_codec' has no member named 'power_count'
> sound/pci/hda/./hda_trace.h:90:1: error: 'struct hda_codec' has no member named 'power_on'
> sound/pci/hda/./hda_trace.h:90:1: error: 'struct hda_codec' has no member named 'power_transition'
> In file included from include/trace/ftrace.h:775:0,
>                  from include/trace/define_trace.h:86,
>                  from sound/pci/hda/hda_trace.h:141,
>                  from sound/pci/hda/hda_codec.c:41:
> sound/pci/hda/./hda_trace.h: In function 'perf_trace_hda_power_count':
> sound/pci/hda/./hda_trace.h:90:1: error: 'struct hda_codec' has no member named 'power_count'
> sound/pci/hda/./hda_trace.h:90:1: error: 'struct hda_codec' has no member named 'power_on'
> sound/pci/hda/./hda_trace.h:90:1: error: 'struct hda_codec' has no member named 'power_transition'
> 
> vim +90 sound/pci/hda/./hda_trace.h
>     87		TP_ARGS(codec)
>     88	);
>     89	
>   > 90	TRACE_EVENT(hda_power_count,
>     91		TP_PROTO(struct hda_codec *codec),
>     92		TP_ARGS(codec),
>     93		TP_STRUCT__entry(

Thanks, looks like the missing ifdef.
Fixed now.


Takashi
