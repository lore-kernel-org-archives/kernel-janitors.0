From: "Jie, Yang" <yang.jie@intel.com>
Date: Mon, 27 Apr 2015 07:23:32 +0000
Subject: RE: [PATCH] ASoC: Intel: fix Coccinelle kfree warning
Message-Id: <E7B1D079BA13FB44A978CC8F69C7D6A905520746@SHSMSX101.ccr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430062932-26668-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1430062932-26668-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Firo Yang <firogm@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.de" <tiwai@suse.de>, "Lu, Han" <han.lu@intel.com>, "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>, "Piskorski, Pawel" <pawel.piskorski@intel.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Jin, Yao" <yao.jin@intel.com>

> -----Original Message-----
> From: Firo Yang [mailto:firogm@gmail.com]
> Sent: Sunday, April 26, 2015 11:42 PM
> To: lgirdwood@gmail.com
> Cc: kernel-janitors@vger.kernel.org; broonie@kernel.org; perex@perex.cz;
> tiwai@suse.de; Jie, Yang; Lu, Han; jarkko.nikula@linux.intel.com; Piskors=
ki,
> Pawel; alsa-devel@alsa-project.org; Firo Yang
> Subject: [PATCH] ASoC: Intel: fix Coccinelle kfree warning
>=20
> It's not necessary to use kfree() to free memory allocated with devm_kzal=
loc
> in a probe function and using kfree leads to a double free.
>=20
> Signed-off-by: Firo Yang <firogm@gmail.com>
> ---
>  sound/soc/intel/haswell/sst-haswell-ipc.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/sound/soc/intel/haswell/sst-haswell-ipc.c
> b/sound/soc/intel/haswell/sst-haswell-ipc.c
> index 344a1e9..324eceb 100644
> --- a/sound/soc/intel/haswell/sst-haswell-ipc.c
> +++ b/sound/soc/intel/haswell/sst-haswell-ipc.c
> @@ -2201,7 +2201,6 @@ dma_err:
>  dsp_new_err:
>  	sst_ipc_fini(ipc);
>  ipc_init_err:
> -	kfree(hsw);
=20
It has been fixed by Jin Yao 2 weeks ago:
http://git.kernel.org/cgit/linux/kernel/git/broonie/sound.git/commit/?h=3Df=
or-next&id=AC98b4c015b50b1e452f8d55b612320be7f80825

~Keyon

>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(sst_hsw_dsp_init);
> --
> 2.1.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
