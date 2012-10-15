From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 15 Oct 2012 00:59:45 +0000
Subject: Re: sound/pci/hda/hda_codec.c:1435:46: error: 'AC_VERB_GET_CON' undeclared
Message-Id: <20121015005944.GC24935@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121012170109.GD20312@localhost> <s5h7gquixlv.wl%tiwai@suse.de>
 <20121014023953.GA8713@localhost>
In-Reply-To: <20121014023953.GA8713@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Sun, Oct 14, 2012 at 10:39:53AM +0800, Fengguang Wu wrote:

> OK. Takashi, Mark, the build system can now avoid testing selected
> trees during the merge window. Shall I add your trees to the list?

For me I'd really want to be able to keep the for-next branch covered,
it's better to have the false positives than to loose that coverage.
