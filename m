From: =?ISO-8859-1?Q?P=E9ter_Ujfalusi?= <peter.ujfalusi@ti.com>
Date: Mon, 22 Oct 2012 09:10:21 +0000
Subject: Re: [sound-unstable:topic/hda-spdif-fix 99/124] ERROR: "snd_dmaengine_pcm_open" [sound/soc/omap/snd-
Message-Id: <50850D7D.8050402@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5083733a.T3zEi6cLE4psrO1W%fengguang.wu@intel.com>
In-Reply-To: <5083733a.T3zEi6cLE4psrO1W%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

Hi,

On 10/21/2012 05:59 AM, Fengguang Wu wrote:
> Hi Peter,
>=20
> FYI, kernel build failed on
>=20
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-unstabl=
e.git topic/hda-spdif-fix
> head:   afc51e492b36bd61b46f4d70dd646678d96f5f97
> commit: e7736cdea223f3a5b867c359fb35cf08250dd771 [99/124] dmaengine: Add =
flags parameter to dmaengine_prep_dma_cyclic()
> config: arm-omap2plus_defconfig # make ARCH=3Darm omap2plus_defconfig
>=20
> All error/warnings:
>=20
> ERROR: "snd_hwparams_to_dma_slave_config" [sound/soc/omap/snd-soc-omap.ko=
] undefined!
> ERROR: "snd_dmaengine_pcm_pointer" [sound/soc/omap/snd-soc-omap.ko] undef=
ined!
> ERROR: "snd_dmaengine_pcm_open" [sound/soc/omap/snd-soc-omap.ko] undefine=
d!
> ERROR: "snd_dmaengine_pcm_close" [sound/soc/omap/snd-soc-omap.ko] undefin=
ed!
> ERROR: "snd_dmaengine_pcm_get_chan" [sound/soc/omap/snd-soc-omap.ko] unde=
fined!
> ERROR: "snd_dmaengine_pcm_trigger" [sound/soc/omap/snd-soc-omap.ko] undef=
ined!

This has been fixed by the following commit (already in mainline):
961a7ae ASoC: dmaengine: Correct Makefile when sound is built as module

--=20
P=E9ter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
