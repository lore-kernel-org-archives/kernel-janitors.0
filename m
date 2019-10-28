From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 28 Oct 2019 01:53:22 +0000
Subject: Re: [PATCH -next] ASoC: SOF: select SND_INTEL_DSP_CONFIG in SND_SOC_SOF_PCI
Message-Id: <68a432df-81d4-dc54-b836-f58981d78491@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191028014511.73472-1-maowenan@huawei.com>
In-Reply-To: <20191028014511.73472-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, daniel.baluta@nxp.com, rdunlap@infradead.org, ranjani.sridharan@linux.intel.com, arnd@arndb.de
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 10/27/19 8:45 PM, Mao Wenan wrote:
> When SND_SOC_SOF_PCI=y, and SND_INTEL_DSP_CONFIG=m, below
> errors can be seen:
> sound/soc/sof/sof-pci-dev.o: In function `sof_pci_probe':
> sof-pci-dev.c:(.text+0xb9): undefined reference to
> `snd_intel_dsp_driver_probe'
> 
> After commit 82d9d54a6c0e ("ALSA: hda: add Intel DSP
> configuration / probe code"), sof_pci_probe() will call
> snd_intel_dsp_driver_probe(), so it should select
> SND_INTEL_DSP_CONFIG in Kconfig SND_SOC_SOF_PCI.
> 
> Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>   sound/soc/sof/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
> index 56a3ab6..a9b2be2 100644
> --- a/sound/soc/sof/Kconfig
> +++ b/sound/soc/sof/Kconfig
> @@ -16,6 +16,7 @@ config SND_SOC_SOF_PCI
>   	select SND_SOC_ACPI if ACPI
>   	select SND_SOC_SOF_OPTIONS
>   	select SND_SOC_SOF_INTEL_PCI if SND_SOC_SOF_INTEL_TOPLEVEL
> +	select SND_INTEL_DSP_CONFIG

The problem may be real but the fix should be in 
sound/sof/sof/intel/Kconfig, e.g. something like:

config SND_SOC_SOF_HDA_COMMON
	tristate
	select SND_SOC_SOF_INTEL_COMMON
+	select SND_INTEL_DSP_CONFIG
	select SND_SOC_SOF_HDA_LINK_BASELINE


I have another patch coming to replace the Intel stuff on the line above.

>   	help
>   	  This adds support for PCI enumeration. This option is
>   	  required to enable Intel Skylake+ devices
> 
