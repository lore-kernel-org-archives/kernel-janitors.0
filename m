From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 04 Oct 2006 16:11:21 +0000
Subject: Re: [KJ] [Alsa-devel] [PATCH] sound/usb/usbaudio: Handle return
Message-Id: <s5hk63gjc2e.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

At Mon, 2 Oct 2006 12:52:59 +0200,
Tobias Klauser wrote:
>=20
> Handle the return value of usb_register() in the module_init function.
>=20
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Thanks, applied to ALSA tree now.


Takashi

>=20
> ---
>  sound/usb/usbaudio.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/usb/usbaudio.c b/sound/usb/usbaudio.c
> index a42acf6..191c811 100644
> --- a/sound/usb/usbaudio.c
> +++ b/sound/usb/usbaudio.c
> @@ -3576,8 +3576,7 @@ static int __init snd_usb_audio_init(voi
>  		printk(KERN_WARNING "invalid nrpacks value.\n");
>  		return -EINVAL;
>  	}
> -	usb_register(&usb_audio_driver);
> -	return 0;
> +	return usb_register(&usb_audio_driver);
>  }
> =20
> =20
> --=20
> 1.4.2
>=20
>=20
> -------------------------------------------------------------------------
> Take Surveys. Earn Cash. Influence the Future of IT
> Join SourceForge.net's Techsay panel and you'll get the chance to share y=
our
> opinions on IT & business topics through brief surveys -- and earn cash
> http://www.techsay.com/default.php?page=3Djoin.php&p=3Dsourceforge&CID=DE=
VDEV
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/alsa-devel
>=20
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
