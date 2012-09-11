From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Tue, 11 Sep 2012 03:26:21 +0000
Subject: Re: [asoc:for-next 110/115] sound/soc/soc-core.c:901 soc_bind_dai_link() error: we previously assume
Message-Id: <20120911032619.GA4541@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120911030003.GB23365@localhost>
In-Reply-To: <20120911030003.GB23365@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Timur Tabi <timur@freescale.com>

On Tue, Sep 11, 2012 at 11:00:03AM +0800, Fengguang Wu wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> head:   bffb28a4233d25d37a444785f766e98a041b4413
> commit: a6179d2741640a1ec88a1c5b9c2c28bdf45666db [110/115] ASoC: core: display the platform node name if there is no platform name
> 
> All smatch warnings:
> 
> + sound/soc/soc-core.c:901 soc_bind_dai_link() error: we previously assumed 'dai_link->platform_of_node' could be null (see line 887)

I've dropped the patch.
