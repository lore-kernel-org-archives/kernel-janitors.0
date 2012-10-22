From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 22 Oct 2012 09:17:38 +0000
Subject: Re: [sound-unstable:topic/hda-spdif-fix 99/124] ERROR: "snd_dmaengine_pcm_open" [sound/soc/omap/snd-
Message-Id: <20121022091738.GA8902@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5083733a.T3zEi6cLE4psrO1W%fengguang.wu@intel.com>
 <50850D7D.8050402@ti.com>
In-Reply-To: <50850D7D.8050402@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@ti.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Mon, Oct 22, 2012 at 11:10:21AM +0200, P=C3=A9ter Ujfalusi wrote:
> Hi,
>=20
> On 10/21/2012 05:59 AM, Fengguang Wu wrote:
> > Hi Peter,
> >=20
> > FYI, kernel build failed on
> >=20
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-unsta=
ble.git topic/hda-spdif-fix
> > head:   afc51e492b36bd61b46f4d70dd646678d96f5f97
> > commit: e7736cdea223f3a5b867c359fb35cf08250dd771 [99/124] dmaengine: Ad=
d flags parameter to dmaengine_prep_dma_cyclic()
> > config: arm-omap2plus_defconfig # make ARCH=3Darm omap2plus_defconfig
> >=20
> > All error/warnings:
> >=20
> > ERROR: "snd_hwparams_to_dma_slave_config" [sound/soc/omap/snd-soc-omap.=
ko] undefined!
> > ERROR: "snd_dmaengine_pcm_pointer" [sound/soc/omap/snd-soc-omap.ko] und=
efined!
> > ERROR: "snd_dmaengine_pcm_open" [sound/soc/omap/snd-soc-omap.ko] undefi=
ned!
> > ERROR: "snd_dmaengine_pcm_close" [sound/soc/omap/snd-soc-omap.ko] undef=
ined!
> > ERROR: "snd_dmaengine_pcm_get_chan" [sound/soc/omap/snd-soc-omap.ko] un=
defined!
> > ERROR: "snd_dmaengine_pcm_trigger" [sound/soc/omap/snd-soc-omap.ko] und=
efined!
>=20
> This has been fixed by the following commit (already in mainline):
> 961a7ae ASoC: dmaengine: Correct Makefile when sound is built as module

Sorry about that! I've fixed the script to test that case and avoid
reporting fixed errors in upstream.

Thanks,
Fengguang
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
