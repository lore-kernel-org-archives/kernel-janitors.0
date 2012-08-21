From: Vinod Koul <vinod.koul@linux.intel.com>
Date: Tue, 21 Aug 2012 06:37:31 +0000
Subject: Re: FW: [asoc:for-next 100/102] sound/soc/soc-compress.c:106:2-45: code aligned with following code
Message-Id: <1345530331.1895.7.camel@vkoul-udesk3>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120821002516.GB10292@localhost>
In-Reply-To: <20120821002516.GB10292@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Wu, Fengguang wrote:
> 
> Hi Namarta,
> 
> FYI, there are new coccinelle warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> head:   10e1e44f261e84f8663592f1a33119801b2bae57
> commit: 1245b7005de02d5bfa0c321df925f5b6c83c99e1 [100/102] ASoC: add compress stream support
> 
> All coccinelle warnings:
> 
> + sound/soc/soc-compress.c:106:2-45: code aligned with following code on line 107
> 
> vim +106 sound/soc/soc-compress.c
>    103			rtd->dai_link->compr_ops->shutdown(cstream);
>    104	
>    105		if (platform->driver->compr_ops && platform->driver->compr_ops->free)
>  > 106			platform->driver->compr_ops->free(cstream);
>    107			cpu_dai->runtime = NULL;
>    108	
>    109		if (cstream->direction = SND_COMPRESS_PLAYBACK) {
Ah, a bad miss, will send the patch for this

-- 
~Vinod

