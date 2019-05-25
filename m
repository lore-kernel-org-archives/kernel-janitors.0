From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
Date: Sat, 25 May 2019 05:45:57 +0000
Subject: =?UTF-8?Q?Re:_[alsa-devel]_[PATCH][next]_ALSA:_firewire-lib:_remove_redu?= =?UTF-8?Q?ndant=09assignm
Message-Id: <9fe864d1-db6c-4b72-bfa3-3a1c638f1fae@www.fastmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190524213351.24594-1-colin.king@canonical.com>
In-Reply-To: <20190524213351.24594-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On Sat, May 25, 2019, at 06:35, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The assignement to cip_header is redundant as the value never
> read and it is being re-assigned in the if and else paths of
> the following if statement. Clean up the code by removing it.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/firewire/amdtp-stream.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/sound/firewire/amdtp-stream.c=20
> b/sound/firewire/amdtp-stream.c
> index 2d9c764061d1..4236955bbf57 100644
> --- a/sound/firewire/amdtp-stream.c
> +++ b/sound/firewire/amdtp-stream.c
> @@ -675,7 +675,6 @@ static int handle_in_packet(struct amdtp_stream *s,=20
> unsigned int cycle,
>  		return -EIO;
>  	}
> =20
> -	cip_header =3D ctx_header + 2;
>  	if (!(s->flags & CIP_NO_HEADER)) {
>  		cip_header =3D &ctx_header[2];
>  		err =3D check_cip_header(s, cip_header, payload_length,

Thanks for the fix. I've already posted further patch for refactoring
and this was also fixed by a commit 98e3e43b599d ("
ALSA: firewire-lib: refactoring to obsolete IR packet handler").

https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=
=98e3e43b599d742c104864c6772a251025ffb52b

Thanks


Takashi Sakamoto
