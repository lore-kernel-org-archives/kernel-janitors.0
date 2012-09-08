From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 08 Sep 2012 01:51:06 +0000
Subject: sound/soc/soc-dapm.c:1023:4: error: implicit declaration of function 'regulator_allow_bypass'
Message-Id: <20120908015106.GA19743@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120908014450.GB19345@localhost>
In-Reply-To: <20120908014450.GB19345@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

[add the missing subject line..]

On Sat, Sep 08, 2012 at 09:44:50AM +0800, Fengguang Wu wrote:
> Hi Mark,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> head:   e8bb382aa74747f23e2903c15e48e9f06de5c60a
> commit: 9ad4ba77112a3700129cdb142796a54680baa266 [100/103] ASoC: dapm: Allow regulators to bypass as well as disable when idle
> config: x86_64-allmodconfig (attached as .config)
> 
> All related error/warning messages:
> 
> sound/soc/soc-dapm.c: In function 'dapm_regulator_event':
> sound/soc/soc-dapm.c:1023:4: error: implicit declaration of function 'regulator_allow_bypass' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> 
> vim +1023 sound/soc/soc-dapm.c
>   1018	{
>   1019		int ret;
>   1020	
>   1021		if (SND_SOC_DAPM_EVENT_ON(event)) {
>   1022			if (w->invert & SND_SOC_DAPM_REGULATOR_BYPASS) {
> > 1023				ret = regulator_allow_bypass(w->regulator, true);
>   1024				if (ret != 0)
>   1025					dev_warn(w->dapm->dev,
>   1026						 "Failed to bypass %s: %d\n",
>   1027						 w->name, ret);
>   1028			}
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

