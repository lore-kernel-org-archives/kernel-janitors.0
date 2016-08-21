From: Joe Perches <joe@perches.com>
Date: Sun, 21 Aug 2016 19:51:34 +0000
Subject: Re: [PATCH 2/2] ALSA: compress: Reduce the scope for two variables in snd_compr_set_params()
Message-Id: <1471809094.3746.17.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
         <7233eb00-a941-4935-dce2-7cb907272d41@users.sourceforge.net>
         <03eac1fe-ff33-1759-9c2a-7914f1c6de45@users.sourceforge.net>
In-Reply-To: <03eac1fe-ff33-1759-9c2a-7914f1c6de45@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, 2016-08-21 at 21:45 +0200, SF Markus Elfring wrote:
> Reduce the scope for the local variables to an if branch.
[]
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
[]
> @@ -545,14 +545,14 @@ static int snd_compress_check_input(struct snd_comp=
r_params *params)
> =A0static int
> =A0snd_compr_set_params(struct snd_compr_stream *stream, unsigned long ar=
g)
> =A0{
> -	struct snd_compr_params *params;
> -	int retval;
> -
> =A0	if (stream->runtime->state =3D SNDRV_PCM_STATE_OPEN) {

Likely better not reducing variable scope but changing:

=A0	if (stream->runtime->state =3D SNDRV_PCM_STATE_OPEN)

to

	if (stream->runtime->state !=3D SNDRV_PCM_STATE_OPEN)
		return -EPERM;

and unindenting the remainder of the code one level instead.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
