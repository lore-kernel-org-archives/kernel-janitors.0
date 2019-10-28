From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 28 Oct 2019 01:45:11 +0000
Subject: [PATCH -next] ASoC: SOF: select SND_INTEL_DSP_CONFIG in SND_SOC_SOF_PCI
Message-Id: <20191028014511.73472-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com, rdunlap@infradead.org, ranjani.sridharan@linux.intel.com, arnd@arndb.de
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

When SND_SOC_SOF_PCI=y, and SND_INTEL_DSP_CONFIG=m, below
errors can be seen:
sound/soc/sof/sof-pci-dev.o: In function `sof_pci_probe':
sof-pci-dev.c:(.text+0xb9): undefined reference to
`snd_intel_dsp_driver_probe'

After commit 82d9d54a6c0e ("ALSA: hda: add Intel DSP
configuration / probe code"), sof_pci_probe() will call
snd_intel_dsp_driver_probe(), so it should select
SND_INTEL_DSP_CONFIG in Kconfig SND_SOC_SOF_PCI.

Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 sound/soc/sof/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 56a3ab6..a9b2be2 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -16,6 +16,7 @@ config SND_SOC_SOF_PCI
 	select SND_SOC_ACPI if ACPI
 	select SND_SOC_SOF_OPTIONS
 	select SND_SOC_SOF_INTEL_PCI if SND_SOC_SOF_INTEL_TOPLEVEL
+	select SND_INTEL_DSP_CONFIG
 	help
 	  This adds support for PCI enumeration. This option is
 	  required to enable Intel Skylake+ devices
-- 
2.7.4
