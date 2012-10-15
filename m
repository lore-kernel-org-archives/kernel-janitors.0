From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 01:49:26 +0000
Subject: Re: sound/pci/hda/hda_codec.c:1435:46: error: 'AC_VERB_GET_CON' undeclared
Message-Id: <20121015014926.GA7203@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121012170109.GD20312@localhost> <s5h7gquixlv.wl%tiwai@suse.de>
 <20121014023953.GA8713@localhost>
 <20121015005944.GC24935@opensource.wolfsonmicro.com>
In-Reply-To: <20121015005944.GC24935@opensource.wolfsonmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Mon, Oct 15, 2012 at 09:59:45AM +0900, Mark Brown wrote:
> On Sun, Oct 14, 2012 at 10:39:53AM +0800, Fengguang Wu wrote:
> 
> > OK. Takashi, Mark, the build system can now avoid testing selected
> > trees during the merge window. Shall I add your trees to the list?
> 
> For me I'd really want to be able to keep the for-next branch covered,
> it's better to have the false positives than to loose that coverage.

Got it, yeah it makes good sense.

Thanks,
Fengguang
